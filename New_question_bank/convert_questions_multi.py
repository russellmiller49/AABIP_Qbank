import json
import re
import os

# --- Configuration: Define your files and module metadata here ---
FILES_CONFIG = [
    {
        "filename": "Therapeutic.md",
        "id": "therapeutic-bronchoscopy",
        "title": "Therapeutic Bronchoscopy",
        "description": "Techniques for airway obstruction and therapeutic interventions.",
        "difficulty": "hard",
        "estimatedTimeMinutes": 40
    },
    {
        "filename": "BLVR.md",
        "id": "blvr",
        "title": "BLVR",
        "description": "Bronchoscopic Lung Volume Reduction: Patient selection and management.",
        "difficulty": "hard",
        "estimatedTimeMinutes": 35
    },
    {
        "filename": "Pleural_Disease.md",
        "id": "pleural-disease",
        "title": "Pleural Disease",
        "description": "Management of pleural effusions, pneumothorax, and infections.",
        "difficulty": "moderate",
        "estimatedTimeMinutes": 45
    },
    {
        "filename": "Complications_in_Bronchoscopy.md",
        "id": "complications",
        "title": "Complications",
        "description": "Managing emergencies and adverse events during bronchoscopy.",
        "difficulty": "moderate",
        "estimatedTimeMinutes": 25
    },
    {
        "filename": "Peripheral_Bronchoscopy.md",
        "id": "peripheral-bronchoscopy",
        "title": "Peripheral Bronchoscopy",
        "description": "Navigation, nodules, and lung cancer screening.",
        "difficulty": "moderate",
        "estimatedTimeMinutes": 35
    },
    {
        "filename": "Perc_Trach.md",
        "id": "perc-trach",
        "title": "Percutaneous Tracheostomy",
        "description": "Techniques, indications, and management of tracheostomies.",
        "difficulty": "moderate",
        "estimatedTimeMinutes": 20
    },
    {
        "filename": "Conventional_Bronchoscopy.md",
        "id": "conventional-bronchoscopy",
        "title": "Conventional Bronchoscopy",
        "description": "Standard techniques, sampling, and airway anatomy.",
        "difficulty": "easy",
        "estimatedTimeMinutes": 30
    },
    {
        "filename": "BPF_and_prolonged_airleaks.md",
        "id": "bpf",
        "title": "BPF and Air Leaks",
        "description": "Management of Bronchopleural Fistulas and prolonged air leaks.",
        "difficulty": "hard",
        "estimatedTimeMinutes": 25
    },
    {
        "filename": "Other.md",
        "id": "miscellaneous",
        "title": "Miscellaneous",
        "description": "High-yield mixed topics in Interventional Pulmonology.",
        "difficulty": "moderate",
        "estimatedTimeMinutes": 30
    }
]

def clean_text(text):
    """Removes markdown bolding/formatting like ** or ##"""
    text = text.replace("**", "").replace("##", "")
    return text.strip()

def parse_options_block(opt_text):
    """Robustly parses options like (a)..., a)..., or bullet points."""
    options = []
    # Split by lines to handle formatting better
    lines = opt_text.split('\n')
    current_id = None
    current_text = []

    # Regex to identify start of an option: (a), a., A., • (A)
    opt_start_pattern = re.compile(r'^(?:[\•\-\*]\s*)?\(?([a-eA-E])\)?[ \.]\s*(.*)')

    for line in lines:
        line = line.strip()
        if not line: continue

        match = opt_start_pattern.match(line)
        if match:
            # Save previous option if exists
            if current_id:
                options.append({"id": current_id.lower(), "text": " ".join(current_text)})
            
            # Start new option
            current_id = match.group(1)
            current_text = [match.group(2)]
        else:
            # Continuation of previous option
            if current_id:
                current_text.append(line)
    
    # Append the last option
    if current_id:
        options.append({"id": current_id.lower(), "text": " ".join(current_text)})
    
    return options

