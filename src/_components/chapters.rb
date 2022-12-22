# frozen_string_literal: true

class Chapters < Bridgetown::Component
  attr_reader :resource, :options, :chapters

  def initialize(resource:, options:)
    @resource, @options = resource, options
    @site = Bridgetown::Current.site
    @chapters = @site.data.dato.send("eu_acquis_#{resource.basename_without_ext}")
    super()
  end
end
