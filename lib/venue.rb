class Venue < ActiveRecord::Base
  has_and_belongs_to_many(:bands)
  validates(:place, :presence => true)

  before_save(:cap_venue)

  private
    define_method(:cap_venue) do
      self.place=(self.place().capitalize())
    end
end
