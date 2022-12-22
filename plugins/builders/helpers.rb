# frozen_string_literal: true

class Builders::Helpers < SiteBuilder
  def build
    helper :dato do
      site.data.dato
    end

    helper :component_from_dato do |content, options = nil|
      options ||= {}
      if content.respond_to?(:item_type)
        content.item_type.api_key.camelize.constantize.new(resource: content, options:)
      else
        content.component.new(resource: content, options:)
      end
    end

    helper :tab_component do |content, options = nil|
      options ||= {}
      content.basename_without_ext.camelize.constantize.new(resource: content, options:)
    end
  end
end
