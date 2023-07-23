class Employee < ApplicationRecord
    validates :nik, presence: true, length: { is: 16 }, uniqueness: true
    # Other validations and model code...
  end
  