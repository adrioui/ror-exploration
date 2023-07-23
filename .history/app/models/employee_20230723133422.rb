class Employee < ApplicationRecord
    validates :nik, presence: true, length: { is: 16 }, uniqueness: true
    validates :gender, presence: true, inclusion: { in: ['male', 'female'] }
  end
  