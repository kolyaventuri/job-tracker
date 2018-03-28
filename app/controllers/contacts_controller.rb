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

  def update
    company = Company.find(params[:company_id])
    contact = Contact.find(params[:id])
    if contact.update(contact_params)
      flash[:success] = "#{contact.name} updated"
      redirect_to company_path(company)
    else
      flash[:error] = 'There was an error updating that concat.'
      render :edit
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :role, :email)
  end
end