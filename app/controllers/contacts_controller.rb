# Contact form controller
class ContactsController < ApplicationController
  def new
    @contact_form = Contact.new name: current_user.try(:name),
                                email: current_user.try(:email)
  end

  def create
    @contact_form = Contact.new contact_params

    if @contact_form.valid?
      ContactMailer.contact_email(@contact_form.name,
                                  @contact_form.message,
                                  @contact_form.email).deliver_later

      flash[:notice] = 'Your contacts was sent by email'
      redirect_to new_contact_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def contact_params
    params.require(:contact).permit :name, :email, :message
  end
end
