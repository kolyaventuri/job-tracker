class ContactsController < ApplicationController
  def create
    contact = Contact.new(contact_params)

    contact.company = company

    if contact.save
      flash[:success] = "Added #{contact.name} as a contact."
    else
      flash[:error] = 'There was an erorr adding the contact.'
    end

    redirect_to company_path(company)
  end

  def edit
    @contact = contact
    @company = company
  end

  def update
    if contact.update(contact_params)
      flash[:success] = "#{contact.name} updated"
      redirect_to company_path(company)
    else
      flash[:error] = 'There was an error updating that concat.'
      render :edit
    end
  end

  def destroy
    name = contact.name
    if contact.destroy
      flash[:success] = "#{name} deleted successfully!"
    else
      flash[:error] = 'There was an error deleting that contact'
    end

    redirect_to company_path(company)
  end

  private

  def contact
    Contact.find(params[:id])
  end

  def company
    Company.find(params[:company_id])
  end

  def contact_params
    params.require(:contact).permit(:name, :role, :email)
  end
end