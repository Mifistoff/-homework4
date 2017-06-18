require 'simplecov'
SimpleCov.start

$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'variant2'
require 'string_calculator'

require 'minitest/pride'
require 'minitest/autorun'
