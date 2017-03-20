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

    def makeNewNode(value)
        @head = Node.new(value, nil)
        @size += 1
    end


    def addNode(value)
        if @size == 0
            makeNewNode(value)
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
        puts fullList
    end


    def emptyList
        initialize
    end


    def deleteValue(value_to_delete)
        # auto-stop if list is empty
        if @size == 0
            puts "no nodes to delete"
            return displayNodes
        end

        current_node = @head

        # go to node with value_to_delete
        while current_node.value != value_to_delete
            previous_node = current_node
            current_node = current_node.next_node
            if current_node == nil
                puts "couldn't find #{value_to_delete}"
                exit
            end

        end
        if @size == 1
            @head = nil
            @size = 0
        else
            previous_node.next_node = current_node.next_node
            @size -= 1
        end
        puts "deleted #{value_to_delete}"
        return displayNodes
    end

    def insertValueIntoSorted(value)
        if @size == 0
            makeNewNode(value)
        else
            current_node = @head
            while current_node != nil && value > current_node.value
                previous_node = current_node
                current_node = current_node.next_node
            end
            new_node = Node.new(value, current_node)
            previous_node.next_node = new_node
            @size += 1
        end
        return displayNodes
    end


end

ll = LinkedList.new()
ll.addNode(1)
ll.addNode(2)
ll.addNode(3)
ll.insertValueIntoSorted(2.5)
# ll.deleteValue(3)

# puts ll.displayNodes
# ll.emptyList
# puts ll.displayNodes()
