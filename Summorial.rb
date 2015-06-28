# Function to calculate the summorial of a given number
def summorials( number )
	# I'll save all the solutions in a set, so every solution will be
	# unique
	solution = Set.new

	# Calculating all the possible combination giving the requested number,
	# an array containing all numbers until the number itself or 9 (i want
	# the combination of only the first 9 numbers in the worst case 
	# scenario, given the fact that this will be applied to a similar
	# sudoku game) and the final result
	summorial( number, (1..[number, MAX_SUM_TERM].min).to_a, solution )

	# Returning the found solution
	return solution 
end

# Function that finds the summorial of a given number and the number of components
def summorial( number, components, solution )

	# If the sum of the current value equals the number, then i have found
	# a possible combination
	value = (1..[number, MAX_SUM_TERM].min).to_a - components
	if value.inject{ |sum, x| sum + x }.to_i == number
		solution.add( value )
		return solution
	end

	# If there are more numbers to be tested, i'll go recursively on them
	if !components.empty?
		i = 0
		while i < components.length do
			# Saving the number so i could reinsert it after and choosing 
			# a different one for the next iteration
			temp = components.delete_at( i )
			summorial( number, components, solution )
			components.insert( i, temp )
			i += 1
		end
	end
	
end

# Function for printing the solution in a human readable way
def print_solution( number, solution )

	# Dividing the solution, which is a set structure, into a set of sets
	# divided per number of terms
	terms = solution.divide{ |i| i.length }

	printf "Number #{number}:\n"
	terms.to_a.each{ |x| 
		printf "\t#{x.to_a[0].length} terms: "
		x.to_a.each{ |y| printf "#{y} " }
		printf "\n"
	}
end
