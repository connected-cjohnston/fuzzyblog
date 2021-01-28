server '3.136.8.28', user: 'deploy', roles: %w[web app db]
set :rails_env, 'production'
