require 'helper'
require 'mws/capture_response_object'

class MWSCaptureResponseObjectTest < MiniTest::Test
  def test_state
    ao = MWS::CaptureResponseObject.new('someId').tap do |o|
      o.response_object = OpenStruct.new(body: EXAMPLE_XML)
    end

    assert_equal :completed, ao.state
  end

  EXAMPLE_XML = <<-EOS
  <CaptureResponse xmlns="https://mws.amazonservices.com/schema/OffAmazonPayments/2013-01-01">
    <CaptureResult>
      <CaptureDetails>
        <AmazonCaptureId>P01-1234567-1234567-0000002</AmazonCaptureId>
        <CaptureReferenceId>test_capture_1</CaptureReferenceId>
        <SellerCaptureNote>Lorem ipsum</SellerCaptureNote>
        <CaptureAmount>
          <CurrencyCode>USD</CurrencyCode>
          <Amount>94.50</Amount>
        </CaptureAmount>
        <CaptureStatus>
          <State>Completed</State>
          <LastUpdateTimestamp>2012-11-03T19:10:16Z</LastUpdateTimestamp>
        </CaptureStatus>
        <CreationTimestamp>2012-11-03T19:10:16Z</CreationTimestamp>
      </CaptureDetails>
    </CaptureResult>
    <ResponseMetadata>
      <RequestId>b4ab4bc3-c9ea-44f0-9a3d-67cccef565c6</RequestId>
    </ResponseMetadata>
  </CaptureResponse>
  EOS
end
