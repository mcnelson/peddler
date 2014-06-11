require 'mws/oap_object'

module MWS
  class CaptureResponseObject < OAPObject
    def state
      at_path(%[
        CaptureResponse
        CaptureResult
        CaptureDetails
        CaptureStatus
        State
      ]).downcase.to_sym
    end
  end
end
