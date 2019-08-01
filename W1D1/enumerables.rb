class Array
    def my_each(&prc)
        count = 0
        
        while   count < self.length
            prc.call(self[count])
            count += 1
        end
        self
    end


    def my_select(&prc)
        output = []
        
        self.my_each do |ele|
            output << ele  if prc.call(ele)
        end
        output
    end

    def my_reject(&prc)

        output = []
        
        self.my_each do |ele|
            output << ele  if !prc.call(ele)
        end
        output
        
    end

    def my_any?(&prc)
        self.my_each do |ele|
            return true if prc.call(ele)
        end
        false
    end

    def my_all?(&prc)
        self.my_each do |ele|
            return false if !prc.call(ele)
        end
        true
    end

    def my_flatten
        output = []

        self.each do |ele|
            if ele.is_a?(Array)
                output += ele.my_flatten
            else
                output << ele
            end
        end
        output
    end

    def my_zip(*args)
        output = Array.new(self.length) {Array.new(args.length + 1, nil)}
        # output = []
        wrk_arr = args.unshift(self) # [[1, 2],[ 4, 5, 6 ],[ 7, 8, 9 ]]
        # ouptut = wrk_arr.each do |ele|
        #     if ele.length < self.length
        #         while ele.length < self.length
        #             ele << nil
        #         end
        #     end
        # end
        wrk_arr.each_with_index do |sub, i_1|
            sub.each_with_index do |ele, i_2|
                if i_2 < self.length
                    output[i_2][i_1] = ele
                end
            end
        end

        output
    end

    def my_rotate(n=1)
        output = Array.new(self.length)

        self.each_with_index do |ele, i|
            output[(i - n) % output.length] = ele 
        end

        output
    end

    def my_join(seperator = "")
        output = ""

        self.each_with_index do |ele, i|
            if i == self.length - 1
                output += ele
            else
                output += ele + seperator
            end
        end
        output
    end

    def my_reverse
        output = []

        count = self.length - 1

        while count >= 0
            output << self[count]
            count -= 1
        end
        output
    end
    
end

