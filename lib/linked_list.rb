require_relative './node'

class LinkedList

    attr_accessor :head

    def initialize
        @head = nil
    end

    def prepend(node)
       node.next_node = head
         @head = node

    end

    def append(node)

        if @head ==nil
            @head = node
            return
        end

          
    last_node = head
    while last_node.next_node
      last_node = last_node.next_node
    end

    last_node.next_node = node
    end

    def delete_head
       if head
        @head = @head.next_node
       else
        return
       end
    end

    def delete_tail

        if @head ==nil
            return
        end
      
        return delete_head if head.next_node.nil?

        curr = head
        prev = nil
        while curr.next_node
          prev = curr
          curr = curr.next_node
        end
    
        prev.next_node = nil
    end

    def add_after(index, node)
        return prepend(node) if index == 0

        curr_index = 0
        curr = head
        while curr_index < index
          curr_index += 1
          curr = curr.next_node
        end
        if curr
          node.next_node = curr.next_node
          curr.next_node = node
        else
          append(node)
        end  
    end

    def search(value)
        node = head
        while node
          return node if node.data == value
          node = node.next_node
        end
        nil
      end

end
