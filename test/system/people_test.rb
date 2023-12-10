require "application_system_test_case"

class PeopleTest < ApplicationSystemTestCase
  setup do
    @person = people(:one)
  end

  test "visiting the index" do
    visit people_url
    assert_selector "h1", text: "People"
  end

  test "should create person" do
    visit people_url
    click_on "New person"

    fill_in "Address county", with: @person.address_county
    fill_in "Address street", with: @person.address_street
    fill_in "Age", with: @person.age
    fill_in "College", with: @person.college
    fill_in "Course", with: @person.course
    fill_in "Email", with: @person.email
    fill_in "First name", with: @person.first_name
    fill_in "Gender", with: @person.gender
    fill_in "Last name", with: @person.last_name
    fill_in "Phone", with: @person.phone
    fill_in "User name", with: @person.user_name
    fill_in "Year", with: @person.year
    click_on "Create Person"

    assert_text "Person was successfully created"
    click_on "Back"
  end

  test "should update Person" do
    visit person_url(@person)
    click_on "Edit this person", match: :first

    fill_in "Address county", with: @person.address_county
    fill_in "Address street", with: @person.address_street
    fill_in "Age", with: @person.age
    fill_in "College", with: @person.college
    fill_in "Course", with: @person.course
    fill_in "Email", with: @person.email
    fill_in "First name", with: @person.first_name
    fill_in "Gender", with: @person.gender
    fill_in "Last name", with: @person.last_name
    fill_in "Phone", with: @person.phone
    fill_in "User name", with: @person.user_name
    fill_in "Year", with: @person.year
    click_on "Update Person"

    assert_text "Person was successfully updated"
    click_on "Back"
  end

  test "should destroy Person" do
    visit person_url(@person)
    click_on "Destroy this person", match: :first

    assert_text "Person was successfully destroyed"
  end
end
