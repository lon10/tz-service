require 'bundler'
Bundler.require(:default)

$: << File.expand_path('../', __FILE__)
$: << File.expand_path('../../', __FILE__)
$: << File.expand_path('../../config', __FILE__)
$: << File.expand_path('../services', __FILE__)
$: << File.expand_path('../models', __FILE__)

ENV['RACK_ENV'] ||= 'development'

require 'grape'
require 'json'
require 'pry'
require 'active_record'
require 'yaml'

require 'tz_offset'
require 'timezone_name_service'
require 'timezone_offset_service'
require 'db_configuration'
require 'application'
require 'timezone_api'