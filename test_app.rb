require 'sinatra/base'
require 'sinatra/cross_origin'

class TestApp < Sinatra::Base

  register Sinatra::CrossOrigin


  options "*" do
    response.headers["Allow"] = "HEAD,GET,PUT,POST,DELETE,OPTIONS"

    response.headers["Access-Control-Allow-Headers"] = "X-Requested-With, X-HTTP-Method-Override, Content-Type, Cache-Control, Accept"

    200
  end

  get '/hi' do
    "hello world"
  end

  get '/crossdomain' do
    cross_origin :allow_origin => 'http://localhost:3006',:allowmethods => [:get],:allowcredentials => false
    "Cross domain request received."
  end

  post '/crossdomain' do
    cross_origin :allow_origin => 'http://localhost:3006',:allowmethods => [:post],:allowcredentials => true
    "Cross domian post request received."
  end

end