require 'sinatra/base'
require 'cross_origin'

class TestApp < Sinatra::Base

  register Sinatra::CrossOrigin

  ALLOWEDORIGINS = ["https://day103-17200-sql-142h.dv.lan", "http://localhost:3006", "http://adc6170583.us.oracle.com:7003"]


  options "*" do
    cross_origin
    response.headers["Allow"] = "HEAD,GET,PUT,POST,DELETE,OPTIONS"

    response.headers["Access-Control-Allow-Headers"] = "X-Requested-With, X-HTTP-Method-Override, Content-Type, Cache-Control, Accept"
    #cross_origin :allow_origin => ALLOWEDORIGINS, :allowmethods => [:put]

    request_origin = request.env['HTTP_ORIGIN']

    if ALLOWEDORIGINS.include?(request_origin)
      response.headers["Access-Control-Allow-Origin"] = request_origin
    end

    200
  end

  get '/hi' do
    "hello world"
  end

  get '/crossdomain' do
    cross_origin :allow_origin => ALLOWEDORIGINS,:allowmethods => [:get],:allowcredentials => false
    "Cross domain request received."
  end

  post '/crossdomain' do
    cross_origin :allow_origin => ALLOWEDORIGINS,:allowmethods => [:post],:allowcredentials => true
    "Cross domian post request received."
  end

  put '/crossdomain' do
    cross_origin :allow_origin => ALLOWEDORIGINS,:allowmethods => [:put],:allowcredentials => true
    "Cross domian put request received."
  end

end