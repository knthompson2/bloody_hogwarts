require "rails_helper"

RSpec.describe 'index page' do
  before :each do
    @ron = Student.create!(name: "Ron", age: 16, house: "Gryffindor")
    @harry = Student.create!(name: "Harry", age: 16, house: "Gryffindor")
    @hermione = Student.create!(name: "Hermione", age: 16, house: "Gryffindor")
    @draco = Student.create!(name: "Draco", age: 15, house: "Gryffindor")
  end

  it 'lists all students and their attributes' do
    visit '/students'
    expect(page).to have_content(@ron.name)
    expect(page).to have_content(@ron.age)
    expect(page).to have_content(@ron.house)
    expect(page).to have_content(@harry.name)
    expect(page).to have_content(@harry.age)
    expect(page).to have_content(@harry.house)
    expect(page).to have_content(@hermione.name)
    expect(page).to have_content(@hermione.age)
    expect(page).to have_content(@hermione.house)
    expect(page).to have_content(@draco.name)
    expect(page).to have_content(@draco.age)
    expect(page).to have_content(@draco.house)
  end

  it 'displays the average age of all students' do
    visit "/students"
    save_and_open_page
    expect(page).to have_content(Student.age)
  end
end
