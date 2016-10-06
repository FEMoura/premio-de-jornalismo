class ContactsController < ApplicationController

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      redirect_to root_path(anchor: 'contact'), notice: 'Mensagem enviada com sucesso, em breve retornaremos seu contato.'
    else
      contact_hash = Hash.new
      contact_hash[:name] = @contact.name
      contact_hash[:email] = @contact.email
      contact_hash[:message] = @contact.message
      redirect_to root_path(anchor: 'contact', contact: contact_hash), alert: 'Mensagem não enviada. Verificar os dados.'
    end
  end

  private
    def contact_params
      params.require(:contact).permit(:name, :email, :message)
    end
end
