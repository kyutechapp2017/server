require_relative 'boot'

require 'rails/all'

Bundler.require(*Rails.groups)

module Server
  class Application < Rails::Application
    config.paths.add File.join('app', 'api'), glob: File.join('**', '*.rb')
    config.autoload_paths += Dir[Rails.root.join('app', 'api', '*')]
  end
end
