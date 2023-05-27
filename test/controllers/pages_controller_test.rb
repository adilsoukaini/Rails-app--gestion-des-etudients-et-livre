require "test_helper"

class PagesControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get pages_home_url
    assert_response :success
    assert_select "title","Home | Mon App"
  end

  test "should get aide" do
    get pages_aide_url
    assert_response :success
    assert_select "title", "Aide | Mon App"
  end

  test "should get contact" do
    get pages_contact_url
    assert_response :success
    assert_select "title", "Contact | Mon App"
  end
end
