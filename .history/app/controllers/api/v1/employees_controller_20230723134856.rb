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

    if employee.save
      render json: employee, status: 200
    else
      render json: { error: employee.errors.full_messages.join(", ") }, status: 422
    end
  end

  def update
    employee = Employee.find_by(id: params[:id])
  
    if employee
      if employee.update(domisili: employee_params[:domisili])
        render json: employee, status: 200
      else
        render json: { error: "Failed to update employee. Only 'domisili' and 'marital_status' can be updated. #{employee.errors.full_messages.join(', ')}" }, status: 422
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
end
