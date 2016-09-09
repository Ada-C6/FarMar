require 'simplecov'

SimpleCov.start

require 'minitest'
require 'minitest/spec'
require "minitest/autorun"
require "minitest/reporters"
require 'minitest/pride'
#These are all the things about mini test that we are using
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative '../far_mar'
