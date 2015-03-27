require 'valuation-409a'
require 'test/unit'
require 'mocha/setup'
require 'stringio'
require 'shoulda'

#monkeypatch request methods
module Valuation409a
  @mock_rest_client = nil

  def self.mock_rest_client=(mock_client)
    @mock_rest_client = mock_client
  end

  def self.execute_request(opts)
    get_params = (opts[:headers] || {})[:params]
    post_params = opts[:payload]
    case opts[:method]
    when :get then @mock_rest_client.get opts[:url], get_params, post_params
    when :post then @mock_rest_client.post opts[:url], get_params, post_params
    when :delete then @mock_rest_client.delete opts[:url], get_params, post_params
    end
  end
end

def test_response(body, code=200)
  # When an exception is raised, restclient clobbers method_missing.  Hence we
  # can't just use the stubs interface.
  body = JSON.generate(body) if !(body.kind_of? String)
  m = mock
  m.instance_variable_set('@valuation409a_values', { :body => body, :code => code })
  def m.body; @valuation409a_values[:body]; end
  def m.code; @valuation409a_values[:code]; end
  m
end

def test_lead(params={})
  id = params[:id] || 'ch_test_lead'
  {
    :full_name => 'Larry Wong',
    :company_name => 'Crims',    
    :company_stage_id => 2,
    :is_subscription_valuation => true,
    :is_do_it_yourself_valuation => false,
    :is_unsigned_valuation => true,
    :price_rating => 4,
    :turnaround_rating => 5,    
    :defensibility_rating => 7,
    :email => 'test@valuation409a.com'
  }.merge(params)
end

class Test::Unit::TestCase
  include Mocha

  setup do
    @mock = mock
    Valuation409a.mock_rest_client = @mock
    Valuation409a.api_key="foo"
  end

  teardown do
    Valuation409a.mock_rest_client = nil
    Valuation409a.api_key=nil
  end
end

