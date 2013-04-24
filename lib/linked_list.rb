require 'linked_list_item'
require 'debugger'
class LinkedList
  attr_reader :first_item



  def initialize (*args)
    # debugger if args.size > 0
    args.each { |item| add_item(item) }
  end

  def add_item(payload)
    new_item = LinkedListItem.new(payload)
    return @first_item = new_item if @first_item.nil? # if this is true, this variable becomes the first item

    final_item = @first_item # the first item becomes the current last item
    until final_item.last?
      final_item = final_item.next_list_item
    end
    final_item.next_list_item = new_item
  end

  def get(n)
    item = @first_item
    n.times do # run the loop as many times as (n)
      raise IndexError if item.nil? # raise error if no items in list
      item = item.next_list_item
    end
    item.payload
  end

  def last
    last_item = @first_item
    return nil if last_item.nil? # if there are no items, return nil for .last

    until last_item.last? # do this loop until there is no next item, using our last? method
      last_item = last_item.next_list_item
    end
    last_item.payload # return the last item's payload
  end

  def size
    count = 0
    item = @first_item
    until item.nil? # do this loop until out of items
      item = item.next_list_item
      count += 1
    end
    count
  end

  def to_s
    item = @first_item
    return "| |" if item.nil?

    string = item.payload
    until item.last?
      item = item.next_list_item
      string += ", #{item.payload}"
    end
    "| #{string} |"
  end

  # ========= Bonus ========== #

  def [](n)
    get n
  end

  def []=(n, payload) # setter method
    item = @first_item
    raise IndexError if item.nil?
    n.times do
      item = item.next_list_item
    end
    item.payload = payload
  end

  def remove(n)
  end

  # ========= Index exercise ========== #

  def indexOf(string)
    index = 0
    until index == self.size
      if get(index) == string
        return index
      end
    index += 1
    end
  end

end
