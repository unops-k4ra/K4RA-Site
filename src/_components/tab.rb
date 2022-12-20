# frozen_string_literal: true

require "byebug"

class Tab < Bridgetown::Component
  attr_reader :resource, :site

  def initialize(resource:, options:)
    @resource, @options = resource, options
    @site = Bridgetown::Current.site
    super()
  end

  def items
    site.collections
      .pages
      .resources
      .map(&:data)
      .select { |p| p.meta_type == resource.data_source }
      .map(&:dato_object)
  end
end
