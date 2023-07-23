class Employee < ApplicationRecord
    validates :nik, presence: true, length: { is: 16 }, uniqueness: true
    validates :gender, presence: true, inclusion: { in: ['male', 'female'] }
    validates :birth_place, :birth_date, :ktp_address, :domisili, :religion, :marital_status, presence: true
    validate :validate_nik_birth_date
  
    private
  
    def validate_nik_birth_date
      return unless nik.present? && birth_date.present?
  
      nik_date_part = nik[6, 6]
      puts "The NIK date part is: #{nik_date_part}"
      formatted_birth_date = birth_date.strftime("%d%m%Y")
      puts "The formatted birth date is: #{formatted_birth_date}"
  
      unless nik_date_part == formatted_birth_date
        errors.add(:nik, "The second six digits of the NIK must match the birth date (DDMMYYYY).")
      end
    end
  end
  