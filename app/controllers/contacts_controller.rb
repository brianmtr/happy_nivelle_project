class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(params[:contact])
    @contact.request = request
    respond_to do |format|
      if @contact.deliver
        format.html { redirect_to new_contact_path, notice: "Merci pour votre message, nous vous recontactons très vite !" }
        format.json { render :new, status: :created, location: new_contact_path }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end

  end

  private

  def contact_params
      params.require(:contact).permit(:name, :email, :message, :captcha, :rgpd)
    end
end