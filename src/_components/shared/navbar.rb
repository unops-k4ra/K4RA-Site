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
      "text-kra-text"
    end
  end

  def border_b
    if @inverse
      ""
    else
      "border-b"
    end
  end
end
