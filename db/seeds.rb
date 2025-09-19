# Create books
gatsby = Book.create!(title: "The Great Gatsby", author: "F. Scott Fitzgerald", price: "10.99", published_date: "2000-07-08")
mockingbird = Book.create!(title: "To Kill a Mockingbird", author: "Harper Lee", price: "12.99", published_date: "1960-01-01")
book1984 = Book.create!(title: "1984", author: "George Orwell", price: "14.99", published_date: "1949-01-01")
pride = Book.create!(title: "Pride and Prejudice", author: "Jane Austen", price: "9.99", published_date: "1813-01-01")
catcher = Book.create!(title: "The Catcher in the Rye", author: "J.D. Salinger", price: "11.99", published_date: "1951-01-01")

# Create users
alice = User.create!(username: "alice")
bob = User.create!(username: "bob")

# Create user-book relationships safely
UserBook.create!(user: bob, book: mockingbird)  # references the objects directly
