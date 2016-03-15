require 'logger'
require 'singleton'

class MyLogger
  attr_accessor :logger
  include Singleton

  def initialize
    @logger = Logger.new STDOUT
  end
end
