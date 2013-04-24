class LinkedListItem
  attr_reader :next_list_item
  attr_accessor :payload

  # attr_reader :payload => def payload
  #                           return @payload
  #                         end

  # attr_writer :foo => def foo=(arg)
  #                       @foo = arg
  #                     end

  def initialize( payload )
    @payload = payload
  end

  def next_list_item= (linked_list_item)
    raise ArgumentError if linked_list_item == self  # two equals is comparison
    @next_list_item = linked_list_item
  end

  def last?
    @next_list_item.nil? #returns true or false. if true, then the current item is the last item; if false, then it is not the last item.
  end
end
