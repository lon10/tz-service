class DBConfiguration

  DB_CONFIG = YAML.load_file(File.expand_path('../database.yml', __FILE__))[ENV['RACK_ENV']]

  class << self
    def adapter
      DB_CONFIG['adapter']
    end

    def host
      DB_CONFIG['host']
    end

    def username
      DB_CONFIG['username']
    end

    def password
      DB_CONFIG['password']
    end

    def database
      DB_CONFIG['database']
    end

    def encoding
      DB_CONFIG['encoding']
    end
  end
end