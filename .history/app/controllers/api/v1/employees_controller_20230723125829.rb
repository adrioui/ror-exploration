class Api::V1::EmployeesController < ApplicationController
  def index
  end

  def show
  end

  def create
    employee = Employee.new(
      nik: employee_params[:nik],
      name: employee_params[:name],
      gender: employee_params[:gender],
      birth_place: employee_params[:birth_place],
      birth_date: employee_params[:birth_date],
      ktp_address: employee_params[:ktp_address],
      domisili: employee_params[:domisili],
      religion: employee_params[:religion],
      marital_status: employee_params[:marital_status]
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
