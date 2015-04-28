require File.expand_path('../../test_helper', __FILE__)

module Valuation409a

  class CertificateBlacklistTest < Test::Unit::TestCase
    ## SSL certificate is not ready
    # should "not trust revoked certificates" do
    #   assert_raises(Valuation409a::APIConnectionError) {
    #     Valuation409a::CertificateBlacklist.check_ssl_cert("https://revoked.409a.com:444",
    #                                                 Valuation409a::DEFAULT_CA_BUNDLE_PATH)
    #   }
    # end

    # should "trust api.409a.com" do
    #   assert_true Valuation409a::CertificateBlacklist.check_ssl_cert("https://api.409a.com",
    #                                                           Valuation409a::DEFAULT_CA_BUNDLE_PATH)
    # end
  end
end
