require 'rails_helper'

RSpec.describe Student, type: :model do

  describe 'validations' do
    it {should validate_presence_of :name}
    it {should validate_presence_of :age}
    it {should validate_presence_of :house}
  end

  describe 'relationships' do
    it {should have_many :student_courses}
    it {should have_many(:courses).through(:student_courses)}
  end

  it 'should average age of students' do
    @ron = Student.create!(name: "Ron", age: 16, house: "Gryffindor")
    @harry = Student.create!(name: "Harry", age: 16, house: "Gryffindor")
    @hermione = Student.create!(name: "Hermione", age: 16, house: "Gryffindor")
    @draco = Student.create!(name: "Draco", age: 15, house: "Gryffindor")

    expect(Student.age).to eq(15.8)
  end

end
