class Shared::Navbar < Bridgetown::Component
  def initialize(metadata:, resource:, inverse: false)
    @metadata, @resource, @inverse = metadata, resource, inverse
  end

  def text_color
    if @inverse
      "text-black"
    else
      "text_white"
    end
  end

  def button_color
    if @inverse
      "bg-gray-400 text-gray-800"
    else
      "bg-white text-gray-400"
    end
  end
end
