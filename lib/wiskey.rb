require "wiskey/generator"

module Wiskey
  if defined?(Rails)
    class Engine < ::Rails::Engine
      require 'wiskey/engine'
    end

    module Rails
      class Railtie < ::Rails::Railtie
        rake_tasks do
          load "tasks/install.rake"
        end
      end
    end
  end
end

require File.join(File.dirname(__FILE__), "/wiskey/sass_extensions")
