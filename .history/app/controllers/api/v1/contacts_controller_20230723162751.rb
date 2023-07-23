class Api::V1::ContactsController < ApplicationController
  def index
  end

  def show
  end

  def create
    contact = Contact.new(employee_params)

    if employee.save
      render json: employee, status: 200
    else
      render json: { error: employee.errors.full_messages.join(", ") }, status: 422
    end
  end

  def update
  end

  private

  def contact_params
    params.require(:contact).permit(:phone, :email, :npwp, :bpjs_kesehatan, :bpjs_ketenagakerjaan, :employee_id)
  end
end
