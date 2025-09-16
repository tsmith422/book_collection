json.extract! user_book, :id, :user_id, :book_id, :created_at, :updated_at
json.url user_book_url(user_book, format: :json)
