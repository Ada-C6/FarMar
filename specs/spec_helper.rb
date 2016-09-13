# This is from the simplecov documentation
require 'simplecov'
SimpleCov.start

# I've just copied the spec_helper.rb file from the in-class TDD demo.
require 'minitest'
require 'minitest/spec'
require "minitest/autorun"
require "minitest/reporters"
require 'minitest/pride'

# The far_mar file will reference all the farmer's market class files.

require_relative '../far_mar'

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new
