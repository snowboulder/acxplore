require 'test_helper'

class ActivityTest < ActiveSupport::TestCase

  def setup
    @activity = Activity.new(name: "Bouldering", group: "Sporty",
                             description: "no ropes, no harness",
                             range: "15-30", duration: "2 Hours - 2 Hour 30 Mins",
                             environment: "Indoor", subgroup: "leisure",
                             season: "All season")
  end

  test "should be valid" do
    assert @activity.valid?
  end

  test "name should be present" do
    @activity.name = "   "
    assert_not @activity.valid?
  end

  test "group should be present" do
    @activity.group = "   "
    assert_not @activity.valid?
  end

  test "name should not be too long" do
    @activity.name = "a" * 51
    assert_not @activity.valid?
  end

  test "group should not be too long" do
    @activity.group = "a" * 51
    assert_not @activity.valid?
  end

  test "description content should be present" do
    @activity.description = "   "
    assert_not @activity.valid?
  end

  test "description should have a maximum of 500 characters" do
    @activity.description = "a" * 501
    assert_not @activity.valid?
  end

  test "name should be unique" do
    duplicate_activity = @activity.dup
    duplicate_activity.name = @activity.name.upcase
    @activity.save
    assert_not duplicate_activity.valid?
  end

  test "range should be present" do
    @activity.range = "   "
    assert_not @activity.valid?
  end

  test "range should not be too long" do
    @activity.range = "a" * 51
    assert_not @activity.valid?
  end

  # test for '-' in price range

  test "duration should be present" do
    @activity.duration = "   "
    assert_not @activity.valid?
  end

  test "duration should not be too long" do
    @activity.duration = "a" * 51
    assert_not @activity.valid?
  end

  test "environment should be present" do
    @activity.environment = "   "
    assert_not @activity.valid?
  end

  test "environment should not be too long" do
    @activity.environment = "a" * 51
    assert_not @activity.valid?
  end

  test "subgroup should be present" do
    @activity.subgroup = "   "
    assert_not @activity.valid?
  end

  test "subgroup should not be too long" do
    @activity.subgroup = "a" * 51
    assert_not @activity.valid?
  end

  test "season should be present" do
    @activity.season = "   "
    assert_not @activity.valid?
  end

  test "season should not be too long" do
    @activity.season = "a" * 51
    assert_not @activity.valid?
  end

end