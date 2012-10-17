require 'sinatra/base'

class DeployApp < Sinatra::Base
  post '/' do
    `#{ENV['COMMAND']}` if ENV['COMMAND']
  end
end
