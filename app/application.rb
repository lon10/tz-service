ActiveRecord::Base.establish_connection(
  adapter: Configuration.adapter,
  host: Configuration.host,
  database: Configuration.database,
  username: Configuration.username,
  password: Configuration.password,
  encoding: Configuration.encoding
)