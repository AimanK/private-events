class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @all_events = @user.created_events

     if @all_events.any?
        render :show
     else
        flash[:alert] = "No events found for this creator." 
        render :show
     end
  end
end
