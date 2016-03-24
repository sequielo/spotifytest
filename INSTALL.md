# Step 2

mkdir spotifytest
rvm list rubies    # I already have installed some rubies in my system

echo "ruby-1.9.3-p194" > .ruby-version
echo "spotifytest" > .ruby-gemset
cd spotifytest

bundle init
# Added rails v2.3.12 to Gemfile 

bundle install
rails .

#script/server and see on browser the Rails page!


---
# Step 3

script/generate scaffold Dj name:string

rake db:create && rake db:migrate
rake db:seed

---
# Step 4

# Added rspotify gem to Gemfile
bundle install

rake spotify:artist search=<name> [save=y]  # search an artist name, dump its info and optional save to db
rake spotify:populate_djs   # retrieve all the Dj list

----
# Step 5

rake spotify:populate_first_tracks   # populate first track of first album from all DJs
