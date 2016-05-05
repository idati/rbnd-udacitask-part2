require_relative 'listable'

class EventItem
  include Listable
  attr_reader :type, :description, :start_date, :end_date

  def initialize(type, description, options={})
    @type = type
    @description = description
    @start_date = get_start(options[:start_date])
    @end_date = get_end(options[:end_date])
  end

  def get_start(input)
    (Chronic.parse(input) ? (Chronic.parse(input)).to_date : (raise UdaciListErrors::InvalidDateValue, "can't read date")) if input
  end

  def get_end(input)
    @end_date = (Chronic.parse(input) ? (Chronic.parse(input)).to_date : (raise UdaciListErrors::InvalidDateValue, "can't read date")) if input
  end  
  
  
  def details
    format_type(@type)+
    format_description(@description) + "event dates: " + 
      format_date(start_date: @start_date, end_date: @end_date)
  end
  def detail_type
    format_type(@type)
  end
    def detail_description
     format_description(@description)
  end
  def detail_date
    "event dates: " +
    format_date(start_date: @start_date, end_date: @end_date)
  end
  def detail_priority
    false
  end
end
