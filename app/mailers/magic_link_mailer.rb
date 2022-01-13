class MagicLinkMailer < ApplicationMailer
    def sign_in_mail(user)
        @token = user.to_sgid(expires_in: 30.days, for: 'login').to_s
        @user = user

        mail to: @user.email, subject: "Here is your magic link! 🚀"
    end

    def confirm_mail(user)
        @token = user.to_sgid(expires_in: 30.days, for: 'login').to_s
        @user = user

        mail to: @user.email, subject: "Activate your account 🚀"
    end
        
end
