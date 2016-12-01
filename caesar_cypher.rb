class Cypher

	def initialize(sentence, shift)
		@sentence = sentence
		@shift = shift
		@output = ""
	end

	def convert(z, s)
		z=z.ord
		if z-s < 97
			z=122-(s-(z-96))
		else
			z=z-s
		end
		return z.chr
	end

	def translate
		@sentence.each_char do |x|
			if x.match(/\w/) && x==x.upcase
				x=x.downcase
				s=convert(x, @shift)
				@output << s.upcase
			elsif x.match(/\w/)
				@output << convert(x, @shift)
			else
				@output << x
			end
		end
		return @output
	end

end

=begin
a = Cypher.new("abcde", 3)
puts a.translate
=end