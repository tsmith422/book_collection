require 'rails_helper'

RSpec.describe 'Creating a book', type: :feature do 
  scenario 'valid inputs' do
    visit new_book_path
    fill_in "book[title]", with: 'harry potter'
    fill_in "book[author]", with: 'J.K. Rowling'
    fill_in "book[price]", with: '19.99'
    select '2000', from: 'book_published_date_1i'
    select 'July', from: 'book_published_date_2i'
    select '8', from: 'book_published_date_3i'
    click_on 'Create Book'
    visit books_path
    expect(page).to have_content('harry potter')
    expect(page).to have_content('J.K. Rowling')
    expect(page).to have_content('19.99')
    expect(page).to have_content('2000-07-08')
  end

  scenario 'missing title (rainy day)' do
    visit new_book_path
    fill_in "book[author]", with: 'J.K. Rowling'
    fill_in "book[price]", with: '19.99'
    select '2000', from: 'book_published_date_1i'
    select 'July', from: 'book_published_date_2i'
    select '8', from: 'book_published_date_3i'
    click_on 'Create Book'
    expect(page).to have_content("Title can't be blank")
  end

  scenario 'missing author' do
    visit new_book_path
    fill_in "book[title]", with: 'harry potter'
    fill_in "book[price]", with: '19.99'
    select '2000', from: 'book_published_date_1i'
    select 'July', from: 'book_published_date_2i'
    select '8', from: 'book_published_date_3i'
    click_on 'Create Book'
    expect(page).to have_content("Author can't be blank")
  end

  scenario 'invalid price' do
    visit new_book_path
    fill_in "book[title]", with: 'harry potter'
    fill_in "book[author]", with: 'J.K. Rowling'
    fill_in "book[price]", with: 'not_a_number'
    select '2000', from: 'book_published_date_1i'
    select 'July', from: 'book_published_date_2i'
    select '8', from: 'book_published_date_3i'
    click_on 'Create Book'
    expect(page).to have_content("Price is not a number")
  end

  scenario 'published_date in the future (boundary case)' do
    visit new_book_path
    fill_in "book[title]", with: 'Future Book'
    fill_in "book[author]", with: 'Time Traveler'
    fill_in "book[price]", with: '29.99'
    select '2026', from: 'book_published_date_1i'
    select 'January', from: 'book_published_date_2i'
    select '1', from: 'book_published_date_3i'
    click_on 'Create Book'
    expect(page).to have_content("Published date can't be in the future")
  end
end