#!/usr/bin/env ruby
# -*- coding: utf-8 -*-

# ruby-heap-sort-demo-1.rb

class HeapSortDemo1
	def DisplayData(data)
		puts data.join(', ')
	end

	def Swap(data, i, j)
		data[i], data[j] = data[j], data[i]
	end

	def Heapify(data, i, nSize)
		nLeftChild = 2 * i + 1
		nRightChild = 2 * i + 2
		nMax = i
		if nLeftChild < nSize && data[nLeftChild] > data[nMax] then
			nMax = nLeftChild
		end
		if nRightChild < nSize && data[nRightChild] > data[nMax] then
			nMax = nRightChild
		end
		if nMax != i then
			Swap(data, i, nMax)
			Heapify(data, nMax, nSize)
		end
	end

	def HeapSort(data)
		nHeapSize = data.size
		# BuildHeap
		for i in (nHeapSize / 2 - 1).downto(0)
			Heapify(data, i, nHeapSize)
		end
		# HeapSort
		while nHeapSize > 1
			nHeapSize -= 1
			Swap(data, 0, nHeapSize)
			Heapify(data, 0, nHeapSize)
		end
	end
end

def Main()
	# data = [41, 67, 34, 0, 69, 24, 78, 58, 62, 64, 5, 45, 81, 27, 61, 91, 95, 42, 27, 36];
	data = [76, 11, 11, 43, 78, 35, 39, 27, 16, 55, 1, 41, 24, 19, 54, 7, 78, 69, 65, 82];

	hsd = HeapSortDemo1.new
	hsd.DisplayData(data)
	hsd.HeapSort(data)
	hsd.DisplayData(data)
end

Main()
