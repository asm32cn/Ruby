#!/usr/bin/env ruby
# -*- coding: utf-8 -*-

# ruby-quicksort-demo-1.rb

class QuickSortDemo1
	def DisplayData(data)
		puts data.join(', ')
	end

	def QuickSort(data, nLeft, nRight)
		if nLeft < nRight then
			nKey = data[nLeft]
			nLow = nLeft
			nHigh = nRight
			while nLow < nHigh
				while nLow < nHigh && data[nHigh] >= nKey
					nHigh -= 1
				end
				data[nLow] = data[nHigh]
				while nLow < nHigh && data[nLow] <= nKey
					nLow += 1
				end
				data[nHigh] = data[nLow]
			end
			data[nLow] = nKey

			QuickSort(data, nLeft, nLow - 1)
			QuickSort(data, nLow + 1, nRight)
		end
	end
end

def Main()
	# data = [41, 67, 34, 0, 69, 24, 78, 58, 62, 64, 5, 45, 81, 27, 61, 91, 95, 42, 27, 36]
	data = [76, 11, 11, 43, 78, 35, 39, 27, 16, 55, 1, 41, 24, 19, 54, 7, 78, 69, 65, 82]

	qsd = QuickSortDemo1.new
	qsd.DisplayData(data)
	qsd.QuickSort(data, 0, data.size - 1)
	qsd.DisplayData(data)
end

Main()
