class Venue < ActiveRecord::Base
  has_and_belongs_to_many(:bands)
  validates(:place, :presence => true)

  before_save(:cap_venue)

  private
    define_method(:cap_venue) do
      if self.place.include?(" ")
        word_by_word = self.place.split
        first_word = word_by_word.shift.capitalize!
        self.place=(word_by_word.unshift(first_word).join(" "))
      else
        self.place=(self.place().capitalize())
      end
    end
end
