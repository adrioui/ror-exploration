class EmployeeSerializer < ActiveModel::Serializer
  attributes :id, :nik, :name, :gender, :birth_place, :birth_date, :ktp_address, :domisili, :religion, :marital_status, :metadata
end
