class WelcomeController < ApplicationController

  def home

  end

  def contact


  end


  def request_contact
  #  params.require(contact_path).permit!
  #  allParams = params[:name]
#   render plain: params[:name].inspect
    name = params[:name]
    email = params[:email]
    telephone = params[:telephone]
    message = params[:message]

    if (email.blank?)
      flash[:danger] = "Please enter email"
      render 'contact'
    else
      if (message.blank?)
        flash[:danger] = "Please enter a message"
        render 'contact'
      else
        flash[:success] = "Email sent"
        redirect_to root_path
      end
    end
  end
end
