class DBConfiguration
  DB_CONFIG = YAML.load_file(File.expand_path('../database.yml', __FILE__))[ENV['RACK_ENV']]
end