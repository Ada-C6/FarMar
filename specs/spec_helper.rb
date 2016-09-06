require 'simplecov'
SimpleCov.start

require_relative '../far_mar'

require 'minitest'
require 'minitest/spec'
require "minitest/autorun"
require "minitest/reporters"
require 'minitest/pride'

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

#The specs folder is where we put all of our tests.
