import Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :gobarber, Gobarber.Repo,
  username: "postgres",
  password: "postgres",
  hostname: "localhost",
  database: "gobarber_test#{System.get_env("MIX_TEST_PARTITION")}",
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: 10

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :gobarber, GobarberWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "3dBz83Fa/XuyCaL3oHDvIIzn1zw3RXhWChqOYms6ex0BsNLIfazpTCr93RU1afM3",
  server: false

# In test we don't send emails.
config :gobarber, Gobarber.Mailer, adapter: Swoosh.Adapters.Test

# Print only warnings and errors during test
config :logger, level: :warn

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
