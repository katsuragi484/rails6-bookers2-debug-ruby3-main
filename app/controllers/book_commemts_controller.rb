class BookCommemtsController < ApplicationController

def create
  book = Book.find(params[:book_id])
  comment = current_user.books.new(book_comment_params)
  comment.book_id = book.id
  comment.save
　 redirect_to request.referer
end

def destroy
  Book.find(params[::id]).destroy
  redirect_to request.referer
end

private

def book_comment_params
  params.require(:book).permit(:comment)
end

end
