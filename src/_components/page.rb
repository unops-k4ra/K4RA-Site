# frozen_string_literal: true

class Page < Bridgetown::Component
  attr_reader :resource

  def initialize(resource:)
    @resource = resource
    super()
  end

  def height
    if resource.abstract.present?
      "h-[570px]"
    else
      "h-[350px]"
    end
  end
end
