class DashboardsController < ApplicationController

  def index
    User.find(params[:user_id])
  end

  def created_events
    @user = User.find(params[:user_id])
    @events = Event.where(presenter: current_user)
  end

  def participated_events
    @user = User.find(params[:user_id])
    @events = Event.where(user: current_user)
  end
end
