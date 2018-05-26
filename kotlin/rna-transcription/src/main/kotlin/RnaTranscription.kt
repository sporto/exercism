fun mapChar(c: Char): Char {
	return when (c) {
		'G' -> 'C'
		'C' -> 'G'
		'A' -> 'T'
		'U' -> 'A'
		else -> c
	}
}

fun transcribeToRna(dna: String): String {
	return dna.map { c -> mapChar(c) }.joinToString()
}
