
class UsersController < ApplicationController
  before_action :set_user, only: %i[new show destroy ]
  before_action :authorized, only: [:edit, :update]

	def index
    @users = User.all
    respond_to do |format|
      format.html { render :index }
      format.json 
    end
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
      if @user.save && MagicLinkMailer.confirm_mail(@user).deliver_now
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
        format.html { redirect_to edit_user_url(@user.slug), succes: "User was successfully updated." }
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

	private
	# Use callbacks to share common setup or constraints between actions.
	def set_user
		@user = User.find_by_slug(params[:slug])
	end

	# Only allow a list of trusted parameters through.
	def user_params
			params.require(:user).permit(
          :name, :email, :teams_link,
          :dribble_link, :bio, :show_email,
          :show_teams, :avatar, :cats_or_dogs,
          :coffee_or_tea, :glasses, :music,
          :patat_or_friet, :height, :shape)
	end
end

