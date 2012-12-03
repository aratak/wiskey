# Color number generates hex string without '#' symbol for IE filters
module Wiskey::SassExtensions::Functions::RemoveUnit

  def remove_unit(string)
    Sass::Script::Number.new string.to_s.to_f
  end

end
