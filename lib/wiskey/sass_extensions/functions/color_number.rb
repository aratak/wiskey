# Color number generates hex string without '#' symbol for IE filters
module Wiskey::SassExtensions::Functions::ColorNumber

  def color_number(color)
    Sass::Script::List.new ie_hex_str(color).gsub('#', '')
  end

end
