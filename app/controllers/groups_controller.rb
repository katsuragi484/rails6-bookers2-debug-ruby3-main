class GroupsController < ApplicationController
  def show
  end

  def index
    @user = current_user
    @book = Book.new
  end
end
