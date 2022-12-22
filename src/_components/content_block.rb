# frozen_string_literal: true

class ContentBlock < Bridgetown::Component
  attr_reader :resource, :options

  def initialize(resource:, options:)
    @resource, @options = resource, options
    super()
  end

  def blocks
    resource.data.dato_object.blocks
  end
end
