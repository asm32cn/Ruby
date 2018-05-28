#!/usr/bin/env ruby
# -*- coding: utf-8 -*-

# ruby-cocktailsort-demo-1.rb

class CocktailSortDemo1
    def DisplayData(data)
        puts data.join(', ')
    end

    def Swap(data, i, j)
        data[i], data[j] = data[j], data[i]
    end

    def CocktailSort(data)
        nLeft = 0
        nRight = data.size - 1
        while nLeft < nRight
            for i in nLeft .. nRight - 1
                if data[i] > data[i + 1] then
                    Swap data, i, i + 1
                end
            end
            nRight -= 1
            for i in nRight.downto(nLeft + 1)
                if data[i - 1] > data[i] then
                    Swap data, i - 1, i
                end
            end
            nLeft += 1
        end
    end
end

def main
    # data = [41, 67, 34, 0, 69, 24, 78, 58, 62, 64, 5, 45, 81, 27, 61, 91, 95, 42, 27, 36];
    # data = Array[76, 11, 11, 43, 78, 35, 39, 27, 16, 55, 1, 41, 24, 19, 54, 7, 78, 69, 65, 82];
    data = [76, 11, 11, 43, 78, 35, 39, 27, 16, 55, 1, 41, 24, 19, 54, 7, 78, 69, 65, 82];

    csd = CocktailSortDemo1.new
    csd.DisplayData data
    csd.CocktailSort data
    csd.DisplayData data
end

main
