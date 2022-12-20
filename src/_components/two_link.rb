# frozen_string_literal: true

class TwoLink < Bridgetown::Component
  attr_reader :resource

  def initialize(resource:, options:)
    @resource, @options = resource, options
    super()
  end
end
