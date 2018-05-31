#!/usr/bin/env ruby
# -*- coding: utf-8 -*-

# ruby-shell-sort-demo-1.rb

class ShellSortDemo1
    def DisplayData(data)
        puts data.join(', ')
    end

    def ShellSort(data)
        n = data.size
        h = 0
        while h <= n
            h = 3 * h + 1
        end
        while h >= 1
            for i in h .. n - 1
                j = i - h
                nGet = data[i]
                while j >= 0 && data[j] > nGet
                    data[j + h] = data[j]
                    j = j - h
                end
                data[j + h] = nGet
            end
            h = (h - 1) / 3
        end
    end
end

def Main()
    # data = [41, 67, 34, 0, 69, 24, 78, 58, 62, 64, 5, 45, 81, 27, 61, 91, 95, 42, 27, 36]
    data = [76, 11, 11, 43, 78, 35, 39, 27, 16, 55, 1, 41, 24, 19, 54, 7, 78, 69, 65, 82]

    ssd = ShellSortDemo1.new
    ssd.DisplayData(data)
    ssd.ShellSort(data)
    ssd.DisplayData(data)
end

Main()
