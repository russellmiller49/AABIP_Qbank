package com.russellmiller.iprep.shared.assets

import kotlinx.serialization.Serializable
import kotlinx.serialization.decodeFromString
import kotlinx.serialization.json.Json

@Serializable
data class AssetEntry(
    val id: String,
    val category: String,
    val path: String,
    val source_pack: String? = null
)

@Serializable
data class AssetsManifest(
    val version: Int = 1,
    val root: String,
    val assets: List<AssetEntry> = emptyList()
)

class AssetRegistry(private val manifest: AssetsManifest) {
    private val byId = manifest.assets.associateBy { it.id }

    fun path(id: String): String =
        byId[id]?.path ?: error("Missing asset id: $id")

    fun tryPath(id: String): String? = byId[id]?.path
}

fun loadAssetRegistry(): AssetRegistry {
    val jsonString = loadAssetsManifestJson()
        ?: error("assets/manifest/assets_manifest.json missing from bundle resources")

    val json = Json { ignoreUnknownKeys = true }
    val manifest = json.decodeFromString<AssetsManifest>(jsonString)

    val normalized = manifest.copy(
        assets = manifest.assets.map { entry ->
            entry.copy(path = entry.path.toResourcePath())
        }
    )

    return AssetRegistry(normalized)
}

fun tryLoadAssetRegistry(): AssetRegistry? = runCatching { loadAssetRegistry() }.getOrNull()

private fun String.toResourcePath(): String {
    val normalized = replace("\\", "/")
    return normalized.substringAfter("shared/src/commonMain/resources/", normalized)
}

internal expect fun loadAssetsManifestJson(): String?
