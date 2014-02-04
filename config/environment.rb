# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Taskcheck::Application.initialize!
Time::DATE_FORMATS[:ru_date] = "%Y.%m.%d"
