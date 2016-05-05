
require_relative 'listable'
#require_relative 'errors'

class TodoItem
  include Listable
  attr_reader :type, :description, :due, :priority

  def initialize(type, description, options={})
    @type = type
    @description = description
    @due = get_due(options[:due])
    @priority = get_prio(options[:priority])
  end

  def get_due(input)
      input ? (Chronic.parse(input) ? Chronic.parse(input).to_date : (raise UdaciListErrors::InvalidDateValue, "can't read date")) : input
  end
  
  def get_prio(input)
    input ? (["high", "medium", "low"].include?("#{input}") ? (input) : (raise UdaciListErrors::InvalidPriorityValue, "priority type #{input} not known")): input
  end
    
  def details
    format_type(@type)+
    format_description(@description) + "due: " +
    format_date(due: @due) +
    format_priority(@priority)
  end
  def detail_type
    format_type(@type)
  end
  def detail_description
     format_description(@description)
  end
  def detail_date
    "due: " +
    format_date(due: @due)
  end
  def detail_priority
    format_priority(@priority)
  end
end
