class Api::V1::EmployeesController < ApplicationController
  def index
  end

  def show
  end

  def create
    employee = Employee.new(
      nik,
      name,
      gender,
      birth_place,
      birth_date,
      ktp_address,
      domisili,
      religion,
      marital_status
    )
  end

  def update
  end

  private
  def employee_params
    params.require(:employee).permit({
      nik,
      name,
      gender,
      birth_place,
      birth_date,
      ktp_address,
      domisili,
      religion,
      marital_status
    })
end
