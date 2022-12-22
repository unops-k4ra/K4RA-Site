# frozen_string_literal: true

class Beneficiary < Bridgetown::Component
  attr_reader :resource, :options

  def initialize(resource:, options:)
    @resource, @options = resource, options
    super()
  end

  def height
    if resource.abstract.present?
      "h-[570px]"
    else
      "h-[350px]"
    end
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
