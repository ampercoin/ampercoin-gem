require 'openssl'
require 'base64'
require 'bundler'
require 'active_support/all'
Bundler.require

module Ampercoin
  autoload :Address, 'ampercoin/address'
end
