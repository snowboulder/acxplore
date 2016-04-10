require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest

  def setup
    @admin     = users(:lelouch)
    @non_admin = users(:suzaku)
  end

  test "basic layout links" do
    get root_path
    assert_template 'home_page/home'
    assert_select "a[href=?]", root_path, count: 2
    assert_select "a[href=?]", help_path
    assert_select "a[href=?]", about_path
    assert_select "a[href=?]", contact_path
  end

  test "admin layout links" do
    log_in_as(@admin)
    get root_path
    assert_select "a[href=?]", users_path
    #assert_select "a[href=?]", acreation_path
  end

  test "non-admin layout links" do
    log_in_as(@non_admin)
    assert_select 'a', text: 'Users', count: 0
    assert_select 'a', text: 'Activities', count: 0
  end

end
