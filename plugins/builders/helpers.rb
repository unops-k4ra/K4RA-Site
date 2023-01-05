# frozen_string_literal: true

class Builders::Helpers < SiteBuilder
  def build
    tab_helpers
    component_helpers

    helper :dato do
      site.data.dato
    end
  end

  def component_helpers
    helper :component_from_dato do |content, options = nil|
      options ||= {}
      if content.respond_to?(:item_type)
        content.item_type.api_key.camelize.constantize.new(resource: content, options:)
      else
        content.component.new(resource: content, options:)
      end
    end

    helper :component_from_data do |content, options = nil|
      options ||= {}
      content.data.tab_component.camelize.constantize.new(resource: content, options:)
    end
  end

  def tab_helpers
    helper :tab_component do |content, options = nil|
      options ||= {}
      content.basename_without_ext.camelize.constantize.new(resource: content, options:)
    end

    helper :tabs_for do |resource|
      @items = site.collections
        .pages
        .resources
        .select { |p| p.data.meta_type == resource.data.meta_type }
    end
  end
end
