-----------------------Partner A--------------------------------
def bsearch(array, target)
    return nil if array.empty?
    middle_index = array.length / 2

    pivot = array[middle_index]
    left = array.take(middle_index)
    right = array.drop(middle_index)

    if target < pivot
        bsearch(left, target)
        left.index(target)
    elsif pivot == target
        left.length
    else
        bsearch(right, target)
        arr[middle_index + 1..-1]
        right.index(target) + 1 + left.length
    end
end

# my each, only excepts a block not a proc

class Array                                     [1,2,3].my_each { |ele| ele * 2}
    def my_each(&prc)
        idx = 0

        while idx < count                       self[idx] = 1
            prc.call(self[idx])                 { |1| 1 * 2 } = 2
            idx += 1        
        end                                     idx = 1

        self
    end                                        [1,2,3] = [2,4,6]
end

# return hash, key is elements that appear more than once valuses are sorted arrays with index of ele
            # [1,2,3,3,2,2,4]   {2 => [1,4,5], 3 => [2,3]}
def dups(array)
    hash_of_dups = Hash.new { |dups, ele| dups[ele] = Array.new}

    array.each.with_index { |ele, idx| hash_of_dups[ele] << idx }

    hash_of_dups.select { |dups, indices| indices.length > 1}
end









-----------------------Partner B--------------------------------

class Array
                                      
    def merge_sort(&proc)                       
        return self if self.length < 2                                

        mid = self.length / 2                   
        left = self.take(mid)                   
        right = self.drop(mid)                  

        sorted_left = left.merge_sort(&proc)                
        sorted_right = right.merge_sort(&proc)      

        self.merge(sorted_left, sorted_right, &proc)   
    end

    def self.merge(left, right, &proc)                             
        prc ||= Proc.new { |left, right| left <=> right }    

        merged = [ ]

        case prc.call(left.first, right.first)            
        when 1
            merged << right.shift                       
        when -1
            merged << left.shift
        when     
            merged << left.shift
        end

        merged + left + right      
    end


end

<!-- my_flatten
to_specified_level
if no level, entirely flatten nested arrays -->

              

[["a"], "b", ["c", "d", ["e"]]].my_flatten #= ["a", "b", "c", "d", "e"]
[["a"], "b", ["c", "d", ["e"]]].my_flatten(1) #= ["a", "b", "c", "d", ["e"]]
class Array
    def my_flatten(level_target = nil)          
        return [self] if self.class != Array
        return self if level_target == 0

        flattened = []

        self.each do |sub_array|
            if sub_array.is_a?(Array)
                    if !level_target.nil?
                        flattened << sub_array.my_flatten(level_target - 1)
                    else
                        flattened << sub_array.my_flatten(level_target)
                    end
            else
                flattened << sub_array
            end
        end
        flattened
    end
end


class Array
  def my_flatten(level = nil)
    duped = self.dup
    return duped if level == 0
    next_level = level ? level - 1 : nil

    each_with_index do |el, i|
      duped[i..i] = el.my_flatten(next_level) if el.is_a?(Array)
    end

    duped
  end
end

