# frozen_string_literal: true

class Page < Bridgetown::Component
  attr_reader :resource, :options

  def initialize(resource:, options:)
    @resource, @options = resource, options
    super()
  end

  def height
    if resource.abstract.present?
      "h-[570px]"
    else
      "h-[350px]"
    end
  end

  def title_color
    {
      "black" => "text-black",
      "white" => "text-white",
    }.fetch(resource.title_color)
  end

  def background?
    {
      "black" => false,
      "white" => true,
    }.fetch(resource.title_color)
  end

  def disable_hero?
    !resource.disable_hero
  end
end
