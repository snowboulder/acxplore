require 'test_helper'

class HomePageControllerTest < ActionController::TestCase
  test "should get home" do
    get :home
    assert_select "title", "Home | Acxplore"
  end

  test "should get about" do
    get :about
    assert_select "title", "About | Acxplore"
  end

  test "should get contact" do
    get :contact
    assert_select "title", "Contact | Acxplore"
  end

  test "should get help" do
    get :help
    assert_select "title", "Help | Acxplore"
  end

end
