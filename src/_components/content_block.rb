# frozen_string_literal: true

class ContentBlock < Bridgetown::Component
  attr_reader :resource

  def initialize(resource:)
    @resource = resource
    super()
  end
end
