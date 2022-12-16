# frozen_string_literal: true

class Builders::Helpers < SiteBuilder
  def build
    helper :dato do
      site.data.dato
    end
  end
end
