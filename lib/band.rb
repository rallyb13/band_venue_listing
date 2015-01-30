class Band < ActiveRecord::Base
  has_and_belongs_to_many(:venues)
  validates(:name, :presence => true)

  before_save(:cap_band)

  private
    define_method(:cap_band) do
      if self.name.include?(" ")
        word_by_word = self.name.split
        first_word = word_by_word.shift.capitalize!
        self.name=(word_by_word.unshift(first_word).join(" "))
      else
        self.name=(self.name().capitalize())
      end
    end
end
