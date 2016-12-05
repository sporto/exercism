module Hamming
	def self.compute(a, b)
		raise(ArgumentError.new) if a.size != b.size

		a.split("").zip(b.split(""))
			.reject { |aa, bb| aa == bb }
			.size
	end
end
