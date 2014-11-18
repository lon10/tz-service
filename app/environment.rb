require 'bundler'
Bundler.require(:default)

$: << File.expand_path('../', __FILE__)
$: << File.expand_path('../../', __FILE__)
$: << File.expand_path('../../config', __FILE__)
$: << File.expand_path('../services', __FILE__)

ENV['RACK_ENV'] ||= 'development'

require 'grape'
require 'json'
require 'pry'
require 'active_record'

require 'timezone_name_service'
require 'configuration'
require 'application'
require 'time_zone_api'