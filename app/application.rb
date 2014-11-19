ActiveRecord::Base.establish_connection(
  adapter: DBConfiguration.adapter,
  host: DBConfiguration.host,
  database: DBConfiguration.database,
  username: DBConfiguration.username,
  password: DBConfiguration.password,
  encoding: DBConfiguration.encoding
)