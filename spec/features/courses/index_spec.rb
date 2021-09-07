require 'rails_helper'

RSpec.describe "index page" do
  before :each do
    @ron = Student.create!(name: "Ron", age: 16, house: "Gryffindor")
    @harry = Student.create!(name: "Harry", age: 16, house: "Gryffindor")
    @hermione = Student.create!(name: "Hermione", age: 16, house: "Gryffindor")
    @draco = Student.create!(name: "Draco", age: 15, house: "Gryffindor")
    @defense = Course.create!(name: "Defense Against the Dark Arts")
    @herb = Course.create!(name: "Herbology")
    @potions = Course.create!(name: "Potions")
    StudentCourse.create!(student: @harry, course: @defense)
    StudentCourse.create!(student: @harry, course: @herb)
    StudentCourse.create!(student: @ron, course: @potions)
    StudentCourse.create!(student: @ron, course: @herb)
    StudentCourse.create!(student: @hermione, course: @potions)
    StudentCourse.create!(student: @hermione, course: @herb)
    StudentCourse.create!(student: @hermione, course: @defense)
    StudentCourse.create!(student: @draco, course: @defense)
  end

  it 'lists all courses and the number of students in each course' do
    visit "/courses"
    expect(page).to have_content("#{@defense.name}: #{@defense.students.count}")
    expect(page).to have_content("#{@herb.name}: #{@herb.students.count}")
    expect(page).to have_content("#{@potions.name}: #{@potions.students.count}")
  end
end
