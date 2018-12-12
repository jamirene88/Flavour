class UsersController < ApplicationController

  def dashboard
    @events = current_user.meal_events
  end

  def edit
  end

  def update
    @user = User.find(current_user)
    @user.update(params_update)
    @user.remote_photo_url = @user[:photo]
    @user.save

    if @user.valid?
      redirect_to dashboard_path
    else
      render :edit
    end
  end

  def upload_picture
  end

  def request_contact
    # implement mailer call
  end

  private
  def params_update
    params.require(:user).permit(:name, :age, :gender, :email, :photo)
  end
end
