# frozen_string_literal: true

class AllTab < Bridgetown::Component
  attr_reader :resource, :options

  def initialize(resource:, options:)
    @resource, @options = resource, options
    super()
  end

  def current_page
    return options[:page] if options[:page].present?
  end
end
