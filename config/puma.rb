# Puma is a fast, concurrent web server for Ruby & Rack
#
# Learn more at: https://puma.io
#
port ENV.fetch("PORT") { 4000 }

# You can adjust the number of workers (separate processes) and threads
# (per process) based on your production system
#

workers Integer(ENV['WEB_CONCURRENCY'] || 2)

environment ENV['RACK_ENV'] || 'development'

max_threads_count = ENV.fetch("BRIDGETOWN_MAX_THREADS") { 5 }
min_threads_count = ENV.fetch("BRIDGETOWN_MIN_THREADS") { max_threads_count }
threads min_threads_count, max_threads_count

# Preload the application for maximum performance
#
preload_app!

# Use the Bridgetown logger format
#
require "bridgetown-core/rack/logger"
log_formatter do |msg|
  Bridgetown::Rack::Logger.message_with_prefix msg
end