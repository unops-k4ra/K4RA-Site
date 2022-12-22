# frozen_string_literal: true

class ContentTextAndImage < Bridgetown::Component
  attr_reader :resource, :options

  def initialize(resource:, options:)
    @resource, @options = resource, options
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
