class ApplicationController < ActionController::Base
    helper_method :current_user
    helper_method :logged_in?
    helper_method :send_mail
    helper_method :show_search
    
    add_flash_types :info, :error, :warning

    def current_user
        User.find_by(id: session[:user_id])
    end

    def logged_in?
        !current_user.nil?
    end

    def authorized
        redirect_to root_path unless logged_in?
    end

    def show_search
        if request.path == "/users/new" || request.path == "/login" || request.path == "/users/edit"|| request.path == "/user/edit"
            return false
        else
            return true
        end
    end
end
