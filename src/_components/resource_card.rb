# frozen_string_literal: true

class ResourceCard < Bridgetown::Component
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

  def resource_type(res)
    case resource_item.item_type.api_key
    when "resource_link"
      ExternalLink.new(resource: res, options:)
    when "resource_file"
      FileLink.new(resource: res, options:)
    end
  end
end
