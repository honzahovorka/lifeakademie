class ContactMessagesController < ApplicationController

  # POST /kontakt
  def create
    @contact_message = ContactMessage.new(params[:contact_message])

    if @contact_message.valid?
      redirect_to contact_path, notice: 'Zpráva úspěšně odeslána.'
    else
      render 'pages/contact'
    end
  end

end
