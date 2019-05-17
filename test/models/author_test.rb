require 'test_helper'

class AuthorTest < ActiveSupport::TestCase
  def setup
    @author = Author.new(name: "Robin Sharma")
  end

  test "Author must be valid" do
    assert @author.valid?
  end

  test "Author name must be present" do
    @author.name = " "
    assert_not @author.valid?
  end

  test "Author name should be unique" do
    @author.save
    author2 = Author.new(name: "Robin Sharma")
    assert_not author2.valid?
  end

  test "Author name must not be too long" do
    @author.name = "a"*31
    assert_not @author.valid?
  end

  test "Author name must not be too short" do
    @author.name = "aa"
    assert_not @author.valid?
  end
end
