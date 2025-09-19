require 'rails_helper'

RSpec.describe Book, type: :model do
  subject do
    described_class.new(
      title: 'harry potter',
      author: 'J.K. Rowling',
      price: 19.99,
      published_date: Date.new(2000, 7, 8)
    )
  end

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without a title' do
    subject.title = nil
    expect(subject).not_to be_valid
    expect(subject.errors[:title]).to include("can't be blank")
  end

  it 'is not valid without an author' do
    subject.author = nil
    expect(subject).not_to be_valid
    expect(subject.errors[:author]).to include("can't be blank")
  end

  it 'is not valid with non-numeric price' do
    subject.price = 'abc'
    expect(subject).not_to be_valid
    expect(subject.errors[:price]).to include("is not a number")
  end

  it 'is not valid with a bad published_date' do
    subject.published_date = 'not_a_date'
    expect(subject).not_to be_valid
    expect(subject.errors[:published_date]).to include("is not a valid date")
  end
end