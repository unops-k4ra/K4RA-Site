# frozen_string_literal: true

class ContentImage < Bridgetown::Component
  attr_reader :resource

  def initialize(resource:)
    @resource = resource
    super()
  end
end
