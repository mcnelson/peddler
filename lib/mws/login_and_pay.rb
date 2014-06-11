require 'peddler/client'
require 'mws/order_reference_object'
require 'mws/authorization_object'

module MWS
  class LoginAndPay
    attr_reader :api

    def initialize(api = MWS.off_amazon_payments)
      @api = api
    end

    def get_order_reference_object(amazon_order_reference_id)
      excon_response = api.get_order_reference_details(amazon_order_reference_id)
      MWS::OrderReferenceObject.new(excon_response)
    end

    def get_authorization_object(amazon_authorization_id)
      excon_response = api.get_authorization_details(amazon_authorization_id)
      MWS::AuthorizationObject.new(excon_response)
    end

    def get_capture_object(amazon_authorization_id)
      excon_response = api.get_order_reference_details(amazon_order_reference_id)
      MWS::AuthorizationObject.new(excon_response)
    end
  end
end
