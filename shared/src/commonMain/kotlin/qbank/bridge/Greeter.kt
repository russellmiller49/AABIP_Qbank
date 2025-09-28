package qbank.bridge

/**
 * Simple Kotlin entry point exposed to Swift to validate the shared module wiring.
 */
class Greeter {
    fun hello(name: String): String = "Hello, $name from Kotlin!"
}
