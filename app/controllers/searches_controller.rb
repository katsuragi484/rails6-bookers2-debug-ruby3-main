class SearchesController < ApplicationController
  before_action :authenticate_user!


def search
  @kind = params[:kind]
  match_type = params[:match_type]
  @keyword = params[:keyword]
  if @kind == 'book'
    case match_type
    when 'perfect_match' then
      @books = Book.where("title LIKE ?", "#{@keyword}")
    when 'forward_match' then
      @books = Book.where("title LIKE ?", "%#{@keyword}")
    when 'backword_match' then
      @books = Book.where("title LIKE ?", "#{@keyword}%")
    when 'partial_match' then
      @books = Book.where("title LIKE ?", "%#{@keyword}%")
    end

  elsif @kind == 'user'
    case match_type
    when 'perfect_match' then
      @users = User.where("name LIKE ?", "#{@keyword}")
    when 'forward_match' then
      @users = User.where("name LIKE ?", "%#{@keyword}")
    when 'backword_match' then
      @users = User.where("name LIKE ?", "#{@keyword}%")
    when 'partial_match' then
      @users = User.where("name LIKE ?", "%#{@keyword}%")
    end
  end
end


end
