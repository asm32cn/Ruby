#!/usr/bin/env ruby
# -*- coding: utf-8 -*-

# ruby-merge-sort-demo-1.rb

class MergeSortDemo1
	def DisplayData(data)
		puts data.join(', ')
	end

	def Merge(data, nLeft, nMid, nRight)
		nLen = nRight - nLeft + 1
		temp = Array.new(nLen)
		nIndex = 0
		i = nLeft
		j = nMid + 1
		while i <= nMid && j <= nRight
			if data[i] <= data[j] then
				temp[nIndex] = data[i]
				i += 1
			else
				temp[nIndex] = data[j]
				j += 1
			end
			nIndex += 1
		end
		while i <= nMid
			temp[nIndex] = data[i]
			nIndex += 1
			i += 1
		end
		while j <= nRight
			temp[nIndex] = data[j]
			nIndex += 1
			j += 1
		end
		for k in 0 .. nLen - 1
			data[nLeft] = temp[k]
			nLeft += 1
		end
	end

	# 递归实现的归并排序(自顶向下)
	def MergeSortRecursion(data, nLeft, nRight)
		# 当待排序的序列长度为1时，递归开始回溯，进行merge操作
		if nLeft == nRight then; return; end

		nMid = (nLeft + nRight) / 2
		MergeSortRecursion(data, nLeft, nMid)
		MergeSortRecursion(data, nMid + 1, nRight)
		Merge(data, nLeft, nMid, nRight)
	end

	# 非递归(迭代)实现的归并排序(自底向上)
	def MergeSortIteration(data)
		# 子数组索引，前一个为A[left ... mid]，后一个为A[mid + 1 ... right]
		n = data.size
		# 子数组的大小i初始为1，每轮翻倍
		i = 1
		while i < n
			nLeft = 0
			# 后一个子数组存在(需要归并)
			while nLeft + 1 < n
				nMid = nLeft + i - 1
				# 后一个子数组大小可能不够
				nRight = nMid + i < n ? nMid + i : n - 1
				Merge(data, nLeft, nMid, nRight)
				# 前一个子数组索引向后移动
				nLeft = nRight + 1
			end
			i *= 2
		end
	end
end

def Main()
	# data1 = [41, 67, 34, 0, 69, 24, 78, 58, 62, 64, 5, 45, 81, 27, 61, 91, 95, 42, 27, 36]
	data1 = [76, 11, 11, 43, 78, 35, 39, 27, 16, 55, 1, 41, 24, 19, 54, 7, 78, 69, 65, 82]
	data2 = [76, 11, 11, 43, 78, 35, 39, 27, 16, 55, 1, 41, 24, 19, 54, 7, 78, 69, 65, 82]

	msd = MergeSortDemo1.new
	msd.DisplayData(data1)
	msd.MergeSortRecursion(data1, 0, data1.size - 1)
	msd.DisplayData(data1)

	puts
	msd.DisplayData(data2)
	msd.MergeSortIteration(data2)
	msd.DisplayData(data2)
end

Main()
