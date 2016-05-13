require 'test_helper'

class ActivitiesCreationTest < ActionDispatch::IntegrationTest

  def setup
    @admin = users(:lelouch)
  end

  test "invalid activity creation information" do
    log_in_as(@admin)
    get acreation_path
    assert_no_difference 'Activity.count' do
      post activities_path, activity: { name:        "",
                                        note:        "foo",
                                        description: "bar",
                                        range:       "2345",
                                        environment: "sfea",
                                        duration:    "",
                                        season:      "",
                                        min_people:  "wsd",
                                        max_people:  "sdf"}
    end
    assert_template 'activities/new'
  end

  test "valid activity creation information" do
    log_in_as(@admin)
    get acreation_path
    assert_difference 'Activity.count', 1 do
      post_via_redirect activities_path, activity: { name:        "Top-rope",
                                                     note:        "ayyy",
                                                     description: "With rope and harness",
                                                     range:       "20-40",
                                                     environment: "Indoor",
                                                     duration:    "1 h 30 mins",
                                                     season:      "All Season",
                                                     min_people:  "2",
                                                     max_people:  "10"}
    end
    assert_template 'activities/show'
  end

end
