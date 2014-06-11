require 'peddler/client'
require 'mws/order_reference_object'
require 'mws/authorization_object'
require 'mws/capture_object'
require 'mws/authorize_response_object'
require 'mws/capture_response_object'

module MWS
  class LoginAndPay
    attr_reader :api

    def initialize(api = MWS.off_amazon_payments)
      @api = api
    end

    def get_order_reference_object(oro_id)
      excon_response = api.get_order_reference_details(oro_id)
      MWS::OrderReferenceObject.new(excon_response)
    end

    def get_authorization_object(authorization_id)
      excon_response = api.get_authorization_details(authorization_id)
      MWS::AuthorizationObject.new(excon_response)
    end

    def get_capture_object(capture_id)
      excon_response = api.get_order_reference_details(capture_id)
      MWS::CaptureObject.new(excon_response)
    end

    def authorize(oro_id, reference_id, amount, opts)
      excon_result = api.authorize(oro_id, reference_id, amount, opts)
      MWS::AuthorizeResponseObject.new(excon_result)
    end
  end
end
