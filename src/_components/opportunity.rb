# frozen_string_literal: true

class Opportunity < Bridgetown::Component
  attr_reader :resource, :options

  def initialize(resource:, options:)
    @resource, @options = resource, options
    super()
  end

  def closed?
    return false if resource.close_date.nil?

    resource.close_date < Time.now
  end
end
