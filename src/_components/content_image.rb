# frozen_string_literal: true

class ContentImage < Bridgetown::Component
  attr_reader :resource, :options

  def initialize(resource:, options:)
    @resource, @options = resource, options
    super()
  end

  def align()
    {
      "left" => "justify-start",
      "center" => "justify-center",
      "right" => "justify-end",
    }.fetch(resource.align)
  end
end
