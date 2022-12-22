# frozen_string_literal: true

class ChapterPage < Bridgetown::Component
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
end
