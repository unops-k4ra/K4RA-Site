# frozen_string_literal: true

class Beneficiary < Bridgetown::Component
  attr_reader :resource, :options

  def initialize(resource:, options:)
    @resource, @options = resource, options
    super()
  end

  def height
    if resource.abstract.present?
      "h-[570px]"
    else
      "h-[350px]"
    end
  end
end
