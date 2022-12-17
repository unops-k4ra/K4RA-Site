# frozen_string_literal: true

class UpdatesAll < Bridgetown::Component
  attr_reader :resource

  def initialize(resource:)
    @resource = resource
    super()
  end
end
