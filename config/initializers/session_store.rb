# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_bodyblog_session',
  :secret      => '96352b7061fa7e2ee0f934b08afa894a77e430dc4ddd6f7bebe8e4efc27eb7ceada5159b65361d12d3fe5d3e58c3e8c42f5eef30bdbc3af52c40419e8f7dcfb7'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
