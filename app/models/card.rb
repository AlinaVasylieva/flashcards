class Card < ApplicationRecord
  validates :original_text, :translated_text, :presence => true
  before_validation :ensure_original_text_has_a_value
  validate :original_text_and_translated_text_validation
  validates_uniqueness_of :original_text, :case_sensitive => false
  before_create :set_review_date
    def set_review_date
      self.review_date = Date.today + 3.days
    end
 
  protected
    def ensure_original_text_has_a_value
      if original_text.nil?
        self.original_text = translated_text unless translated_text.blank?
      end
    end
  
    def original_text_and_translated_text_validation
        if self.original_text == self.translated_text
            errors.add( :base, "Original text must be different from Translated text") 
        end
    end  

scope :random_card, ->{ where('review_date <=?', Date.today).order('RANDOM()').limit(1) }  
end
