class UsersController < ApplicationController
  before_action :ensure_correct_user, only: [:update, :edit]

  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book = Book.new
    @books0 = Book.where(created_at: Time.zone.now.all_day, user_id: @user.id)
    @books1 = Book.where(created_at: 1.day.ago.all_day, user_id: @user.id)
    @books2 = Book.where(created_at: 2.day.ago.all_day, user_id: @user.id)
    @books3 = Book.where(created_at: 3.day.ago.all_day, user_id: @user.id)
    @books4 = Book.where(created_at: 4.day.ago.all_day, user_id: @user.id)
    @books5 = Book.where(created_at: 5.day.ago.all_day, user_id: @user.id)
    @books6 = Book.where(created_at: 6.day.ago.all_day, user_id: @user.id)
 
  end

  def index
    @users = User.all
    @book = Book.new
  end


  def edit
    @user = User.find(params[:id])
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(@user), notice: "You have updated user successfully."
    else
      render "edit"
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

  def ensure_correct_user
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to user_path(current_user)
    end
  end

end