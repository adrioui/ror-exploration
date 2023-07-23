class Api::V1::EmployeesController < ApplicationController
  def index
    employees = Employee.all
    render json: employees, status: 200
  end

  def show
    # Your implementation here...
  end

  def create
    employee = Employee.new(employee_params)

    if employee.save
      render json: employee, status: 200
    else
      render json: { error: "Error creating new employee..." }, status: 422
    end
  end

  def update
    # Your implementation here...
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
end