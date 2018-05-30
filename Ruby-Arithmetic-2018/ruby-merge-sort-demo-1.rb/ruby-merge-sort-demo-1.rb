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

    def MergeSortRecursion(data, nLeft, nRight)
        if nLeft == nRight then
            return
        end

        nMid = (nLeft + nRight) / 2
        MergeSortRecursion(data, nLeft, nMid)
        MergeSortRecursion(data, nMid + 1, nRight)
        Merge(data, nLeft, nMid, nRight)
    end
end

def Main()
    data = [41, 67, 34, 0, 69, 24, 78, 58, 62, 64, 5, 45, 81, 27, 61, 91, 95, 42, 27, 36]
    # data = [76, 11, 11, 43, 78, 35, 39, 27, 16, 55, 1, 41, 24, 19, 54, 7, 78, 69, 65, 82]

    msd = MergeSortDemo1.new
    msd.DisplayData(data)
    msd.MergeSortRecursion(data, 0, data.size - 1)
    msd.DisplayData(data)
end

Main()
