require 'test_helper'

class HomePageControllerTest < ActionController::TestCase

  def setup
    @base_title = "Acxplore"
  end

  test "should get home" do
    get :home
    assert_select "title", "#{@base_title}"
  end

  test "should get about" do
    get :about
    assert_select "title", "About | #{@base_title}"
  end

  test "should get contact" do
    get :contact
    assert_select "title", "Contact | #{@base_title}"
  end

  test "should get help" do
    get :help
    assert_select "title", "Help | #{@base_title}"
  end

end
