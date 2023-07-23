class Employee < ApplicationRecord
    validates :nik, presence: true, length: { is: 16 }, uniqueness: { message: "NIK must be 16 digits long and should be unique." }
    validates :gender, inclusion: { in: ['male', 'female'], message: "Gender must be 'male' or 'female'." }
  end
  