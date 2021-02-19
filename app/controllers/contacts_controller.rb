class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(params[:contact])
    @contact.request = request
    if @contact.deliver
      flash.now[:notice] = 'Merci pour votre message, nous vous recontactons très vite !'
    else
      flash.now[:error] = 'Le message n\'a pas pu être envoyé.'
      render :new
    end
  end

  private

  def contact_params
      params.require(:contact).permit(:name, :email, :message, :captcha, :rgpd)
    end
end