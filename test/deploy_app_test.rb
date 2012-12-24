$: << File.expand_path('../../lib', __FILE__)

require 'deploy_app'
require 'minitest/autorun'
require 'rack/test'

class DeployAppTest < MiniTest::Unit::TestCase
  include Rack::Test::Methods

  def app
    DeployApp
  end

  def test_success_response
    post '/'
    assert_equal 200, last_response.status
  end

  def test_returns_command_output
    ENV['COMMAND'] = 'echo "foobar"'
    post '/'
    assert_equal 200, last_response.status
    assert_equal 'foobar', last_response.body.strip
  end
end
