require 'rubygems'
require 'bundler/setup'
Bundler.require(:default)
require 'ampercoin'

get '/' do
  "Hello World #{params[:name]}".strip
end
