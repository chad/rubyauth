# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_rubyauth_session',
  :secret      => '8f1516600f574c0aafdc01d2a37aa4555bdff62e9772d7f242aa5e542b778c11bd0b64935062751358aa63f8cc2f192b4d112237e65e239391330f2ee53b6703'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
