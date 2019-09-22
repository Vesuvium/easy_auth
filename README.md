# Easy auth

A Plug that provides basic http authentication and it's easy to configure.

## Installation

```elixir
{:easy_auth, "~> 1.0.0"}
```

## Usage

Simply plug it in your router or pipeline:

```elixir
plug EasyAuth, [username: "admin", password: "admin", realm: "Authentication"]
```

You can also set the options in your configuration:

```elixir
config :yourapp,
  easy_auth: [
    username: "admin",
    password: "pizza",
    realm: "Authentication"
  ]
```

And your router, you would write:

```elixir
plug EasyAuth, Application.get_env(:yourapp, :easy_auth)
```

If you use confex, you can do:

```elixir
config :yourapp,
  easy_auth: [
    username: {:system, "APP_USERNAME", "admin"},
    password: {:system, "APP_PASSWORD", "admin"},
    realm: "Authentication"
  ]
```

and:

```elixir
plug EasyAuth, Confex.get_env(:yourapp, :easy_auth)
```

However, since Plugs are compiled Confex will use the values available at
compile-time.
