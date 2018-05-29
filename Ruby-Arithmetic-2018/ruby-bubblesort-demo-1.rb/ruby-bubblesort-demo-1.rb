#!/usr/bin/ruby
# -*- coding: utf-8 -*-

# ruby-bubblesort-demo-1.rb

class BubbleSortDemo1
	def DisplayData(data)
		puts data.join(', ')
	end

	def BubbleSort(data)
		n = data.size # data.length
		for j in 0 .. (n - 2)
			for i in 0 .. (n - 2 - j)
				if data[i] > data[i + 1] then
					data[i], data[i + 1] = data[i + 1], data[i]
				end
			end
		end
	end
end

def main
	# data = Array[41, 67, 34, 0, 69, 24, 78, 58, 62, 64, 5, 45, 81, 27, 61, 91, 95, 42, 27, 36]
	data = Array[76, 11, 11, 43, 78, 35, 39, 27, 16, 55, 1, 41, 24, 19, 54, 7, 78, 69, 65, 82]

	bsd = BubbleSortDemo1.new
	bsd.DisplayData(data)
	bsd.BubbleSort(data)
	bsd.DisplayData(data)
end

main