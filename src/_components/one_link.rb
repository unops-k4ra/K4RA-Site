# frozen_string_literal: true

class OneLink < Bridgetown::Component
  attr_reader :resource

  def initialize(resource:)
    @resource = resource
    super()
  end
end
