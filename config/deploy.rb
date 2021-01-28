# config valid for current version and patch releases of Capistrano
lock '~> 3.15.0'

set :application, 'fuzzyblog'
set :repo_url, ''
set :deploy_to, '/home/deploy/fuzzyblog'

set :linked_files, %w[config/database.yml config/master.key]
set :linked_dir, %w[log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system]

set :keep_releases, 3
set :keep_assets, 3

namespace :deploy do
  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      execute :touch, release_path.join('tmp/restart.txt')
    end
  end

  after :publishing, 'deploy:restart'
  after :finishing, 'deploy:cleanup'
end
