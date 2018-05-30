#!/usr/bin/env ruby
# -*- coding: utf-8 -*-

# ruby-insertion-sort-demo-1.rb

class InsertionSortDemo1
    def DisplayData(data)
        puts data.join(', ')
    end

    def InsertionSort(data)
        n = data.size
        for i in 1 .. n - 1
            nGet = data[i]
            j = i - 1
            while j >= 0 && data[j] > nGet
                data[j + 1] = data[j]
                j -= 1
            end
            data[j + 1] = nGet
        end
    end
end

def Main()
    # data = [41, 67, 34, 0, 69, 24, 78, 58, 62, 64, 5, 45, 81, 27, 61, 91, 95, 42, 27, 36];
    data = [76, 11, 11, 43, 78, 35, 39, 27, 16, 55, 1, 41, 24, 19, 54, 7, 78, 69, 65, 82];

    isd = InsertionSortDemo1.new
    isd.DisplayData(data)
    isd.InsertionSort(data)
    isd.DisplayData(data)
end

Main()
