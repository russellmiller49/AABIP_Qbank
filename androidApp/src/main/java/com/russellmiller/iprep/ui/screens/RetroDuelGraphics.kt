package com.russellmiller.iprep.ui.screens

import androidx.compose.foundation.Canvas
import androidx.compose.foundation.background
import androidx.compose.foundation.border
import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.Row
import androidx.compose.foundation.layout.fillMaxHeight
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.height
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.layout.size
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.alpha
import androidx.compose.ui.geometry.Offset
import androidx.compose.ui.geometry.Size
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.graphics.Path
import androidx.compose.ui.graphics.drawscope.Fill
import androidx.compose.ui.text.font.FontFamily
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp

// --- RETRO PALETTE ---
object RetroColors {
    val SkyBlue = Color(0xFF62A6FF)
    val FloorTan = Color(0xFFD4A86A)
    val FloorDark = Color(0xFFA67C45)
    val MedicWhite = Color(0xFFFFFFFF)
    val MedicBlue = Color(0xFF2255AA)
    val MedicSkin = Color(0xFFFFCCAA)
    val VirusGreen = Color(0xFF44AA22)
    val VirusDark = Color(0xFF225511)
    val VirusSpot = Color(0xFFAA44AA)
    val HPRed = Color(0xFFE71D36)
    val HPYellow = Color(0xFFFF9F1C)
    val HPGreen = Color(0xFF2EC4B6)
    val Border = Color.Black
}

// --- 1. PIXEL ART ENGINE ---

/**
 * Renders a grid of integers as pixel art.
 * 0 = Transparent
 * 1..N = Colors mapped from the palette
 */
@Composable
fun PixelSprite(
    grid: List<String>,
    palette: Map<Char, Color>,
    pixelSize: Float = 12f,
    modifier: Modifier = Modifier
) {
    val height = grid.size
    val width = grid.firstOrNull()?.length ?: 0

    Canvas(modifier = modifier.size((width * pixelSize).dp, (height * pixelSize).dp)) {
        grid.forEachIndexed { rowIndex, rowStr ->
            rowStr.forEachIndexed { colIndex, char ->
                val color = palette[char]
                if (color != null) {
                    drawRect(
                        color = color,
                        topLeft = Offset(colIndex * size.width / width, rowIndex * size.height / height),
                        size = Size(size.width / width + 1f, size.height / height + 1f)
                    )
                }
            }
        }
    }
}

// --- 2. SPRITE DEFINITIONS ---

@Composable
fun RetroMedic(modifier: Modifier = Modifier, isHit: Boolean = false) {
    // 16x16 Pixel Art Medic
    // . = Trans, W = White, B = Blue, S = Skin, R = Red (Cross)
    val grid = listOf(
        "....WWWWWW......",
        "...WWWWWWWW.....",
        "...WWRWWRWW.....",
        "...WWWWWWWW.....",
        "....SSSSSS......",
        "....SBSBSS......",
        "....SSSSSS......",
        "...BBBBBBBB.....",
        "..BBBBBBBBBB....",
        "..BBBBBBBBBB....",
        "..BB..BB..BB....",
        "......BB........",
        ".....BBBB.......",
        ".....BBBB.......",
        "....BB..BB......",
        "...BB....BB....."
    )

    val palette = mapOf(
        'W' to RetroColors.MedicWhite,
        'B' to RetroColors.MedicBlue,
        'S' to RetroColors.MedicSkin,
        'R' to RetroColors.HPRed
    )

    val alpha = if (isHit) 0.3f else 1.0f

    PixelSprite(
        grid = grid,
        palette = palette,
        modifier = modifier.alpha(alpha)
    )
}

@Composable
fun RetroVirus(modifier: Modifier = Modifier, isHit: Boolean = false, primaryColor: Color = RetroColors.VirusGreen) {
    // 16x16 Pixel Art Virus
    // G = Green (Body), D = Dark (Spikes), P = Purple (Spots), E = Eye
    val grid = listOf(
        "......D..D......",
        "....D.G..G.D....",
        "...DGGGGGGGGD...",
        "..DGGPGGGPGGGD..",
        ".DGGGGGGGGGGGGD.",
        ".GGPEEEGGGEEEGP.",
        ".GGPEBEGGGEBEGP.",
        "DGGGPEEGGGEEPGGD",
        ".GGGGGGGGGGGGGG.",
        ".DGGGGPPGGGGGGD.",
        "..DGGPPPPGGGGD..",
        "...DGGGGGGGGD...",
        "....D.G..G.D....",
        "......D..D......",
        "................",
        "................"
    )

    val palette = mapOf(
        'G' to primaryColor,
        'D' to RetroColors.VirusDark,
        'P' to RetroColors.VirusSpot,
        'E' to Color.White,
        'B' to Color.Black
    )

    val alpha = if (isHit) 0.3f else 1.0f

    PixelSprite(
        grid = grid,
        palette = palette,
        modifier = modifier.alpha(alpha)
    )
}

// --- 3. RETRO UI COMPONENTS ---

@Composable
fun RetroHealthBar(
    current: Int,
    max: Int,
    label: String,
    modifier: Modifier = Modifier
) {
    val hpPercent = current.toFloat() / max.coerceAtLeast(1)
    val blocksTotal = 10
    val blocksFilled = (hpPercent * blocksTotal).toInt()

    Column(modifier = modifier) {
        Text(
            text = label.uppercase(),
            fontSize = 12.sp,
            fontWeight = FontWeight.Black,
            fontFamily = FontFamily.Monospace,
            color = Color.White,
            modifier = Modifier.padding(bottom = 4.dp)
        )

        Row(
            modifier = Modifier
                .height(16.dp)
                .border(2.dp, Color.Black)
                .background(Color.Gray)
                .padding(2.dp),
            horizontalArrangement = Arrangement.spacedBy(2.dp)
        ) {
            repeat(blocksTotal) { index ->
                val color = when {
                    index >= blocksFilled -> Color.Black.copy(alpha = 0.5f)
                    hpPercent > 0.5f -> RetroColors.HPGreen
                    hpPercent > 0.25f -> RetroColors.HPYellow
                    else -> RetroColors.HPRed
                }

                Box(
                    modifier = Modifier
                        .weight(1f)
                        .fillMaxHeight()
                        .background(color)
                )
            }
        }
    }
}

// --- 4. RETRO BACKGROUND ---

@Composable
fun RetroDojoBackground(modifier: Modifier = Modifier) {
    Canvas(modifier = modifier.fillMaxSize()) {
        drawRect(color = RetroColors.SkyBlue, size = Size(size.width, size.height * 0.6f))

        val floorTop = size.height * 0.6f
        drawRect(
            color = RetroColors.FloorTan,
            topLeft = Offset(0f, floorTop),
            size = Size(size.width, size.height - floorTop)
        )

        val path = Path()
        val centerX = size.width / 2
        val lines = 8

        for (i in -lines..lines) {
            val xStart = centerX + (i * 20f)
            val xEnd = centerX + (i * 150f)

            path.reset()
            path.moveTo(xStart, floorTop)
            path.lineTo(xEnd, size.height)
            path.lineTo(xEnd + 5f, size.height)
            path.lineTo(xStart + 2f, floorTop)

            drawPath(path, RetroColors.FloorDark, style = Fill)
        }

        drawRect(
            color = Color.Black,
            topLeft = Offset(0f, floorTop - 2f),
            size = Size(size.width, 4f)
        )
    }
}
