require_relative 'listable'

class LinkItem
  include Listable
  attr_reader :type, :description, :site_name

  def initialize(type, url, options={})
    @type = type
    @description = url
    @site_name = options[:site_name]
  end

  def format_name
    @site_name ? @site_name : ""
  end
  def details
    detail_type +
    detail_description +
    detail_date
  end
  def detail_type
    format_type(@type)
  end
  def detail_description
     format_description(@description)
  end
  def detail_date
       @site_name ? ("site name: " + format_name) : ""
  end
  def detail_priority
    nil
  end
end
