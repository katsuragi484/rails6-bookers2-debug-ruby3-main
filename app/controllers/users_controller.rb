class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:top]
  before_action :ensure_correct_user, only: [:update, :edit]

  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book = Book.new


    @today_book =  @books.created_today
    @yesterday_book = @books.created_yesterday
    @two_days_ago_book = @books.created_two_days_ago
    @three_days_ago_book = @books.created_three_days_ago
    @four_days_ago_book = @books.created_four_days_ago
    @five_days_ago_book = @books.created_five_days_ago
    @six_days_ago_book = @books.created_six_days_ago
    @this_week_book = @books.created_this_week
    @last_week_book = @books.created_last_week

  
    if params[:created_at] == ""
      @search_book = "日付を選択してください"#①
    else
      create_at = params[:created_at]
      @search_book = @books.where(['created_at LIKE ? ', "#{create_at}%"]).count#②
    end
    

    to  = Time.current.at_end_of_day
    from  = (to - 6.day).at_beginning_of_day
    @books = @user.books.includes(:favorites).sort_by {|x| x.favorites.where(created_at: from...to).size}.reverse


    @current_entry = Entry.where(user_id: current_user.id)
    @another_entry = Entry.where(user_id: @user.id)
    unless @user.id == current_user.id
      @current_entry.each do |current|
        @another_entry.each do |another|
          if current.room_id == another.room_id
            @is_room = true
            @room_id = current.room_id
          end
        end
      end
      unless @is_room == true
        @room = Room.new
        @entry = Entry.new
      end
    end



  end
  
    def search
    @user = User.find(params[:user_id])
    @books = @user.books 
    if params[:created_at] == ""
      @search_book = "日付を選択してください"#①
    else
      create_at = params[:created_at]
      @search_book = @books.where(['created_at LIKE ? ', "#{create_at}%"]).count#②
    end
  end

  def index
    @user = current_user
    @users = User.all
    @book = Book.new


  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(current_user.id)
    if @user.update(user_params)
      redirect_to user_path(@user), notice: "You have updated user successfully."
    else
      render :edit
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
