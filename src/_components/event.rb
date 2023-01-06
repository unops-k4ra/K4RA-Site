# frozen_string_literal: true

class Event < Bridgetown::Component
  attr_reader :resource, :options

  def initialize(resource:, options:)
    @resource, @options = resource, options
    super()
  end

  def end_date?
    return unless resource.end_date.nil?

    "hidden"
  end
end
