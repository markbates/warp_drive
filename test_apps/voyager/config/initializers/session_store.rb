# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_voyager_session',
  :secret      => '42c11e875d835169057c141c849bdd90657685589727b3b3f9c25a7306f4ca42903daac07ddcd45d08d4bc0aeb8d63872596fec14fca4b37c3de2cefd312896e'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
