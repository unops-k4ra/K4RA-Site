# frozen_string_literal: true

class TabbedNav < Bridgetown::Component
  attr_reader :resource, :options

  def initialize(resource:, options:)
    @resource, @options = resource, options
    super()
  end

  def tab_title(tab)
    if tab.item_type.api_key == "all_tab"
      tab.title
    else
      tab.tab_content&.title
    end
  end

  def tab_link(tab)
    if tab.item_type.api_key == "all_tab"
      tab.page.slug
    else
      tab.tab_content&.page&.slug
    end
  end
end
