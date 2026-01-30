package com.russellmiller.iprep.shared.models

object EnemyDefinitions {
    val allEnemies: List<Enemy> = listOf(
        Enemy(
            id = "airway-assassin",
            name = "Dr. Malice",
            title = "The Airway Assassin",
            description = "Challenges you on CAO, stents, and rigid bronchoscopy.",
            iconName = "lungs.fill",
            themeColor = "#E63946",
            topicBiases = listOf("Airway", "CAO", "stent", "rigid", "MCAO", "ECAC"),
            unlockType = UnlockType.NONE
        ),
        Enemy(
            id = "pleural-phantom",
            name = "The Phantom",
            title = "Pleural Phantom",
            description = "Haunts the pleural space with effusions and pneumothorax.",
            iconName = "waveform.path.ecg",
            themeColor = "#457B9D",
            topicBiases = listOf("Pleural", "effusion", "IPC", "pleurodesis", "pneumothorax"),
            unlockType = UnlockType.DUELS_WON,
            unlockValue = 2
        ),
        Enemy(
            id = "staging-sentinel",
            name = "The Sentinel",
            title = "Staging Sentinel",
            description = "Guards accurate lung cancer staging with EBUS mastery.",
            iconName = "target",
            themeColor = "#2A9D8F",
            topicBiases = listOf("staging", "EBUS", "Lung cancer", "screening", "LDCT"),
            unlockType = UnlockType.DUELS_WON,
            unlockValue = 3
        ),
        Enemy(
            id = "peripheral-prowler",
            name = "The Prowler",
            title = "Peripheral Prowler",
            description = "Lurks in the lung periphery, testing biopsy and navigation.",
            iconName = "scope",
            themeColor = "#F4A261",
            topicBiases = listOf("Peripheral", "biopsy", "cryobiopsy", "navigation", "nodule"),
            unlockType = UnlockType.ENEMY_DEFEATED,
            unlockEnemyId = "staging-sentinel"
        ),
        Enemy(
            id = "thermal-tyrant",
            name = "Lord Ablation",
            title = "The Thermal Tyrant",
            description = "Rules over ablative therapies and early-stage cancer.",
            iconName = "flame.fill",
            themeColor = "#E76F51",
            topicBiases = listOf("Thermal", "Ablat", "Early-Stage", "debridement"),
            unlockType = UnlockType.LEVEL,
            unlockValue = 5
        ),
        Enemy(
            id = "code-commander",
            name = "Administrator X",
            title = "The Code Commander",
            description = "Final boss: coding, billing, anesthesia, and tracheostomy.",
            iconName = "dollarsign.circle.fill",
            themeColor = "#6D6875",
            topicBiases = listOf("Coding", "Billing", "Anesthesia", "tracheostomy"),
            unlockType = UnlockType.DUELS_WON,
            unlockValue = 10
        )
    )

    fun enemy(id: String): Enemy? = allEnemies.find { it.id == id }

    fun unlockedEnemies(profile: PlayerProfile): List<Enemy> =
        allEnemies.filter { it.isUnlocked(profile) }
}

