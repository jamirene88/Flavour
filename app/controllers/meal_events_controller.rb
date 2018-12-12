class MealEventsController < ApplicationController
  def attendee_list
    @meal = MealEvent.find(params[:id])
    if @meal.reservation_date < Date.today
      @attendee_list = @meal.users
    # else
    #   render :error_attendees
    end
  end
end
