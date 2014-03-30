require 'rubygems'
require 'bundler/setup'
require 'sinatra'
require 'data_mapper'
require "dm-sqlite-adapter"

# Set database URL
DataMapper.setup(:default, "sqlite://#{Dir.pwd}/database/dev.db")

Dir["./models/*.rb"].each {|file| require file }

# Perform basic sanity checks and initialize all relationships
# Call this when you've defined all your models
DataMapper.finalize
DataMapper.auto_upgrade!

# Bring in Controllers
Dir["./controllers/*_controller.rb"].each {|file| require file }