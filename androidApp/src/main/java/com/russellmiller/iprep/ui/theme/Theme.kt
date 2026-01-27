package com.russellmiller.iprep.ui.theme

import android.app.Activity
import android.os.Build
import androidx.compose.foundation.isSystemInDarkTheme
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.darkColorScheme
import androidx.compose.material3.dynamicDarkColorScheme
import androidx.compose.material3.dynamicLightColorScheme
import androidx.compose.material3.lightColorScheme
import androidx.compose.runtime.Composable
import androidx.compose.runtime.SideEffect
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.graphics.toArgb
import androidx.compose.ui.platform.LocalContext
import androidx.compose.ui.platform.LocalView
import androidx.core.view.WindowCompat

private val DarkColorScheme = darkColorScheme(
    primary = MistBlue,
    onPrimary = MidnightNavy,
    secondary = AtlanticBlue,
    onSecondary = Color.White,
    tertiary = HorizonTeal,
    onTertiary = MidnightNavy,
    background = MidnightNavy,
    onBackground = MistBlue,
    surface = MidnightNavy,
    onSurface = MistBlue,
    surfaceVariant = SoftSlate,
    onSurfaceVariant = MistBlue
)

private val LightColorScheme = lightColorScheme(
    primary = DeepOcean,
    onPrimary = Color.White,
    primaryContainer = AtlanticBlue,
    onPrimaryContainer = Color.White,
    secondary = HorizonTeal,
    onSecondary = Color.White,
    tertiary = CoralAccent,
    onTertiary = Color.White,
    background = CloudWhite,
    onBackground = SoftSlate,
    surface = Color.White,
    onSurface = SoftSlate,
    surfaceVariant = MistBlue.copy(alpha = 0.3f),
    onSurfaceVariant = SoftSlate,
    outline = MistBlue.copy(alpha = 0.5f)
)

@Composable
fun IprepTheme(
    darkTheme: Boolean = isSystemInDarkTheme(),
    dynamicColor: Boolean = false,
    content: @Composable () -> Unit
) {
    val colorScheme = when {
        dynamicColor && Build.VERSION.SDK_INT >= Build.VERSION_CODES.S -> {
            val context = LocalContext.current
            if (darkTheme) dynamicDarkColorScheme(context) else dynamicLightColorScheme(context)
        }

        darkTheme -> DarkColorScheme
        else -> LightColorScheme
    }
    val view = LocalView.current
    if (!view.isInEditMode) {
        SideEffect {
            val window = (view.context as Activity).window
            window.statusBarColor = colorScheme.primary.toArgb()
            WindowCompat.getInsetsController(window, view).isAppearanceLightStatusBars = !darkTheme
        }
    }

    MaterialTheme(
        colorScheme = colorScheme,
        typography = Typography,
        content = content
    )
}
