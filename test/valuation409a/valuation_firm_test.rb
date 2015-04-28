require File.expand_path('../../test_helper', __FILE__)

module Valuation409a
  class ValuationFirmTest < Test::Unit::TestCase
    should "new_lead should return updated valuation firms" do      
      @mock.expects(:post).once.returns(test_response(response_409a))
      firms = Valuation409a::ValuationFirm.new_lead(test_lead)
      assert firms['response']['data'].any?
    end
    should "latest should return latest valuation firms" do      
      @mock.expects(:post).once.returns(test_response(response_409a))
      firms = Valuation409a::ValuationFirm.latest
      assert firms['response']['data'].any?
    end
  end
end

