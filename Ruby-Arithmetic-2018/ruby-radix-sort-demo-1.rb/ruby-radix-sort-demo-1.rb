#!/usr/bin/env ruby
# -*- coding: utf-8 -*-

# ruby-radix-sort-demo-1.rb

class LsdRedixSortDemo1
	DN = 3
	K = 10
	RADIX = [1, 1, 10, 100]
	C = Array.new(K)

	def DisplayData(data)
		puts data.join(', ')
	end

	def LsdRedixSort(data)
		for d in 0 .. DN - 1
			CountSort(data, d)
		end
	end

	def CountSort(data, d)
		n = data.size
		for i in 0 .. K - 1
			C[i] = 0
		end
		for i in 0 .. n - 1
			C[GetDigit(data[i], d)] += 1
		end
		for i in 1 .. K - 1
			C[i] += C[i - 1]
		end
		@B = Array.new(n)
		for i in (n - 1).downto(0)
			@B[C[GetDigit(data[i], d)] -= 1] = data[i]
		end
		for i in 0 .. n - 1
			data[i] = @B[i]
		end
	end

	def GetDigit(x, d)
		return x / RADIX[d] % 10
	end
end

def Main()
	# data = [41, 67, 34, 0, 69, 24, 78, 58, 62, 64, 5, 45, 81, 27, 61, 91, 95, 42, 27, 3]
	data = [76, 11, 11, 43, 78, 35, 39, 27, 16, 55, 1, 41, 24, 19, 54, 7, 78, 69, 65, 82]

	lrsd = LsdRedixSortDemo1.new
	lrsd.DisplayData(data)
	lrsd.LsdRedixSort(data)
	lrsd.DisplayData(data)
end

Main()
