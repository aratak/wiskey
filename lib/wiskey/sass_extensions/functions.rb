module Wiskey::SassExtensions::Functions
end

require File.join(File.dirname(__FILE__), "/functions/compact")
require File.join(File.dirname(__FILE__), "/functions/split_params")
require File.join(File.dirname(__FILE__), "/functions/color_number")
require File.join(File.dirname(__FILE__), "/functions/remove_unit")

module Sass::Script::Functions
  include Wiskey::SassExtensions::Functions::Compact
  include Wiskey::SassExtensions::Functions::SplitParams
  include Wiskey::SassExtensions::Functions::ColorNumber
  include Wiskey::SassExtensions::Functions::RemoveUnit
end

# Wierd that this has to be re-included to pick up sub-modules. Ruby bug?
class Sass::Script::Functions::EvaluationContext
  include Sass::Script::Functions
end
