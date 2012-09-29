require 'rubygems'
require 'bundler/setup'
require 'ostruct'
require 'minitest/autorun'
require 'minitest/spec'
require 'minitest/pride'

$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))

require "beautiful-css"

