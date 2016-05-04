module UdaciListErrors
  # Error classes go here
  class InvalidItemType < StandardError
  end
  
  class IndexExceedsListSize < StandardError
  end
  
  class InvalidPriorityValue < StandardError
  end
  
  class InvalidDateValue < StandardError
  end
  
  class InvalidFilterType < StandardError
  end
  
end
