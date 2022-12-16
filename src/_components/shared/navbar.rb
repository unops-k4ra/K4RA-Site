# frozen_string_literal: true

class Shared::Navbar < Bridgetown::Component
  def initialize(metadata:, resource:, inverse: false)
    @metadata, @resource, @inverse = metadata, resource, inverse
    super()
  end

  def hide_svg
    if @inverse
      "hidden"
    else
      ""
    end
  end

  def text_color
    if @inverse
      "text-white"
    else
      "text-text"
    end
  end

  def button_color
    if @inverse
      "bg-white text-kra-offwhite"
    else
      "bg-kra-darkblue-lightest text-kra-darkblue-lighter"
    end
  end
end
