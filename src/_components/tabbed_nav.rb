# frozen_string_literal: true

require "ostruct"

class TabbedNav < Bridgetown::Component
  attr_reader :resource, :options

  AllTabData = Struct.new("AllTabData", :title, :tabs, :show, :component)

  def initialize(resource:, options:)
    @resource, @options = resource, options
    super()
  end

  def all_tab
    AllTabData.new(
      resource.title_for_all_tab,
      resource.tabs,
      resource.how_many_to_show_on_all,
      AllTab
    )
  end

  def tabs
    [all_tab] + resource.tabs
  end
end
