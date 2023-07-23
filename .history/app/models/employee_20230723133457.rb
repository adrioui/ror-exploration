class Employee < ApplicationRecord
    validates :nik, presence: true, length: { is: 16 }, uniqueness: { message: "NIK must be 16 digits long and should be unique." }
    validates :gender, presence: { message: "Gender must be specified as 'male' or 'female'." }, inclusion: { in: ['male', 'female'], message: "Gender must be 'male' or 'female'." }
  end
  