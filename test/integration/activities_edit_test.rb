require 'test_helper'

class ActivitiesEditTest < ActionDispatch::IntegrationTest

  def setup
    @admin     = users(:lelouch)
    @non_admin = users(:suzaku)
    @activity  = activities(:bouldering)
  end

  test "unsuccessful activity edit" do
    log_in_as(@admin)
    get activity_path(@activity)
    get edit_activity_path(@activity)
    assert_template 'activities/edit'
    patch activity_path(@activity), activity: { name:        "",
                                                group:       "hey",
                                                subgroup:    "foo",
                                                description: "bar",
                                                range:       "2345",
                                                environment: "sfea",
                                                duration:    "",
                                                season:      "",
                                                min_people:  "wsd",
                                                max_people:  "sdf"}
    assert_template 'activities/edit'
  end

  test "successful edit" do
    log_in_as(@admin)
    get activity_path(@activity)
    get edit_activity_path(@activity)
    assert_template 'activities/edit'
    name =        "Bouldering"
    group =       "Sporty"
    subgroup =    ""
    description = "no harness no rope"
    range =       "23-33"
    environment = "Indoor"
    duration =    "1 h 30 mins"
    season =      "All Season"
    min_people =  "2"
    max_people =  "10"
    patch activity_path(@activity), activity: { name:        name,
                                                group:       group,
                                                subgroup:    subgroup,
                                                description: description,
                                                range:       range,
                                                environment: environment,
                                                duration:    duration,
                                                season:      season,
                                                min_people:  min_people,
                                                max_people:  max_people }
    assert_not flash.empty?
    assert_redirected_to @activity
    @activity.reload
    assert_equal name,  @activity.name
    assert_equal group, @activity.group
  end

  test "successful activity edit with friendly forwarding" do
    get edit_activity_path(@activity)
    log_in_as(@admin)
    assert_redirected_to edit_activity_path(@activity)
    name =        "Bouldering"
    group =       "Sporty"
    subgroup =    ""
    description = "no harness no rope"
    range =       "23-33"
    environment = "Indoor"
    duration =    "1 h 30 mins"
    season =      "All Season"
    min_people =  "2"
    max_people =  "10"
    patch activity_path(@activity), activity: { name:        name,
                                                group:       group,
                                                subgroup:    subgroup,
                                                description: description,
                                                range:       range,
                                                environment: environment,
                                                duration:    duration,
                                                season:      season,
                                                min_people:  min_people,
                                                max_people:  max_people }
    assert_not flash.empty?
    assert_redirected_to @activity
    @activity.reload
    assert_equal name,  @activity.name
    assert_equal group, @activity.group
  end



end
