class UsersController < ApplicationController
  before_filter :require_no_user, :only => [:new, :create]
  before_filter :require_user, :only => [:show, :edit, :update]
  before_filter :set_user

  def show
  end

  def edit
  end

  def update
    respond_to do |format|
      if @user.update_attributes(params[:user])
        redirect_to(user_path, :notice => 'User was successfully update.')
      else
        @user = current_user
        render :action => 'edit', :id => current_user.id
      end
    end
  end

  private

    def set_user
      @user = current_user
    end
end
