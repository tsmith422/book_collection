# frozen_string_literal: true

class Book < ApplicationRecord
  validates :title, presence: true
  validates :author, presence: true
  validates :price, numericality: true
  validate :published_date_is_valid_date
  validate :published_date_cannot_be_in_the_future

  private

  def published_date_is_valid_date
    return if published_date.is_a?(Date)

    errors.add(:published_date, 'is not a valid date')
  end

  def published_date_cannot_be_in_the_future
    return unless published_date.present? && published_date > Date.today

    errors.add(:published_date, "can't be in the future")
  end
end
