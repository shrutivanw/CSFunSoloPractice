# Single Linked List Example

class Node
    attr_accessor :value, :next_node, :previous_node
    def initialize(value, previous_node=nil, next_node=nil)
        @value = value
        @next_node = next_node
        @previous_node = previous_node
    end
end

class DoubleLinkedList
    attr_accessor :head, :size
    def initialize
        @head = nil
        @size = 0
    end

    def addNode(value)
        if @size == 0
            @head = Node.new(value, nil, nil)
            @size += 1
        else
            current_node = @head
            while current_node.next_node != nil
                current_node = current_node.next_node
            end
            current_node.next_node = Node.new(value, current_node, nil)
            @size += 1
        end
        puts self.displayNodes
    end

    def displayNodes
        if @size == 0
            return "head: --> nil"
        end
        
        fullList = "nil <== head: ( #{@head.value.to_s} )"
        current_node = @head.next_node
        while current_node != nil
            fullList += " <==> ( #{current_node.value.to_s} )"
            current_node = current_node.next_node
        end
        fullList += " ==> nil"
        return fullList
    end

    def emptyList
        initialize
    end

end

dll = DoubleLinkedList.new()
puts dll.displayNodes
dll.addNode(1)
dll.addNode(2)
dll.addNode(3)
dll.emptyList
dll.displayNodes
# puts dll.displayNodes()
