require "rubygems"
require "bundler"

module Enlighten
  class Application

    class << self
      attr_accessor :debugger
    end

    def self.root(path = nil)
      @_root ||= File.expand_path(File.dirname(__FILE__))
      path ? File.join(@_root, path.to_s) : @_root
    end

    def self.env
      @_env ||= ENV['RACK_ENV'] || 'development'
    end

    def self.routes
      @_routes ||= eval(File.read('./config/routes.rb'))
    end

    # Initialize the application
    def self.initialize!
    end

  end
end

Bundler.require(:default, Enlighten::Application.env)

Cramp::Websocket.backend = :thin

require 'erb'

# Preload application classes
require './app/lib/debugger'
require './app/lib/debugger_setup'
require './app/actions/home_action'
require './app/actions/debugging_action'

