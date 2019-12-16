require 'test_helper'

class WelcomeControllerTest < ActionDispatch::IntegrationTest

  test "should get contact page" do
    get contact_url
    assert_response :success

    assert_template layout: 'application'

    assert_select 'title', 'Contact Us'
    assert_select 'h1', 'Contact Us'
    assert_select 'p', 'Complete the form below'

  end

  test "should get home" do
  get root_url

  assert_response :success
  assert_select 'h1', 'Lib Locker'

end

  test "contact with no email" do

    post contact_path

    assert_not_empty flash[:danger]
    assert_nil flash[:success]
  end

  test "contact with no messahge" do

    post contact_path, params:{name: "attar", email: "d@", telephone: "s" }

    assert_not_empty flash[:danger]
    assert_nil flash[:success]
  end


    test "valid contact" do

      post contact_path, params:{name: "attar", email: "d@", telephone: "s", message: "message" }
      assert_nil flash[:danger]
      assert_not_empty flash[:success]
    end


end
