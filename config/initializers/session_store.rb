# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_spotify_session',
  :secret      => '7da265f6ab0afa2f852a79058cd9210c1065178033b767b72c5dec02a2b623353c0ec409dfde971b74780db82e801488de2408fc0f2d155479c8b3fa5f8c7923'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
