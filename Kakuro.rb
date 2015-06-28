#!/usr/bin/env ruby
# Kakuro based problem: finding all the sum different combinations of a given number

require_relative "Summorial.rb"
require 'set'

# Constants variables
MAX_SUM_TERM = 9
MAX_NUMBER = (1..MAX_SUM_TERM).inject{ |sum, x| sum + x }

puts "Let's start with Kakuro"

# If the user is interested in only one number, he could pass it as the 
# first argument, otherwise all numbers will be calculated
number = ( ARGV[ 0 ] || 0 ).to_i

# Checking if the number requested isn't too high
if number > MAX_NUMBER || number < 0
	abort "#{number} can't be calculated as the sum of the first #{MAX_SUM_TERM} numbers!"
end

# Calculating the summorial of the requested number
if number > 0
	print_solution( number, summorials( number ) )
else
	(1..MAX_NUMBER).each{ |x|
		print_solution( x, summorials( x ) )
	}
end

puts "Cya! (۶•̀ᴗ•́)۶"
