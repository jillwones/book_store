# file: app.rb

require_relative 'lib/database_connection'
require_relative 'lib/book_repository'

# We need to give the database name to the method `connect`.
DatabaseConnection.connect('book_store')

books = BookRepository.new 

books.all.each do |book|
  puts "#{book.id} - #{book.title} - #{book.author_name}"
end