require "rails_helper"

RSpec.describe 'show page' do
  before :each do
    @ron = Student.create!(name: "Ron", age: 16, house: "Gryffindor")
    @harry = Student.create!(name: "Harry", age: 16, house: "Gryffindor")
    @defense = Course.create!(name: "Defense Against the Dark Arts")
    @herb = Course.create!(name: "Herbology")
    @potions = Course.create!(name: "Potions")
    StudentCourse.create!(student: @harry, course: @defense)
    StudentCourse.create!(student: @harry, course: @herb)
    StudentCourse.create!(student: @ron, course: @potions)

  end

  it "lists all of a student's courses" do
    visit "/students/#{@harry.id}"
    expect(page).to have_content(@harry.name)
    expect(page).to have_content("Defense Against the Dark Arts")
    expect(page).to have_content("Herbology")
  end
end
