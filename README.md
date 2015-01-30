Bands On The Run, a band_venue listing:

This is a Ruby application that relies on ActiveRecord (via Postgres) & Sinatra.
It's all set up to make its own ActiveRecord tables with migrations included, and the gems needed are set up so that you can simply use the bundler gem to get all the other gems installed. Just run "bundle". Sinatra will load the website to: localhost:4567/

Enter the bands. On each band's page you can enter new venues, and see the list of all available venues. Thus, you can add all the venues that band's played (or maybe always returns to, or will play...)

Benjamin Herson is the sole creator. MIT license

Enjoy!

2 known bugs, one simple, one weird:
The simple one is that you can add the same venue twice.
Weird one...has disappeared. Let me know if you see it again.
When I went to town on the cap_band callback method, I got what I wanted. It would recognize if there were multiple words in the band name, and it left those alone. So "battlefield Squirrel" would become "Battlefield Squirrel" rather than being "fixed" as "Battlefield squirrel". I was pretty happy about that. Unfortunately, the method messed with the ActiveRecord-built update method. I used shift/unshift in dealing with the word to capitalize, and the updated bands were coming in without the unshift--the first word was getting chopped off ("Squirrel"). I went to work on some CSS while thinking about how that could be and what I should do. At one point I reloaded Sinatra. And when I came back...my update method worked fine. Which is...interesting. I hadn't saved midway through my method-making, and adding the band worked right from the start. So I don't know why a reload would fix that and am still a little suspicious.
