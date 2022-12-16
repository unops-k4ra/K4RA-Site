# frozen_string_literal: true

class BeneficiariesGrid < Bridgetown::Component
  attr_reader :resource

  def initialize(resource:)
    @resource = resource
    super()
  end

  def grid_items
    resource.grid_items.sort_by { |item| item.title }
  end
end
