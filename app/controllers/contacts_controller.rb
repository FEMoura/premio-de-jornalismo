class ContactsController < ApplicationController

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      ContactMailer.contact_confirm_email(contact_params).deliver_later
      ContactMailer.contact_request_received(contact_params).deliver_later
      redirect_to root_path(anchor: 'contact'), notice: 'Mensagem enviada com sucesso, em breve retornaremos seu contato.'
    else
      contact_hash = Hash.new
      contact_hash[:name] = @contact.name
      contact_hash[:email] = @contact.email
      contact_hash[:message] = @contact.message
      error_notice = String.new
      if @contact.name.blank?
        error_notice << 'Nome não pode ficar em branco.'
      end
      if @contact.email.blank?
        error_notice << ' Email não pode ficar em branco.'
      end
      if @contact.message.blank?
        error_notice << ' Mensagem não pode ficar em branco.'
      end
      if @contact.name && @contact.email && @contact.message && error_notice.blank?
        error_notice << ' Verificar o formato do email.'
      end
      redirect_to root_path(anchor: 'contact', contact: contact_hash),
                  alert: 'Mensagem não enviada. Verificar os dados.',
                  notice: error_notice
    end
  end

  private
    def contact_params
      params.require(:contact).permit(:name, :email, :message)
    end
end
