require File.expand_path('../../test_helper', __FILE__)

module Valuation409a
  class ValuationFirmTest < Test::Unit::TestCase
   should "valuation firm should return updateable" do      
      @mock.expects(:post).once.returns(test_response(test_lead))
      c = Valuation409a::ValuationFirm.latest("test_charge")
      c.refresh
      c.mnemonic = "New valuation firms"
      c.save
    end
  end
end

