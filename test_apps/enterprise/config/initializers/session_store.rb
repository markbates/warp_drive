# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_enterprise_session',
  :secret      => '6f1cc47be14e8fab461ebe2c0c44454c2dfb47f3561e9c2bda551131c4cff1b6b6dbe9b09341887e6d8db671d95560ddb0fef7dcb6edb1093597345d23eddbef'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
