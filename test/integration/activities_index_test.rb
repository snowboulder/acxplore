require 'test_helper'

class ActivitiesIndexTest < ActionDispatch::IntegrationTest

  def setup
    @admin = users(:lelouch)
  end

  test "index including pagination" do
    log_in_as(@admin)
    get activities_path
    assert_template 'activities/index'
    assert acreation_path
    assert_select 'div.pagination'
    Activity.paginate(page: 1).each do |activity|
      assert_select 'a[href=?]', activity_path(activity), text: activity.name
    end
  end
end
