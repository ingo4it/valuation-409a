module Valuation409a
  class ValuationFirm < APIResource
    include Valuation409a::APIOperations::List
    include Valuation409a::APIOperations::Create
    include Valuation409a::APIOperations::Update

    def latest(params={})
      response, api_key = Valuation409a.request(:post, latest_url, @api_key, params)
      refresh_from(response, api_key)
      self
    end

    def new_lead(params={})
      response, api_key = Valuation409a.request(:post, new_lead_url, @api_key, params)
      refresh_from(response, api_key)
      self
    end

    private

    def latest_url
      url + '/latest'
    end

    def new_lead_url
      url + '/new-lead'
    end

  end
end
