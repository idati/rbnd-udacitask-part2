class UdaciList
  attr_reader :title, :items

  def initialize(options={})
    options[:title] ? @title = options[:title] : @title = "Untitled List" 
    @items = []
  end
  def add(type, description, options={})
    type = type.downcase
    tmp=[TodoItem.new(description, options), EventItem.new(description, options), LinkItem.new(description, options)]
    #tmp.each {|type_tmp| @items.push type_tmp if ((type_tmp.to_s[2...6].downcase == type)||(type_tmp.to_s[2...7].downcase == type))
    (tmp.find {|type_tmp| ((type_tmp.to_s[2...6].downcase == type)||(type_tmp.to_s[2...7].downcase == type))}) ? (@items.push tmp.find {|type_tmp| ((type_tmp.to_s[2...6].downcase == type)||(type_tmp.to_s[2...7].downcase == type))}) : (raise UdaciListErrors::InvalidItemType, "sorry #{type} not known in udacilist")
    #(@items.push tmp.find {|type_tmp| ((type_tmp.to_s[2...6].downcase == type)||(type_tmp.to_s[2...7].downcase == type))})# ? (raise UdaciListErrors::InvalidItemType, "sorry #{type} not known in udacilist") : ""
      #((type_tmp.to_s[2...6].downcase == type)||(type_tmp.to_s[2...7].downcase == type)) ? (return (@items.push type_tmp)) : (raise UdaciListErrors::InvalidItemType, "sorry #{type} not known in udacilist")}
    
    #@items.push TodoItem.new(description, options) if type == "todo"
    #@items.push EventItem.new(description, options) if type == "event"
    #@items.push LinkItem.new(description, options) if type == "link"
    #type == "link" ? (@items.push LinkItem.new(description, options)) : (raise UdaciListErrors::InvalidItemType, "sorry #{type} not known in udacilist")
  end
  def delete(index)
    #puts (index-1)
    #puts @items.length
    ((index) <= @items.length) ? (@items.delete_at(index - 1)) : (raise UdaciListErrors::IndexExceedsListSize, "todo list size #{@items.length} smaller than index #{index}")
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
