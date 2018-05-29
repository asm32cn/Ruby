#!/usr/bin/env ruby
# -*- coding: utf-8 -*-

# ruby-counting-sort-demo-1.rb

class CountingSortDemo1
	K = 100
	C = Array.new(K)

	def DisplayData(data)
		puts data.join(', ')
	end

	def CountingSort(data)
		n = data.size
		for i in 0 .. K - 1
			C[i] = 0
		end
		for i in 0 .. n - 1
			C[data[i]] += 1
		end
		for i in 1 .. K - 1
			C[i] += C[i - 1]
		end
		@B = Array.new(n)
		for i in (n - 1).downto(0)
			C[data[i]] -= 1
			@B[C[data[i]]] =data[i]
		end
		for i in 0 .. n - 1
			data[i] = @B[i]
		end
	end
end

def Main()
	# data = [41, 67, 34, 0, 69, 24, 78, 58, 62, 64, 5, 45, 81, 27, 61, 91, 95, 42, 27, 36];
	data = [76, 11, 11, 43, 78, 35, 39, 27, 16, 55, 1, 41, 24, 19, 54, 7, 78, 69, 65, 82];

	csd = CountingSortDemo1.new
	csd.DisplayData(data)
	csd.CountingSort(data)
	csd.DisplayData(data)
end

Main()
