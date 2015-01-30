class Band < ActiveRecord::Base
  has_and_belongs_to_many(:venues)
  validates(:name, :presence => true)

  before_save(:cap_band)

  private
    define_method(:cap_band) do
      self.name=(self.name().capitalize())
    end
end
