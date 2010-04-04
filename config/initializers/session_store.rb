# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_fg_session',
  :secret      => '2a09433fbf5635f1d719234a2cb9ef1f7e104213a41bb497dfba56832ad33f99a53b8a5267e4f4e1b0e74cd58b3856db9dc66d7308746b0136bcd4d117c720ac'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
