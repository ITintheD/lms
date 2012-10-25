# Load the rails application
require File.expand_path('../application', __FILE__)

require 'yaml'
APP_CONFIG = YAML.load(File.read(File.expand_path('../app_config.yml', __FILE__)))

# Initialize the rails application
MiniLms::Application.initialize!
