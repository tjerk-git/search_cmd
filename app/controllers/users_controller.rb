class UsersController < ApplicationController
  before_action :set_user, only: %i[new show destroy ]
  before_action :authorized, only: [:edit, :update]


	def index

	end

	def new
		@user = User.new
	end

  # Needs authentication
  def edit
    @user = current_user
  end

  def create
    @user = User.new(user_params)
  
    respond_to do |format|
      if @user.save && send_mail(@user)
        format.html { redirect_to root_url, succes: "Check your email" }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
		
  end

  def update
    @user = current_user

    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to user_url(@user.slug), succes: "User was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    if params[:email].present? 
      @user = current_user

      if @user.email == params[:email]
        @user.destroy
        redirect_to root_url, info: "User was successfully deleted." 
      else
        redirect_to edit_user_path, info: "Something went wrong." 
      end
    end
  end

	def search
		if params[:name_search].present?
			@users = User.filter_by_name(params[:name_search])
		else
			@users = []
		end

		respond_to do |format|
				format.turbo_stream do
				render turbo_stream: turbo_stream.update(
						"search_results",
						partial: "users/search_results",
						locals: { users: @users })
				end
		end
	end

	private
	# Use callbacks to share common setup or constraints between actions.
	def set_user
		@user = User.find_by_slug(params[:slug])
	end

	# Only allow a list of trusted parameters through.
	def user_params
			params.require(:user).permit(:name, :email, :teams_link, :dribble_link, :bio)
	end
end

