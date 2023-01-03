# frozen_string_literal: true

class ResourceAction < Bridgetown::Component
  attr_reader :resource, :options

  def initialize(resource:, options:)
    @resource, @options = resource, options
    super()
  end

  def text
    options[:text]
  end

  def resource_item
    resource.resource.first.resources.first
  end

  def link
    case resource_item.item_type.api_key
    when "resource_link"
      resource_item.link
    when "resource_file"
      resource_item.asset.url
    end
  end
end
