class BookCommentsController < ApplicationController

 def create
   @book = Book.find(params[:book_id])
   @comment = current_user.book_comments.new(book_comment_params)
   @comment.book_id = @book.id
   unless @comment.save
    #@book = Book.find(params[:book_id])
   render template: '/book_comments/_error'
   end
   #if @comment.save
   #redirect_to book_path(book.id)
   #else
   #@book = Book.find(params[:book_id])
   #@new = Book.new
   #@user = User.find(@book.user_id)
   #render template: 'books/show'
   #end
 end

 def destroy
  @book = Book.find(params[:book_id])
  comment = @book.book_comments.find(params[:id])
  comment.destroy
  #comment = BookComment.find(params[:id])
  #comment.destroy
  #book = Book.find(comment.book_id)
  #redirect_to book_path(book.id)
 end

 private

  def book_comment_params
    params.require(:book_comment).permit(:comment)
  end



end
