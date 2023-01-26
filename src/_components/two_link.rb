# frozen_string_literal: true

class TwoLink < Bridgetown::Component
  attr_reader :resource, :options

  def initialize(resource:, options:)
    @resource, @options = resource, options
    super()
  end

  def page_slug(page)
    page.slug unless page.slug == "eq-acquis"
    "#{page.slug}/clusters"
  end
end
