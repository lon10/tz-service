namespace :db do
  desc 'migrate your database'
  task :migrate do
    ActiveRecord::Migrator.migrate(
      ActiveRecord::Migrator.migrations_paths,
      ENV['VERSION'] ? ENV['VERSION'].to_i : nil
    )
  end
end