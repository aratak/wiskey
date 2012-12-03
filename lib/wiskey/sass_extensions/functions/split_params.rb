# Split params string to params list
module Wiskey::SassExtensions::Functions::SplitParams

  def split_params(params)
    options = params.to_s.split.map do |atr|
      result = Sass::Script::String.new(atr)
      result = Sass::Script::Number.new(atr.to_i, [atr.gsub(atr.to_i.to_s, '')]) if atr.to_i == atr.to_f && !atr.to_i.zero?
      result = Sass::Script::Number.new(atr.to_f, [atr.gsub(atr.to_i.to_s, '')]) if atr.to_i != atr.to_f && !atr.to_f.zero?
      result
    end

    Sass::Script::List.new options, :space
  end

end
