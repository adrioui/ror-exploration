class Api::V1::EmployeesController < ApplicationController
  def index
    page = params[:page].to_i || 1
    per_page = params[:per_page].to_i || 10

    employees = Employee.paginate(page: page, per_page: per_page)

    render json: employees, meta: pagination_meta(employees, page)
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
      updated_attributes = employee_params.slice(:domisili, :marital_status)
  
      if employee.update(updated_attributes)
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

  def pagination_meta(collection)
    {
      current_page: collection.current_page,
      per_page: collection.per_page,
      total_pages: collection.total_pages,
      total_count: Employee.count
    }
  end
end
