class UsersController < ApplicationController

  def dashboard
    @events = current_user.meal_events
  end

  def edit
  end

  def update
  end

  def upload_picture
  end

  def request_contact
  end

end
