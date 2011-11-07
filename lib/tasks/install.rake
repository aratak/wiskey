# Needed for pre-3.1.
namespace :wiskey do
  desc "Move files to the Rails assets directory."
  task :install do
    source_root = File.expand_path(File.join(File.dirname(__FILE__), '..', '..'))
    `mkdir -p #{Rails.root}/public/stylesheets/sass/wiskey`
    `cp -a #{source_root}/app/assets/stylesheets/* #{Rails.root}/public/stylesheets/sass/wiskey`
    `find #{Rails.root}/public/stylesheets/sass/wiskey -name "*.css.scss" | while read i; do mv "$i" "${i%.css.scss}.scss"; done`
  end
end
