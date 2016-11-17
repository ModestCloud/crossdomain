$: << File.dirname(__FILE__)

require 'test_app'

run Rack::URLMap.new(
      '/'         => TestApp
    )