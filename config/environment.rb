# Load the rails application
require File.expand_path('../application', __FILE__)

Time::DATE_FORMATS[:published] = "%B %d, %Y"
Time::DATE_FORMATS[:time_tag] = "%Y-%B-%d"

# Initialize the rails application
Codebiff::Application.initialize!
