# frozen_string_literal: true

class AllTab < Bridgetown::Component
  attr_reader :resource, :options

  def initialize(resource:, options:)
    @resource, @options = resource, options
    super()
  end

  def current_page
    resource.data.dato_object
  end

  def show
    5
  end

  def tabs
    site = Bridgetown::Current.site
    @tabs ||= site.collections
      .pages
      .resources
      .select { |p| p.data.meta_type == resource.data.meta_type }
      .reject { |p| p.basename_without_ext.casecmp?("all") }
  end
end
