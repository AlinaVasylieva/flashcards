class Card < ApplicationRecord
  validates :original_text, presence: true,
                    length: { minimum: 5 }
end
