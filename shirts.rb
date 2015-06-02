require 'sinatra'
require 'sinatra/contrib'
require 'json'
require 'data_mapper'
require File.dirname(__FILE__) + '/routes.rb'
require File.dirname(__FILE__) + '/models.rb'

HOST = '127.0.0.1'
PORT = 4567

set :bind, HOST
set :port, PORT
