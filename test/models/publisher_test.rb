require 'test_helper'

class PublisherTest < ActiveSupport::TestCase
  def setup
    @publisher = Publisher.new(name: "Jaico")
  end

  test "Publisher is valid" do
    assert @publisher.valid?
  end

  test "Publisher name should be present" do
    @publisher.name = " "
    assert_not @publisher.valid?
  end

  test "Publisher name should be unique" do
    @publisher.save
    publisher2 = Publisher.new(name: "Jaico")
    assert_not publisher2.valid?
  end

  test "Publisher name must not be too long" do
    @publisher.name = "a"*31
    assert_not @publisher.valid?
  end

  test "Publisher name must not too short" do
    @publisher.name = "aa"
    assert_not @publisher.valid?
  end
end
