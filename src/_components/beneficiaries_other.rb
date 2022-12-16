# frozen_string_literal: true

class BeneficiariesOther < Bridgetown::Component
  attr_reader :resource

  def initialize(resource:)
    @resource = resource
    super()
  end
end
