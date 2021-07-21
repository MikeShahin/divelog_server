# Load the Rails application.
require_relative "application"
ActiveSupport::Inflector::inflections do |inflect|
    inflect.irregular 'dive', 'dives'


  end
  
# Initialize the Rails application.
Rails.application.initialize!
