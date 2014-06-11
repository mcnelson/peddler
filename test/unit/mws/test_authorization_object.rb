require 'helper'
require 'mws/authorization_object'

class MWSAuthorizationObjectTest < MiniTest::Test
  def test_state
    ao = MWS::AuthorizationObject.new('someId').tap do |o|
      o.response_object = OpenStruct.new(body: EXAMPLE_AUTH_XML)
    end

    assert_equal :closed, ao.state
  end

  EXAMPLE_AUTH_XML = <<-EOS
  <GetAuthorizationDetailsResponse xmlns="http://mws.amazonservices.com/schema/OffAmazonPayments/2013-01-01">
    <GetAuthorizationDetailsResult>
      <AuthorizationDetails>
        <ExpirationTimestamp>2014-07-05T22:32:38.612Z</ExpirationTimestamp>
        <AuthorizationStatus>
          <LastUpdateTimestamp>2014-06-07T22:33:11.721Z</LastUpdateTimestamp>
          <State>Closed</State>
          <ReasonCode>ExpiredUnused</ReasonCode>
        </AuthorizationStatus>
        <AuthorizationAmount>
          <Amount>45.00</Amount>
          <CurrencyCode>USD</CurrencyCode>
        </AuthorizationAmount>
        <CapturedAmount>
          <Amount>0</Amount>
          <CurrencyCode>USD</CurrencyCode>
        </CapturedAmount>
        <IdList/>
        <AmazonAuthorizationId>S01-5689543-2487366-A068579</AmazonAuthorizationId>
        <SellerAuthorizationNote/>
        <CaptureNow>false</CaptureNow>
        <AuthorizationReferenceId>63</AuthorizationReferenceId>
        <CreationTimestamp>2014-06-05T22:32:38.612Z</CreationTimestamp>
        <AuthorizationFee>
          <Amount>0.00</Amount>
          <CurrencyCode>USD</CurrencyCode>
        </AuthorizationFee>
      </AuthorizationDetails>
    </GetAuthorizationDetailsResult>
    <ResponseMetadata>
      <RequestId>eaaad111-a9a1-49a4-b5c0-3e995bc82674</RequestId>
    </ResponseMetadata>
  </GetAuthorizationDetailsResponse>
  EOS
end
