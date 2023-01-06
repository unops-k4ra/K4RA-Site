# frozen_string_literal: true

require "dato/utils/seo_tags_builder"
require "action_view/helpers/tag_helper"

class Builders::Helpers < SiteBuilder
  include ActionView::Helpers::TagHelper

  def build
    tab_helpers
    component_helpers
    helper :meta_tags

    helper :dato do
      site.data.dato
    end
  end

  def meta_tags(resource)
    dato_object = if resource.data.meta_type == :page
                    resource.data.dato_object
                  elsif resource.data.meta_type == :page
                    resource.data.item
                  elsif resource.basename_without_ext == "index"
                    site.data.dato.home
                  else
                    return
                  end

    meta_tags = Dato::Utils::SeoTagsBuilder.new(dato_object, site.data.dato.site).meta_tags
    meta_tags.map do |data|
      if data[:content]
        content_tag(data[:tag_name], data[:content], data[:attributes])
      else
        tag(data[:tag_name], data[:attributes])
      end
    end.join("\n").html_safe
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
