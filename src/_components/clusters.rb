# frozen_string_literal: true

class Clusters < Bridgetown::Component
  attr_reader :resource, :options, :clusters

  def initialize(resource:, options:)
    @resource, @options = resource, options
    @site = Bridgetown::Current.site
    @clusters = @site.data.dato.send("eu_acquis_#{resource.data.active_page}")
    super()
  end
end
