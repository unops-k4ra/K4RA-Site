# frozen_string_literal: true

class Builders::Helpers < SiteBuilder
  def build
    helper :dato do
      site.data.dato
    end

    helper :component_from_dato do |content|
      content.item_type.api_key.camelize.constantize.new(resource: content)
    end
  end
end
