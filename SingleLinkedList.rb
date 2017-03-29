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
    
    # Shruti's comment: use the method below as the default method to add a node to a singly linked list when no criteria is specified. 
    # addNode above has a time complexity of O(n) since it needs to navigate through the singly linked list.
    # prepend below has a time complexity of O(1), no matter how long the linked list is
    def prepend(value) 
        if @size == 0
            makeNewNode(value)
        else
            current_node = Node.new(value,@head)
            @head = current_node
            @size += 1
        end
        return displayNodes
    end


    def displayNodes # THIS WAS #13
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


    def emptyList # THIS WAS #5
        initialize
    end

    # Shruti: In deleteValue below, what happens in the case where the linked list has more than one node,
    # but the value to delete is found in the first node (@head.value)?
    # In other words, after the while loop in the method below,
    # @size != nil, but previous_node is not set since the while loop was not entered.
    # How will you modify this method to work for this case? e.g. Linked list: "head: 7 8 nil" deleteValue(7) is called.
    def deleteValue(value_to_delete) # THIS WAS #9
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

    # Shruti: Assume your linked list is "head: 7 8 nil" and insertValueIntoSorted(5) is called.
    # In this case, with the code below, the while loop will never be entered, so previous_node is not set to a node.
    # Also, in this example case, you will also need to update @head. What changes would you need to make to the code below?
    def insertValueIntoSorted(value) # THIS WAS #7
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

    def printLargestValue # THIS WAS #11
        return displayNodes if @size == 0
        current_node = @head
        current_max = current_node.value
        until current_node == nil
            if current_max < current_node.value
                current_max = current_node.value
            end
            current_node = current_node.next_node
        end
        puts "The largest value is #{current_max.to_s}."
    end
end

ll = LinkedList.new()
ll.addNode(1)
ll.addNode(2)
ll.addNode(3)
ll.insertValueIntoSorted(2.5)
ll.deleteValue(3)

ll.printLargestValue
# puts ll.displayNodes
# ll.emptyList
# puts ll.displayNodes()
