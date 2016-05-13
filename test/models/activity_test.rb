require 'test_helper'

class ActivityTest < ActiveSupport::TestCase

  def setup
    @activity = activities(:bouldering)
    #@activity = Activity.new(name: "Bouldering", group: "Sporty",
    #                         description: "no ropes, no harness",
    #                         range: "15-30", duration: "2 Hours - 2 Hour 30 Mins",
    #                         environment: "Indoor", subgroup: "Leisure",
    #                         season: "All season", min_people: "3", max_people: "10")
  end

  test "should be valid" do
    assert @activity.valid?
  end

  test "name should be present" do
    @activity.name = "   "
    assert_not @activity.valid?
  end

  test "name should not be too long" do
    @activity.name = "a" * 51
    assert_not @activity.valid?
  end

  test "description content should be present" do
    @activity.description = "   "
    assert_not @activity.valid?
  end

  test "description should have a maximum of 1000 characters" do
    @activity.description = "a" * 1001
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

  test "note should not be too long" do
    @activity.note = "a" * 51
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

  test "Minimum number of people should have maximum of 2 digits" do
    @activity.min_people = "123"
    assert_not @activity.valid?
  end

  test "Minimum number should be present" do
    @activity.min_people = ""
    assert_not @activity.valid?
  end

  test "Minimum number of people should have a maximum  of 2 digits" do
    @activity.max_people = "123"
    assert_not @activity.valid?
  end

  test "Maximum number should be present" do
    @activity.max_people = ""
    assert_not @activity.valid?
  end

end
