require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get company" do
    get static_pages_company_url
    assert_response :success
  end

  test "should get privacy" do
    get static_pages_privacy_url
    assert_response :success
  end

  test "should get agreement" do
    get static_pages_agreement_url
    assert_response :success
  end

end
