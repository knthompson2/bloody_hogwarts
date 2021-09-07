class Student < ApplicationRecord
  validates :name, presence: true
  validates :age, presence: true, numericality: true
  validates :house, presence: true
  has_many :student_courses
  has_many :courses, through: :student_courses

  def self.age
    average(:age).to_f.round(1)
  end
end
