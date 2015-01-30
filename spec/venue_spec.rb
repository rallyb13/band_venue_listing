require('spec_buddy')

describe(Venue) do
  it {should have_and_belong_to_many(:bands)}
  it {should validate_presence_of(:place)}

  it('will ensure that every venue is capitalized') do
    test_venue = Venue.create({:place => "more cowbell"})
    expect(test_venue.place()).to(eq("More cowbell"))
  end
  # it('will ensure that only the first word gets changed') do
  #   test_venue = Venue.create({:place => "your last Standard"})
  #   expect(test_venue.place()).to(eq("Your last Standard"))
  # end
end
