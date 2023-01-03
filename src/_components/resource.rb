# frozen_string_literal: true

class Resource < Bridgetown::Component
  attr_reader :resource, :options

  def initialize(resource:, options:)
    @resource, @options = resource, options
    super()
  end

  def resource_type(res)
    case res.resource.first.resources.first.item_type.api_key
    when "resource_link"
      ExternalLink.new(resource: res, options:)
    when "resource_file"
      FileLink.new(resource: res, options:)
    end
  end

  def resource_action(res)
    case res.resource.first.resources.first.item_type.api_key
    when "resource_link"
      ResourceAction.new(resource: res, options: { text: "Visit Link" })
    when "resource_file"
      ResourceAction.new(resource: res, options: { text: "Download" })
    end
  end
end
