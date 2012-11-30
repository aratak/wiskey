# Split params string to params list
module Wiskey::SassExtensions::Functions::SplitParams

  def split_params(params)
    Sass::Script::List.new params.to_s.split, :space
  end

end
