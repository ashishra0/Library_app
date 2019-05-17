require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  def setup
    @category = Category.new(name: "Sports")
  end

  test "Category should be valid" do
    assert @category.valid?
  end
  
  test "Category name must be present" do
    @category.name = " "
    assert_not @category.valid?
  end

  test "Category name must be unique" do
    @category.save
    category2 = Category.new(name: "Sports")
    assert_not category2.valid?
  end

  test "Category name must not be too long" do
    @category.name = "a"*31
    assert_not @category.valid?
  end

  test "Category name must mot be too short" do
    @category.name = "aa"
    assert_not @category.valid?
  end
end
