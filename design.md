# Books Model and Repository Classes Design Recipe

_Copy this recipe template to design and implement Model and Repository classes for a database table._

## 1. Design and create the Table

Skipped this step as table already created.

## 2. Create Test SQL seeds

```sql
-- Write your SQL seed here. 

-- First, you'd need to truncate the table - this is so our table is emptied between each test run,
-- so we can start with a fresh state.
-- (RESTART IDENTITY resets the primary key)

TRUNCATE TABLE books RESTART IDENTITY; -- replace with your own table name.

-- Below this line there should only be `INSERT` statements.
-- Replace these statements with your own seed data.

INSERT INTO books (title, author_name) VALUES ('BookTitle1', 'Author1');
INSERT INTO books (title, author_name) VALUES ('BookTitle2', 'Author2');
```

## 3. Define the class names

```ruby
class Book

end

class BookRepository

end
```

## 4. Implement the Model class

```ruby
class Book
  attr_accessor :id, :title, :author_name
end
```

*You may choose to test-drive this class, but unless it contains any more logic than the example above, it is probably not needed.*

## 5. Define the Repository Class interface

```ruby
class BookRepository
  def all
    # Executes the SQL query:
    # SELECT id, title, author_name FROM books;
    # Returns an array of Book objects.
  end
end
```

## 6. Write Test Examples

```ruby
# 1
# Get all books

repo = BookRepository.new

books = repo.all

books.length # =>  5

books[0].id # =>  1
books[0].title # =>  'BookTitle1'
books[0].author_name # =>  'Author1'
```


## 7. Reload the SQL seeds before each test run

Running the SQL code present in the seed file will empty the table and re-insert the seed data.

This is so you get a fresh table contents every time you run the test suite.

```ruby
# EXAMPLE

# file: spec/student_repository_spec.rb

def reset_students_table
  seed_sql = File.read('spec/seeds.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'book_store_test' })
  connection.exec(seed_sql)
end

describe BookRepository do
  before(:each) do 
    reset_students_table
  end

  # (your tests will go here).
end
```

## 8. Test-drive and implement the Repository class behaviour

_After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour._