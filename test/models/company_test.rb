require 'test_helper'

class CompanyTest < ActiveSupport::TestCase

  def setup
    @company = companies(:bo)
  end

  test "company should be valid" do
    assert @company.valid?
  end

  test "company name should be present" do
    @company.name = "   "
    assert_not @company.valid?
  end

  test "description should be present" do
    @company.description = "   "
    assert_not @company.valid?
  end

  test "address should be present" do
    @company.address = "   "
    assert_not @company.valid?
  end

  test "link should be present" do
    @company.link = "   "
    assert_not @company.valid?
  end

  test "company name should not be too long" do
    @company.name = "a" * 51
    assert_not @company.valid?
  end

  test "description should be < 1000 characters" do
    @company.description = "a" * 1001
    assert_not @company.valid?
  end

  test "address should not be too long" do
    @company.address = "a" * 251
    assert_not @company.valid?
  end

  test "link name should not be too long" do
    @company.link = "a" * 251
    assert_not @company.valid?
  end

  test "company link validation should reject invalid websites" do
    invalid_websites = %w[start@wars,com quigon_at_foo.org @user.case.com]

    invalid_websites.each do |invalid_website|
      @company.link = invalid_website
      assert_not @company.valid?, "#{invalid_website.inspect} should be invalid!"
    end
  end

end
