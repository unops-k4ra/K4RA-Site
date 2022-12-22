# frozen_string_literal: true

class Chapters < Bridgetown::Component
  attr_reader :resource, :options

  def initialize(resource:, options:)
    @resource, @options = resource, options
    @site = Bridgetown::Current.site
    super()
  end

  def chapters
    @chapters = if resource.respond_to?(:basename_without_ext)
                  @site.data.dato.send("eu_acquis_#{resource.basename_without_ext}")
                else
                  @options[:chapters]
                end
  end
end
