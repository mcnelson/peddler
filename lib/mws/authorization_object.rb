require 'mws/off_amazon_payments'
require 'mws/oap_object'

module MWS
  # This class models an Amazon Authorization Object
  #
  # Please feel free to add more accessor methods for pieces of data you find yourself frequently drilling down
  # to get.
  class AuthorizationObject < OAPObject
    def fetch!
      @response_object = api.get_authorization_details(id)
    end

    def state
      at_path(%[
        GetAuthorizationDetailsResponse
        GetAuthorizationDetailsResult
        AuthorizationDetails
        AuthorizationStatus
        State
      ]).downcase.to_sym
    end
  end
end
