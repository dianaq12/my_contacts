class ContactsController < ApplicationController

  def index
    @contacts = Contact.all
  end

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    @contact.addresses.new if @contact.addresses.size == 0

    if @contact.save
      redirect_to action: :index
    else

      flash[:alert] = "Can't save your contact.  Try Again!"
      render "new"

    end
  end

  def edit
    @contact = Contact.find(params[:id])
    @contact.addresses.new if @contact.addresses.size == 0
  end

  def update
    @contact = Contact.find(params[:id])

    if  @contact.update_attributes(contact_params)
      redirect_to action: :show, id: @contact.id
    else
      flash[:alert] = "Can't save your contact.  Try Again!"
      render "edit"
    end


  end

  def show
    @contact = Contact.find(params[:id])
  end

  def destroy
    @contact = Contact.find(params[:id])
    @contact.destroy

    redirect_to action: :index
  end
private

  def contact_params
    params.require(:contact).permit(:first_name, :last_name, :home_phone, :cell_phone, :email, addresses_attributes:[:id, :contact_id, :address_type, :street, :city, :state, :zip])
  end
end
