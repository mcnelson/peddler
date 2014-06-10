require 'mws/off_amazon_payments'
require 'mws/oap_object'

module MWS
  # TODO: Add more accessors
  class AuthorizeResponseObject < OAPObject
    def fetch!
      @response_object = api.get_authorization_details(id)
    end

    def state
      at_path(%[
        AuthorizeResponse
        AuthorizeResult
        AuthorizationDetails
        AuthorizationStatus
        State
      ]).downcase.to_sym
    end
  end
end
