class DashboardsController < ApplicationController

  def index
    @user = User.find(params[:user_id])
    @created_events = Event.where(presenter: current_user)
    @events = @user.events
  end

  def created_events
    @user = User.find(params[:user_id])
    @events = Event.where(presenter: current_user)
  end

  def participated_events
    @user = User.find(params[:user_id])
    @events = @user.events
  end
end
