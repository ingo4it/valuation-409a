module Valuation409a
  class SingletonAPIResource < APIResource
    def self.url()
      if self == SingletonAPIResource
        raise NotImplementedError.new('SingletonAPIResource is an abstract class.  You should perform actions on its subclasses (Account, etc.)')
      end
      "/v1/#{CGI.escape(class_name.downcase)}"
    end

    def url
      self.class.url
    end

  end
end
