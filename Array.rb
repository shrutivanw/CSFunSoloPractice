# Arrays Example

class Arrays
    attr_accessor :size
    def initialize(size)
        @size = size
        @array = []
        size.times do
            @array.push(nil)
        end
        display
    end

    def add(element_to_add)
        (0...@size).each do |i|
            if @array[i] == nil
                @array[i] = element_to_add
                return display
            end
        end
    end

    def display
        arrayDisplay = "["
        (0...@size).each do |i|
            arrayDisplay += " #{@array[i].to_s},"
        end
        arrayDisplay[-1] = "]"
        puts arrayDisplay
    end

    def empty
        @size.times do |i|
            @array[i] = -1
        end
        display
    end

    def addElementIntoSorted(element_to_add)
        (0...@size).each do |i|
            if @array[i] == nil || @array[i] > element_to_add
                temp = @array[i]
                @array[i] = element_to_add
                if i + 1 >= @size
                    @size = @size * 2
                    puts "size: #{@size}"
                end
                ( (i + 1)...@size ).each do |j|
                    @array[j] = temp
                    temp = @array[i + 2]
                end
                break
            else
                next
            end
        end
        display
    end
end

a = Arrays.new(3)
# a.add(0)
# a.add(1)
# a.add(2)
# a.add(3)
# a.add(4)
a.addElementIntoSorted(2.2)
puts a.size
# a.empty
