require 'helper'
require 'mws/authorize_response_object'

class MWSAuthorizeResponseObjectTest < MiniTest::Test
  def test_state
    ar = MWS::AuthorizeResponsObject.new('someId').tap do |o|
      o.response_object = OpenStruct.new(body: EXAMPLE_XML)
    end

    assert_equal :closed, ar.state
  end

  EXAMPLE_XML = <<-EOS
  <AuthorizeResponse xmlns="https://mws.amazonservices.com/schema/OffAmazonPayments/2013-01-01">
    <AuthorizeResult>
      <AuthorizationDetails> 
        <AmazonAuthorizationId>
          P01-1234567-1234567-0000001
        </AmazonAuthorizationId>
        <AuthorizationReferenceId>test_authorize_1</AuthorizationReferenceId>
        <SellerAuthorizationNote>Lorem ipsum</SellerAuthorizationNote>
        <AuthorizationAmount>
          <CurrencyCode>USD</CurrencyCode>
          <Amount>94.50</Amount>
        </AuthorizationAmount>
        <AuthorizationFee>
          <CurrencyCode>USD</CurrencyCode>
          <Amount>0</Amount>
        </AuthorizationFee>
        <AuthorizationStatus>
          <State>Pending</State>
          <LastUpdateTimestamp>2012-11-03T19:10:16Z</LastUpdateTimestamp>
        </AuthorizationStatus>
        <CreationTimestamp>2012-11-02T19:10:16Z</CreationTimestamp>
        <ExpirationTimestamp>2012-12-02T19:10:16Z</ExpirationTimestamp>
      </AuthorizationDetails>
    </AuthorizeResult>
    <ResponseMetadata>
      <RequestId>b4ab4bc3-c9ea-44f0-9a3d-67cccef565c6</RequestId>
    </ResponseMetadata>
  </AuthorizeResponse>
  EOS
end
