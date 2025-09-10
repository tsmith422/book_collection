class Book < ApplicationRecord
    validates :title, presence: true
    validates :author, presence: true
    validates :price, numericality: true
    validate :published_date_is_valid_date
    validate :published_date_cannot_be_in_the_future


    private

    def published_date_is_valid_date
        unless published_date.is_a?(Date)
            errors.add(:published_date, 'is not a valid date')
        end
    end

    def published_date_cannot_be_in_the_future
      if published_date.present? && published_date > Date.today
          errors.add(:published_date, "can't be in the future")
      end
    end
end
