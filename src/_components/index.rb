# frozen_string_literal: true

class Index < Bridgetown::Component
  attr_reader :metadata, :resource

  def initialize(metadata:, resource:)
    @metadata, @resource = metadata, resource
    super()
  end
end
