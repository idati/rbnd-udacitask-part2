
require_relative 'listable'
require_relative 'errors'

class TodoItem
  include Listable
  attr_reader :description, :due, :priority

  def initialize(description, options={})
    #puts Chronic.parse(options[:due]) ? (Chronic.parse(options[:due])).to_date : (raise UdaciListErrors::InvalidDateValue, "can't read date")
    #puts Date.parse(options[:due])
    @description = description
    #@due = options[:due] ? Date.parse((options[:due])) : options[:due]
    @due = options[:due] ? (Chronic.parse(options[:due]) ? (Chronic.parse(options[:due])).to_date : (raise UdaciListErrors::InvalidDateValue, "can't read date")) : options[:due]
    @priority = options[:priority]
  end

  def details
    format_description(@description) + "due: " +
    format_date(due: @due) +
    format_priority(@priority)
  end
end
