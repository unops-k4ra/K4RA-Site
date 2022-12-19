# frozen_string_literal: true

class BeneficiariesHome < Bridgetown::Component
  attr_reader :resource

  def initialize(resource:, options:)
    @resource, @options = resource, options
    super()
  end

  def grid_block
    resource.content.first
  end
end
