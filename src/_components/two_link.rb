# frozen_string_literal: true

class TwoLink < Bridgetown::Component
  attr_reader :resource, :options

  def initialize(resource:, options:)
    @resource, @options = resource, options
    super()
  end

  def page_slug(page)
    if page.slug == "eu-acquis"
      return "#{page.slug}/clusters"
    elsif page.slug == "opportunities"
      return "#{page.slug}/all"
    else
      return page.slug
    end
  end
end
