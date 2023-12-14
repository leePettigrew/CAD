# test/models/person_test.rb
require "test_helper"

class PersonTest < ActiveSupport::TestCase
  test "should not save person without first name" do
    person = Person.new
    assert_not person.save, "Saved the person without a first name"
  end
end
