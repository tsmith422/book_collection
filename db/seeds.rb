# Create books
gatsby = Book.create!(title: "The Great Gatsby", author: "F. Scott Fitzgerald", price: "10.99", published_date: Date.new(2000, 7, 8))
mockingbird = Book.create!(title: "To Kill a Mockingbird", author: "Harper Lee", price: "12.99", published_date: Date.new(1960, 1, 1))
book1984 = Book.create!(title: "1984", author: "George Orwell", price: "14.99", published_date: Date.new(1949, 1, 1))
pride = Book.create!(title: "Pride and Prejudice", author: "Jane Austen", price: "9.99", published_date: Date.new(1813, 1, 1))
catcher = Book.create!(title: "The Catcher in the Rye", author: "J.D. Salinger", price: "11.99", published_date: Date.new(1951, 1, 1))

# Create users
alice = User.create!(username: "alice")
bob = User.create!(username: "bob")

# Create user-book relationships safely
# UserBook.create!(user: bob, book: mockingbird)  # references the objects directly
