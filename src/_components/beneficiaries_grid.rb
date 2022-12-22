# frozen_string_literal: true

class BeneficiariesGrid < Bridgetown::Component
  attr_reader :resource, :options

  def initialize(resource:, options:)
    @resource, @options = resource, options
    super()
  end

  def grid_items
    resource.grid_items.sort_by { |item| item.title }
  end
end
