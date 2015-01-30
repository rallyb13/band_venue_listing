require("bundler/setup")
Bundler.require(:default)

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file}

get('/') do
  @bands = Band.all()
  erb(:index)
end

post('/bands') do
  name = params.fetch("name")
  band = Band.create({:name => name})
  redirect back
end

get('/band/:id') do
  @band = Band.find(params.fetch("id"))
  @venues = Venue.all()
  erb(:band)
end

post('/venues') do
  place = params.fetch("place")
  venue = Venue.create({:place => place})
  redirect back
end

post('/add_venues') do
  @band = Band.find(params.fetch("band_id"))
  venue_ids = params.fetch("venue_ids")
  venue_ids.each() do |venue_id|
    venue = Venue.find(venue_id)
    @band.venues() << venue
  end
  redirect back
end

patch('/band_update') do
  id = params.fetch("band_id")
  new_name = params.fetch("new_name")
  @band = Band.find(id)
  @band.update({:name => new_name})
  redirect back
end

delete('/band_kill') do
  @band = Band.find(params.fetch("band_id"))
  @band.destroy()
  redirect('/')
end
