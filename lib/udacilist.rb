class UdaciList
  attr_reader :title, :items

  def initialize(options={})
    options[:title] ? @title = options[:title] : @title = "Untitled List" 
    @items = []
  end
  def add(type, description, options={})
    type = type.downcase
    tmp=[TodoItem.new(description, options), EventItem.new(description, options), LinkItem.new(description, options)]
    (tmp.find {|type_tmp| ((type_tmp.to_s[2...6].downcase == type)||(type_tmp.to_s[2...7].downcase == type))}) ? \
      (@items.push tmp.find {|type_tmp| ((type_tmp.to_s[2...6].downcase == type)||(type_tmp.to_s[2...7].downcase == type))}) : \
      (raise UdaciListErrors::InvalidItemType, "sorry #{type} not known in udacilist")    
  end
  def delete(index)
    ((index) <= @items.length) ? (@items.delete_at(index - 1)) : \
      (raise UdaciListErrors::IndexExceedsListSize, "todo list size #{@items.length} smaller than index #{index}")
  end
  
  def filter(input_type)
    type_container=[]
    @items.each{|types| type_container.push(types.class.to_s[0...-4].downcase) unless type_container.include?(types.class.to_s[0...-4].downcase)}
    type_container.include?(input_type) ? filter_out(input_type) : (raise UdaciListErrors::InvalidFilterType, "sorry #{input_type} not available in udacilist")
  end
  
  def filter_out(input_type)
    puts "-" * (@title.length+input_type.length+15)
    puts "Filter for #{input_type} in #{@title}"
    puts "-" * (@title.length+input_type.length+15)
    @items.each_with_index do |item, position|
      if item.class.to_s[0...-4].downcase==input_type
        puts "#{position + 1}) #{item.details}"
      end
    end
#    @items.select{|types| types.class.to_s[0...-4].downcase==input_type}.each_with_index do |item, position|
#      puts "#{position + 1}) #{item.details}"
#    end
  end
  
  def all
    puts "-" * @title.length
    puts @title
    puts "-" * @title.length
    @items.each_with_index do |item, position|
      puts "#{position + 1}) #{item.details}"
    end
  end
end
