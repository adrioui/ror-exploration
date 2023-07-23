class Api::V1::ContactsController < ApplicationController
  def index
    contacts = Contact.all
    render json: contacts
  end

  def show
  end

  def create
    contact = Contact.new(contact_params)

    if contact.save
      render json: contact, status: 200
    else
      render json: { error: contact.errors.full_messages.join(", ") }, status: 422
    end
  end

  def update
  end

  private

  def contact_params
    params.require(:contact).permit(:phone, :email, :npwp, :bpjs_kesehatan, :bpjs_ketenagakerjaan, :employee_id)
  end
end
