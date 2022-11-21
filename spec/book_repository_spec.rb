require 'book_repository'

def reset_students_table
  seed_sql = File.read('spec/seeds_books.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'book_store_test' })
  connection.exec(seed_sql)
end

describe BookRepository do
  before(:each) do 
    reset_students_table
  end

  it 'returns 5 books when 5 books in the repo' do 
    repo = BookRepository.new

    books = repo.all

    expect(books.length).to eq(2)

    expect(books[0].id).to eq('1') 
    expect(books[0].title).to eq('BookTitle1')
    expect(books[0].author_name).to eq('Author1')
  end
end