#adds coverage folder to tree
#to run coverage report type this into terminal: open coverage/index.html

require 'simplecov'
SimpleCov.start

require 'minitest'
require 'minitest/spec'
require "minitest/autorun"
require "minitest/reporters"
require 'minitest/pride'



Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative '../far_mar'
