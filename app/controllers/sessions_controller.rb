class SessionsController < ApplicationController

  def login

  end

  def new
    email = params.require(:email)
    user = User.find_by_email(email)

    if user
      MagicLinkMailer.sign_in_mail(user).deliver_now
      redirect_to login_path, info: "Check your email for login link" 
    else
      redirect_to login_path, error: "Something is wrong, got the right e-mailadress?" 
    end
  end

  def destroy
    session[:user_id] = nil
    
    redirect_to root_path, info: "Bye" 
  end 

  def confirm
    sgid = params.require(:sgid)
    user = GlobalID::Locator.locate_signed(sgid, for: 'login')

    if user.nil? || !user.is_a?(User)
      redirect_to root_path
    else
      user.confirm = 1
      user.save
      session[:user_id] = user.id
      redirect_to root_path
    end

  end

  def magic_link
    sgid = params.require(:sgid)
  
    user = GlobalID::Locator.locate_signed(sgid, for: 'login')
  
    if user.nil? || !user.is_a?(User)
      redirect_to root_path
    else
      session[:user_id] = user.id
      redirect_to root_path
    end
  end
end
