#require_relative 'listable'

class LinkItem
  include Listable
  attr_reader :description, :site_name

  def initialize(url, options={})
    @description = url
    @site_name = options[:site_name]
  end

  def format_name
    @site_name ? @site_name : ""
  end
  def details
    if !@site_name
      format_description(@description) if !@site_name
    else
      format_description(@description) + "site name: " + format_name
    end
  end
end
