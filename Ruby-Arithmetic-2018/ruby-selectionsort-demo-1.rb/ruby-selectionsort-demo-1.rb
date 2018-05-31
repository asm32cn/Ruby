#!/usr/bin/env ruby
# -*- coding: utf-8 -*-

# ruby-selectionsort-demo-1.rb

class SelectionSortDemo1
	def DisplayData(data)
		puts data.join(', ')
	end

	def SelectionSort(data)
		n = data.size
		for i in 0 .. n - 1
			nMin = i
			for j in i + 1 .. n - 1
				if data[j] < data[nMin] then
					nMin = j
				end
			end
			if nMin != i then
				data[i], data[nMin] = data[nMin], data[i]
			end
		end
	end
end

def Main()
	# data = [41, 67, 34, 0, 69, 24, 78, 58, 62, 64, 5, 45, 81, 27, 61, 91, 95, 42, 27, 36]
	data = [76, 11, 11, 43, 78, 35, 39, 27, 16, 55, 1, 41, 24, 19, 54, 7, 78, 69, 65, 82]

	ssd = SelectionSortDemo1.new
	ssd.DisplayData(data)
	ssd.SelectionSort(data)
	ssd.DisplayData(data)
end

Main()
