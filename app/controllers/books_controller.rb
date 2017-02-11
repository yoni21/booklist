class BooksController < ApplicationController
  def index
   @books = Book.all

   respond_to do |format|
     format.html  #http://localhost:3000/books.html
     format.text
     format.csv do
       formated_csv = Book.generate_csv(@books)
       render plain: formated_csv
     end
     format.json do
       render json: @books.map { |book|
         { title: book.title,
           author: book.author,
           already_read: book.already_read
         }
       }
     end

   end

 end


end
