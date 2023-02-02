class SearchesController < ApplicationController

def search
  kind = params[:kind]
  match_type = params[:match_type]
  keyword = params[:keyword]
  if kind == 'book'
    case match_type
    when 'perfect_match' then
      @books = Book.where(title: keyword)
    when 'forward_match' then
      @books = Book.where("title LIKE ?", "%#{keyword}")
    when 'backword_match' then
      @books = Book.where("title LIKE ?", "#{keyword}%")
    when 'partial_match' then
      @books = Book.where("title LIKE ?", "%#{keyword}%")
    end

  else kind == 'user'

  end
end

end
