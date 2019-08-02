def range(start, finish)
    return [] if finish <= start
    [start] + range(start + 1, finish)
end

def recursive_sum(array)
    return 0 if array.empty?
    array[0] + recursive_sum(array[1..-1])
end

def iterative_sum(array)
    array.inject { |sum, add_in| sum += add_in }
end

def exponent_1(base, power)
    return 1 if power == 0
    if power < 0                            # 2^(-3) == 1 / 2^3
        base = 1.0 / base
        power = -power
    end
    base * exponent_1(base, power - 1)
end

def exponent_2(base, power)          
    return 1 if power == 0

    if power < 0                            
        base = 1.0 / base
        power = -power
    end

    if power.even?
        half_power = exponent_2(base, power / 2)  
        half_power * half_power                  
    else
        half_power_minus_one = exponent_2(base, (power - 1) / 2)
        base * half_power_minus_one * half_power_minus_one
    end
end

def recursive_fibs(num)                     
    return [1, 1].take(num) if num <= 2

    prev_fibs = recursive_fibs(num - 1)                         

    last_fib = prev_fibs[-1]
    next_to_last_fib = prev_fibs[-2]
    next_fib = last_fib + next_to_last_fib 

    prev_fibs << next_fib
end

def iterative_fibs(num)
    fibs = [1, 1]
    return fibs.take(num) if num <= 2

    until fibs.length == num
        fibs << fibs[-1] + fibs[-2]
    end

    fibs
end

def bsearch(sorted_array, target)               # bsearch([1, 2, 3, 4, 5, 6], 6) => m_i = 3, m_v = 4, right = [5,6], 3 + 1 + 1
    return nil if sorted_array.empty?           # bsearch([5, 6], 6)             => m_i = 1, m_v = 6, 

    middle_index = sorted_array.length / 2
    middle_value = sorted_array[middle_index]
    return middle_index if middle_value == target
    
    if target < middle_value
        left = sorted_array[0...middle_index]
        bsearch(left, target)
    else
        right = sorted_array[middle_index + 1..-1]
        sub_search_result = bsearch(right, target)
        sub_search_result && middle_index + 1 + sub_search_result
    end
end

class Array
    def merge_sort
        return self.dup if self.length <= 1 

        middle_idx = self.length / 2
        sorted_left = self.take(middle_idx).merge_sort
        sorted_right = self.drop(middle_idx).merge_sort

        merge(sorted_left, sorted_right)
    end

    def deep_dup
        self.map { |ele| ele.is_a?(Array) ? ele.deep_dup : ele }
    end

    def subsets
        return [[]] if self.empty?                      # [1, 2].subsets s_s_s = [1, 2].subsets [] => [[],[1]] + [[] + [2], [[1, 2]]]

        sub_subsets = self[0...-1].subsets
        sub_subsets + sub_subsets.map { |sub_subset| sub_subset + [self.last] }
    end

    def permutations                                
        return [self.dup] if self.empty?
        
        perms = []
        last_ele = self.last                        
        sub_perms = self[0...-1].permutations       
        
        sub_perms.each do |sub_perm|                
            (sub_perm.length + 1).times do |idx|     
                left = sub_perm.take(idx)  
                right = sub_perm.drop(idx)          
                perms << left + [last_ele] + right  
            end
        end
        
        perms.sort
    end

    # [].permutation => [[]]
    # [1].permutation => [[1]]
    # [1,2].permutation => [2] + [1].permutation, [1].permutation + [2] => [[1,2], [2,1]]
end

def merge(sorted_left, sorted_right)
    merged = []

    until sorted_left.empty? || sorted_right.empty?
        if sorted_left.first <= sorted_right.first
            merged << sorted_left.shift
        else
            merged << sorted_right.shift
        end
    end

    merged + sorted_left + sorted_right
end

def greedy_make_change(target, coins = [25, 10, 5, 1])
    return [] if target == 0
    return nil if coins.empty?

    biggest_coin = coins.first
    num_of_biggest_coins = target / biggest_coin
    target_remainder = target - (biggest_coin * num_of_biggest_coins)

    [biggest_coin] * num_of_biggest_coins + greedy_make_change(target_remainder, coins[1..-1])
end

def make_better_change(target, coins = [25, 10, 5, 1])          # make_better_change(24, [10, 7, 1])
    return [] if target == 0

    change_combos = []

    coins.each do |current_coin|
        if current_coin <= target                                       
            remainder = target - current_coin
            coins_in_use = coins.select { |coin| coin <= current_coin }

            current_change = [current_coin] + make_better_change(remainder, coins_in_use)      # [10] + mbc(14, [10, 7, 1])
        else
            current_change = make_better_change(target, coins[1..-1])
        end
        change_combos << current_change
    end

    p change_combos
    change_combos.min_by { |change_combo| change_combo.length }
end