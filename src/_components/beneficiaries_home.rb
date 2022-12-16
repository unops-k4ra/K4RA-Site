# frozen_string_literal: true

class BeneficiariesHome < Bridgetown::Component
  attr_reader :resource

  def initialize(resource:)
    @resource = resource
    super()
  end

  def grid_block
    resource.content.first
  end
end
