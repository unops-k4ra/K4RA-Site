# frozen_string_literal: true

class BreadCrumb < Bridgetown::Component
  attr_reader :resource, :options

  def initialize(resource:, options:)
    @resource, @options = resource, options
    super()
  end

  def sub_title?
    resource.sub_title.present?
  end

  def sub_title
    resource.sub_title
  end
end
