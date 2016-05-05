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
    format_type(@type)+
    if !@site_name
      format_description(@description) if !@site_name
    else
      format_description(@description) + "site name: " + format_name
    end
  end
  def detail_type
    format_type(@type)
  end
  def detail_description
     format_description(@description)
  end
  def detail_date
      ("site name: " + format_name) if @site_name
  end
  def detail_priority
    false
  end
end
