$LOAD_PATH << File.expand_path('..', __FILE__)
require 'app'

run App.new.router
