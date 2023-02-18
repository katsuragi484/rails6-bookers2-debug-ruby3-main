class GroupsController < ApplicationController
  def show
  end

  def index
    @user = current_user
    @book = Book.new
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      # redirect_to
    else
      render "new"
    end
  end

end
