require 'rails_helper'

RSpec.describe "user_books/index", type: :view do
  before(:each) do
    assign(:user_books, [
      UserBook.create!(
        user_id: 2,
        book_id: 3
      ),
      UserBook.create!(
        user_id: 2,
        book_id: 3
      )
    ])
  end

  it "renders a list of user_books" do
    render
    cell_selector = 'div>p'
    assert_select cell_selector, text: Regexp.new(2.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(3.to_s), count: 2
  end
end
