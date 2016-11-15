#File.dirname(__FILE__)

require_relative 'test_app'

run Rack::URLMap.new(
      '/'         => TestApp
    )