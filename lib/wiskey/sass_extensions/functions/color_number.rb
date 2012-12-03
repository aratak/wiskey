# Color number generates hex string without '#' symbol for IE filters
module Wiskey::SassExtensions::Functions::ColorNumber

  def color_number(color)
    rgb_color = Sass::Script::Color::COLOR_NAMES[color.to_s] || (0..2).map {|n| color.to_s.gsub(/^#/, '').to_i(16) >> (n << 3) & 0xff}.reverse
    sass_color = Sass::Script::Color.new rgb_color

    Sass::Script::String.new sass_color.inspect.to_s.gsub(/^#/, '')
  end

end
