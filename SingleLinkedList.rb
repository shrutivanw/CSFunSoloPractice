# Single Linked List Example

class Node
    attr_accessor :value, :next_node
    def initialize(value, next_node=nil)
        @value = value
        @next_node = next_node
    end
end

class LinkedList
    attr_accessor :head, :size
    def initialize
        @head = nil
        @size = 0
    end


    def addNode(value)
        if @size == 0
            @head = Node.new(value, nil)
            @size += 1
        else
            current_node = @head
            while current_node.next_node != nil
                current_node = current_node.next_node
            end
            current_node.next_node = Node.new(value,nil)
            @size += 1
        end
        return displayNodes
    end


    def displayNodes
        if @size == 0
            return "head: nil"
        end
        current_node = @head
        fullList = "head: "
        until current_node.next_node == nil
            fullList += " ==> #{current_node.value.to_s}"
            current_node = current_node.next_node
        end
        fullList += " ==> #{current_node.value.to_s} ==> nil"
        return fullList
    end


    def emptyList
        initialize
    end


    def deleteValue(value_to_delete)
        # auto-stop if list is empty
        if @size == 0
            return displayNodes
        end

        if @head.value == value_to_delete
            @head = nil
            @size -= 1
        else
            
            end
            return displayNodes
        end

        # go to node with value_to_delete
        previous_node = @head
        current_node = previous_node.next
        @size.times do |node|
            current_node = previous_node.next_node
            if current_node.value == value_to_delete
                previous_node.next_node = current_node.next_node
                @size -=1
            end
        end

        while current_node.value != value_to_delete && current_node.next_node != nil
            current_node = current_node.next_node
        end
        if current_node.value == value_to_delete
            @size -= 1
            # previous_node.next_node = current_node.next_node
        end
        return displayNodes
    end
end

ll = LinkedList.new()
ll.addNode(1)
puts ll.deleteValue(5)

# puts ll.addNode(2)
# puts ll.addNode(3)
# puts ll.deleteValue(3)

# puts ll.displayNodes
# ll.emptyList
# puts ll.displayNodes()
