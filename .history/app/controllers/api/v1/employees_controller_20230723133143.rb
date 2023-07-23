class Api::V1::EmployeesController < ApplicationController
  def index
    employees = Employee.all
    render json: employees, status: 200
  end

  def show
    employee = Employee.find_by(id: params[:id])
    if employee
      render json: employee, status: 200
    else
      render json: { error: "Employee not found..." }, status: 404
    end
  end

  def create
    employee = Employee.new(employee_params)

    if valid_nik?(employee.nik) && employee.save
      render json: employee, status: 200
    else
      render json: { error: "Invalid NIK or Error creating new employee..." }, status: 422
    end
  end

  def update
    employee = Employee.find_by(id: params[:id])
    if employee
      if employee.update(employee_params)
        render json: employee, status: 200
      else
        render json: { error: "Error updating employee..." }, status: 422
      end
    else
      render json: { error: "Employee not found..." }, status: 404
    end
  end

  private

  def employee_params
    params.require(:employee).permit(
      :nik,
      :name,
      :gender,
      :birth_place,
      :birth_date,
      :ktp_address,
      :domisili,
      :religion,
      :marital_status
    )
  end

  def valid_nik?(nik)
    nik.to_s.length == 16 && nik.to_s.match?(/\A\d+\z/)
  end
end
