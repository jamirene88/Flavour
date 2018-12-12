class MealAvailabilitiesController < ApplicationController
  def index
    @dates = current_user.meal_availabilities
  end

  def create
  end

  def destroy
  end

end
