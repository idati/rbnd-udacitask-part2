# coding: Windows-1254
module Listable
  def format_type(type)
    "#{type}".ljust(10)
  end
  
  def format_description(description)
    "#{description}".ljust(30)
  end
  
  def format_date(option={})
    if option[:start_date] 
      dates = option[:start_date].strftime("%D")
      dates << " -- " + option[:end_date].strftime("%D") if option[:end_date]
      dates = "N/A" if !dates
      return dates
    end
    if option[:due] != {}
      option[:due] ? option[:due].strftime("%D") : "No due date"
    end
  end
  
  def format_priority(priority)
    value = " ©".red if priority == "urgent"
    value = " ©".black if priority == "high"
    value = " ©".blue if priority == "medium"
    value = " ©".green if priority == "low"
    value = "" if !priority
    return value
  end
  
end
