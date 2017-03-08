require 'minitest/autorun'
require_relative '../lib/hex_string'

class Set01Test < Minitest::Test

require 'base64'

	def test_c01
		input = '49276d206b696c6c696e6720796f757220627261696e206c696b65206120706f69736f6e6f7573206d757368726f6f6d'
		output = 'SSdtIGtpbGxpbmcgeW91ciBicmFpbiBsaWtlIGEgcG9pc29ub3VzIG11c2hyb29t'
		assert_equal output, Base64.strict_encode64( [input].pack('H*') )
	end

	def test_c02
		input = '1c0111001f010100061a024b53535009181c'
		output = '746865206b696420646f6e277420706c6179'
		another = '686974207468652062756c6c277320657965'

		assert_equal output, ([input].pack("H*").bytes.zip( [another].pack('H*').bytes ).map do |i|
			i.first ^ i.last
		end.map{|i| i.to_s(16)}.join )
	end
end
