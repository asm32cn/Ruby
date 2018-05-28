#!/usr/bin/env ruby
# -*- coding: utf-8 -*-

# ruby-bucket-sort-demo-1.rb

class BucketSortDemo1
	MAX = 100
	BN = 5
	C = Array.new(BN)
	@@nFactor = MAX % BN == 0 ? MAX / BN : MAX / BN + 1

	def DisplayData(data)
		puts data.join(', ')
	end

	def BucketSort(data)
		CountingSort data
		n = data.size
		for i in 0 .. BN - 1
			nLeft = C[i]
			nRight = (i == BN - 1 ? n - 1 : C[i + 1] - 1)
			if nLeft < nRight
				InsertionSort data, nLeft, nRight
			end
		end
	end

	def CountingSort(data)
		def MapToBucket(x)
			return x / @@nFactor
		end

		n = data.size
		for i in 0 .. BN - 1
			C[i] = 0
		end
		for i in 0 .. n - 1
			C[MapToBucket data[i]] += 1
		end
		for i in 1 .. BN - 1
			C[i] += C[i - 1]
		end
		ba = Array.new(n)
		for i in (n - 1).downto(0)
			ba[C[MapToBucket data[i]] -= 1] = data[i]
		end
		for i in 0 .. n - 1
			data[i] = ba[i]
		end
	end

	def InsertionSort(data, nLeft, nRight)
		for i in nLeft + 1 .. nRight
			nGet = data[i]
			j = i - 1
			while j >= nLeft && data[j] > nGet
				data[j + 1] = data[j]
				j -= 1
			end
			data[j + 1] = nGet
		end
	end
end

def main
	# data = Array[41, 67, 34, 0, 69, 24, 78, 58, 62, 64, 5, 45, 81, 27, 61, 91, 95, 42, 27, 36]
	data = Array[76, 11, 11, 43, 78, 35, 39, 27, 16, 55, 1, 41, 24, 19, 54, 7, 78, 69, 65, 82]

	bsd = BucketSortDemo1.new
	bsd.DisplayData data
	bsd.BucketSort data
	bsd.DisplayData data
end

main
