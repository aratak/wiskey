require "fileutils"

module Wiskey
  class Generator
    def initialize(arguments)
      @subcommand = arguments.first
    end

    def run
      if @subcommand == "install"
       install
      elsif @subcommand == "update"
        update
      end
    end

    def update
      if wiskey_files_already_exist?
        remove_wiskey_directory
        install_files
        puts "Wiskey files updated."
      else
        puts "No existing wiskey installation. Doing nothing."
      end
    end

    def install
      if wiskey_files_already_exist?
        puts "Wiskey files already installed, doing nothing."
      else
        install_files
        puts "Wiskey files installed to wiskey/"
      end
    end

    private

    def wiskey_files_already_exist?
      File.directory?("wiskey")
    end

    def install_files
      make_lib_directory
      copy_in_sass_extensions
      copy_in_scss_files
    end

    def remove_wiskey_directory
      FileUtils.rm_rf("wiskey")
    end

    def make_lib_directory
      FileUtils.mkdir_p("wiskey/lib/wiskey")
    end

    def copy_in_sass_extensions
      FileUtils.cp(File.join(lib_directory, "wiskey.rb"), "wiskey/lib/")
      FileUtils.cp(File.join(lib_wiskey_directory, "sass_extensions.rb"), "wiskey/lib/wiskey/")
      FileUtils.cp_r(File.join(lib_wiskey_directory, "sass_extensions"), "wiskey/lib/wiskey/")
    end

    def copy_in_scss_files
      FileUtils.cp_r(all_stylesheets, "wiskey/")
    end

    def all_stylesheets
      Dir["#{stylesheets_directory}/*"]
    end

    def stylesheets_directory
      File.join(top_level_directory, "app", "assets", "stylesheets")
    end

    def lib_directory
      File.join(top_level_directory, "lib")
    end

    def lib_wiskey_directory
      File.join(top_level_directory, "lib", "wiskey")
    end

    def top_level_directory
      File.dirname(File.dirname(File.dirname(__FILE__)))
    end
  end
end
