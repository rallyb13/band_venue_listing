require('spec_buddy')

describe(Band) do
  it {should have_and_belong_to_many(:venues)}
  it {should validate_presence_of(:name)}
  it('ensures that the band name comes in capitalized') do
    test_band = Band.create({:name => "mucus forming chemical bath"})
    expect(test_band.name()).to(eq("Mucus forming chemical bath"))
  end
  it('ensures that the band name comes in capitalized, but only the first word is changed') do
    test_band = Band.create({:name => "hidden Input"})
    expect(test_band.name()).to(eq("Hidden Input"))
  end

end
