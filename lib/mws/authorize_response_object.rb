require 'mws/oap_object'

module MWS
  class AuthorizeResponseObject < OAPObject
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
