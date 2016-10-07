class ContactMailer < ApplicationMailer
  default from: Settings.email.contact_confirm_address

  def contact_confirm_email(contact)
    @contact = contact
    attachments.inline['logo.png'] = File.read('public/images/logo.png')
    mail(to: [contact[:email]], subject: "PREMIO DE JORNALISMO: Contato")
  end

  def contact_request_received(contact)
    @contact = contact
    subject_string = 'Contato Premio de Jornalismo de ' + contact[:name]
    mail(to: Settings.email.contact_confirm_address, from: contact[:email], subject: subject_string)
  end
end
