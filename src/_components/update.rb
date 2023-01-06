# frozen_string_literal: true

class Update < Bridgetown::Component
  attr_reader :resource, :options

  def initialize(resource:, options:)
    @resource, @options = resource, options
    super()
  end

  def press_release?
    return unless resource.press_release.nil?

    "hidden"
  end
end
