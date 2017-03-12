class CryptoString < String
	def self.from_hex( hex )
		CryptoString.new( [hex].pack 'H*' )
	end

	def self.from_bytes( array )
		CryptoString.new( array.pack 'C*' )
	end
	
	def to_hex
		unpack( 'H*' ).first
	end

	def to_base64
		[self].pack 'm0'
	end

	def xor( other )
		b1 = bytes
		b2 = other.bytes
		if b1.size > b2.size
			b2 = b2 * (b1.size / b2.size)
			b2 = b2 + b2[0,b1.size - b2.size]
		elsif b1.size < b2.size
			return other.xor self
		end
		CryptoString.from_bytes( b1.zip( b2 ).map{|a, b| a ^ b } )
	end

	def english_text_score
		bytes.group_by{|i| i.chr.downcase }.
	end
end
