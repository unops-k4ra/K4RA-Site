# frozen_string_literal: true

class Chapter < Bridgetown::Component
  attr_reader :resource, :options

  def initialize(resource:, options:)
    @resource, @options = resource, options
    super()
  end

  def chapter
    resource
  end

  def index
    options[:index]
  end
end
