#!/usr/bin/env ruby
# -*- coding: utf-8 -*-

# ruby-insertion-sort-dichotomy-demo-1.rb

class InsertionSortDichotomyDemo1
	def DisplayData(data)
		puts data.join(', ')
	end

	def InsertionSortDichotomy(data)
		n = data.size
		for i in 1 .. n - 1
			nGet = data[i]
			nLeft = 0
			nRight = i - 1
			while nLeft <= nRight
				nMid = (nLeft + nRight) / 2
				if data[nMid] > nGet then
					nRight = nMid - 1
				else
					nLeft = nMid + 1
				end
			end
			for j in (i - 1).downto(nLeft)
				data[j + 1] = data[j]
			end
			data[nLeft] = nGet
		end
	end
end

def Main()
	# data = [41, 67, 34, 0, 69, 24, 78, 58, 62, 64, 5, 45, 81, 27, 61, 91, 95, 42, 27, 36];
	data = [76, 11, 11, 43, 78, 35, 39, 27, 16, 55, 1, 41, 24, 19, 54, 7, 78, 69, 65, 82]

	isdd = InsertionSortDichotomyDemo1.new
	isdd.DisplayData(data)
	isdd.InsertionSortDichotomy(data)
	isdd.DisplayData(data)
end

Main()
