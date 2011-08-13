require './application'
Enlighten::Application.initialize!

# Development middlewares
if Enlighten::Application.env == 'development'
  use AsyncRack::CommonLogger

  # Enable code reloading on every request
  use Rack::Reloader, 0

  # Serve javascripts and stylesheets from from /public
  use Rack::Static, :urls => ["/javascripts", "/stylesheets"], :root => Enlighten::Application.root(:public)
end

# Running thin :
#
#   bundle exec thin --timeout 0 -R config.ru start
#
# Vebose mode :
#
#   Very useful when you want to view all the data being sent/received by thin
#
#   bundle exec thin --timeout 0 -V -R config.ru start
#
run Enlighten::Application.routes
