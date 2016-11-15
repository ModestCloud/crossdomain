require 'sinatra/base'
require 'sinatra/cross_origin'

class TestApp < Sinatra::Base

  register Sinatra::CrossOrigin


  get '/hi' do
    "hello world"
  end

  get '/crossdomain' do
    cross_origin
    "Cross domain request received."
  end

end