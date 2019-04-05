# This file is used by Rack-based servers to start the application.
RAILS_RELATIVE_URL_ROOT='/blog'
require_relative 'config/environment'

# if RAILS_RELATIVE_URL_ROOT then
#   map RAILS_RELATIVE_URL_ROOT do
#     run Rails.application
#   end
# else
#   run Rails.application
# end
map Blog2::Application.config.relative_url_root || "/" do
  run Rails.application
end
