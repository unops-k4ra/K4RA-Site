# frozen_string_literal: true

class ContentBlock < Bridgetown::Component
  attr_reader :resource

  def initialize(resource:)
    @resource = resource
    super()
  end

  def blocks
    resource.data.dato_object.blocks
  end
end
