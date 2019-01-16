class Array

    def my_uniq
        new_array = []
        self.each do |el|
            new_array << el unless new_array.include?(el)
        end
        new_array
    end

    def two_sum
        sum_array =[]
        each_with_index do |el, idx|
            each_with_index do |el1, idx2|
                if idx < idx2 && el + el1 == 0
                    sum_array << [idx, idx2]
                end
            end
        end
        sum_array 
    end


    #[
    #    [9, 8, 7],
    #    [6, 5, 4],
    #    [3, 2, 1]
    #]
    def my_transpose
        transposed_array = Array.new(length){[]}
        each do |row| #each row
            row.each_with_index do |el, idx2|
                transposed_array[idx2] << el
            end
        end
        transposed_array
    end

    def stock_picker
        raise ArgumentError if length <= 1
        sum_hash = Hash.new
        each_with_index do |el, idx|
            each_with_index do |el1, idx2|
                if idx < idx2 
                    profit = el1 - el 
                    unless sum_hash.has_key?(profit)
                        sum_hash[profit] = [idx, idx2]
                    end
                end
            end
        end
        max_val = sum_hash.keys.max  
        sum_hash[max_val]
    end

end
