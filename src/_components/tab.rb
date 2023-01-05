# frozen_string_literal: true

class Tab < Bridgetown::Component
  attr_reader :resource, :site, :options

  class TabPresenter
    attr_reader :item

    def initialize(item)
      @item = item
    end

    def image?
      return item.hero_image.present? if item.respond_to?(:hero_image)
    end

    def date
      return item.start_date if @item.respond_to?(:start_date)
      return item.date if item.respond_to?(:date)
      return item.opened_date if item.respond_to?(:opened_date)

      nil
    end

    def method_missing(value)
      item.send(value)
    end

    def respond_to_missing?(value)
      item.respond_to?(value) || super
    end
  end

  def initialize(resource:, options:)
    @resource, @options = resource, options
    @site = Bridgetown::Current.site
    @items = site.collections
      .pages
      .resources
      .map(&:data)
      .select { |p| p.meta_type == resource.data.data_source }
    super()
  end

  def show_amount
    if @options[:all]
      @options[:show]
    else
      @items.length
    end
  end

  def items
    @items.slice(0, show_amount)
      .map(&:dato_object)
      .map { |dato_object| TabPresenter.new(dato_object) }
  end
end
