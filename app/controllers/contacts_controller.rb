class ContactsController < ApplicationController
  def create
    contact = Contact.new(contact_params)
    company = Company.find(params[:company_id])

    contact.company = company

    if contact.save
      flash[:success] = "Added #{contact.name} as a contact."
    else
      flash[:error] = 'There was an erorr adding the contact.'
    end

    redirect_to company_path(company)
  end

  def edit
    @contact = Contact.find(params[:id])
    @company = Company.find(params[:company_id])
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :role, :email)
  end
end