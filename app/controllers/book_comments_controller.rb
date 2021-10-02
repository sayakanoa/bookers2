class BookCommentsController < ApplicationController

 def create
   book = Book.find(params[:book_id])
   @comment = current_user.book_comments.new(book_comment_params)
   @comment.book_id = book.id
   if @comment.save
   redirect_to book_path(book.id)
   else
   @book = Book.find(params[:book_id])
   #@comment = BookComment.new
   @new = Book.new
   @user = User.find(@book.user_id)
   render template: 'books/show'
   end
 end

 def destroy
  comment = BookComment.find(params[:id])
  comment.destroy
  #BookComment.find_by(id: params[:id]).destroy
  redirect_to books_path
 end

 private

  def book_comment_params
    params.require(:book_comment).permit(:comment)
  end



end
