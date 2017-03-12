require 'minitest/autorun'
require_relative '../lib/crypto_string'

class Set01Test < Minitest::Test

	def test_c01
		input = '49276d206b696c6c696e6720796f757220627261696e206c696b65206120706f69736f6e6f7573206d757368726f6f6d'
		output = 'SSdtIGtpbGxpbmcgeW91ciBicmFpbiBsaWtlIGEgcG9pc29ub3VzIG11c2hyb29t'
		assert_equal output, CryptoString.from_hex( input ).to_base64
	end

	def test_c02
		input = '1c0111001f010100061a024b53535009181c'
		output = '746865206b696420646f6e277420706c6179'
		another = '686974207468652062756c6c277320657965'

		assert_equal output, CryptoString.from_hex( input ).xor( CryptoString.from_hex another ).to_hex
	end

	def test_c03
		input = '1b37373331363f78151b7f2b783431333d78397828372d363c78373e783a393b3736'

		('A'..'z').each do |c|
			p CryptoString.from_hex( input ).xor( CryptoString.new c ).english_text_score
		end
	end
end
