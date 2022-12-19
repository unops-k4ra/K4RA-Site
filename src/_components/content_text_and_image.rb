# frozen_string_literal: true

class ContentTextAndImage < Bridgetown::Component
  attr_reader :resource

  def initialize(resource:)
    @resource = resource
    super()
  end

  def reverse_image?
    if @resource.image_position
      ""
    else
      "[&:first-child]:pl-20 flex-row-reverse"
    end
  end
end