def parse_questions_from_text(text, module_id):
    # Split text by "### Question" marker
    # The first split element is usually the file header, so we skip it if it's not a question
    raw_blocks = re.split(r'###\s*Question', text, flags=re.IGNORECASE)
    
    parsed_questions = []
    q_count = 0

    for block in raw_blocks:
        if not block.strip(): continue
        
        # Determine if this block is actually a question (must have Options)
        if not re.search(r'###\s*Options', block, re.IGNORECASE):
            continue

        q_obj = {
            "id": f"{module_id}-q{q_count + 1}",
            "number": q_count + 1,
            "prompt": "",
            "options": [],
            "correctOptionId": "",
            "explanation": "",
            "references": [],
            "imageURLs": []
        }

        # --- 1. Extract Prompt ---
        # Everything before "### Options"
        parts = re.split(r'###\s*Options', block, maxsplit=1, flags=re.IGNORECASE)
        q_obj["prompt"] = clean_text(parts[0])

        if len(parts) < 2: continue # Malformed block
        
        rest_of_block = parts[1]

        # --- 2. Extract Options ---
        # Everything between "### Options" and the next header (Discussion/Explanation/Answer)
        opt_match = re.split(r'###\s*(?:Discussion|Explanation)|Correct answer', rest_of_block, maxsplit=1, flags=re.IGNORECASE)
        options_text = opt_match[0]
        q_obj["options"] = parse_options_block(options_text)

        # --- 3. Extract Explanation & Correct Answer ---
        # We search the whole block to find the correct answer indicator
        # Look for "Correct answer: c" or "choice (c) is correct"
        explanation_text = ""
        
        # Try to isolate the discussion part
        disc_search = re.search(r'###\s*(?:Discussion|Explanation)(.*?)(###\s*References|$)', block, re.DOTALL | re.IGNORECASE)
        if disc_search:
            explanation_text = disc_search.group(1).strip()
            q_obj["explanation"] = clean_text(explanation_text)

        # Hunt for the correct answer ID anywhere in the block or explanation
        # Priority 1: Explicit "Correct answer: x" line
        explicit_correct = re.search(r'Correct answer:\s*([a-eA-E])', block, re.IGNORECASE)
        if explicit_correct:
             q_obj["correctOptionId"] = explicit_correct.group(1).lower()
        else:
            # Priority 2: "Choice (c) is correct" inside text
            narrative_correct = re.search(r'(?:choice|option)\s*\(?([a-eA-E])\)?\s*(?:is)?\s*correct', block, re.IGNORECASE)
            if narrative_correct:
                q_obj["correctOptionId"] = narrative_correct.group(1).lower()

        # --- 4. Extract References ---
        ref_search = re.search(r'###\s*References(.*?)$', block, re.DOTALL | re.IGNORECASE)
        if ref_search:
            refs_raw = ref_search.group(1).strip()
            # Split by newlines, clean up bullet points or numbers
            refs_lines = refs_raw.split('\n')
            clean_refs = []
            for r in refs_lines:
                cleaned = re.sub(r'^\d+\.\s*|^\-\s*', '', r.strip())
                if cleaned:
                    clean_refs.append(cleaned)
            q_obj["references"] = clean_refs

        # Validation: Only add if we have prompt and options
        if q_obj["prompt"] and len(q_obj["options"]) >= 2:
            parsed_questions.append(q_obj)
            q_count += 1
        else:
            print(f"Skipping incomplete question in {module_id}: {q_obj['prompt'][:30]}...")

    return parsed_questions

def generate_full_json():
    final_json = {"modules": []}
    
    print(f"Starting conversion for {len(FILES_CONFIG)} files...")

    for config in FILES_CONFIG:
        fname = config["filename"]
        
        if not os.path.exists(fname):
            print(f"ERROR: File '{fname}' not found in current directory. Skipping.")
            continue
            
        with open(fname, 'r', encoding='utf-8') as f:
            text = f.read()
            
        print(f"Processing {fname}...")
        questions = parse_questions_from_text(text, config["id"])
        
        if questions:
            module_obj = {
                "id": config["id"],
                "title": config["title"],
                "description": config["description"],
                "estimatedTimeMinutes": config["estimatedTimeMinutes"],
                "difficulty": config["difficulty"],
                "questionCount": len(questions),
                "questions": questions
            }
            final_json["modules"].append(module_obj)
            print(f"  -> Success: '{config['title']}' added with {len(questions)} questions.")
        else:
            print(f"  -> Warning: No valid questions found in {fname}.")

    # Write output
    output_filename = 'QuestionBank.json'
    with open(output_filename, 'w', encoding='utf-8') as f:
        json.dump(final_json, f, indent=2, ensure_ascii=False)
    
    print(f"\nconversion Complete! Output saved to {output_filename}")

if __name__ == "__main__":
    generate_full_json()