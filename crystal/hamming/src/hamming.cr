module Hamming
	def self.compute(a, b)
		raise(ArgumentError.new) if a.size != b.size

		a.chars.zip(b.chars)
			.reject { |aa, bb| aa == bb }
			.size
	end
end
