# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_hali-ilmo2.0_session',
  :secret      => 'c304fe74ecea3570f9281e10020741c2f17333b8343ffe2dd351ecde2f36bb35047b4acaaefa175133d18c9ef47a4c6cfe57ba28cbb375bed8daaa229ecb5e8f'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
