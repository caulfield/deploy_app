require 'sinatra/base'

class DeployApp < Sinatra::Base
  get '/' do
    `#{ENV['COMMAND']}` if ENV['COMMAND']
  end
end
