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

If you use Confex, you can add the options to your configuration:

```elixir
config :yourapp,
  easy_auth: [
    username: {:system, "CAKES_USERNAME", "admin"},
    password: {:system, "CAKES_PASSWORD", "admin"},
    realm: "Authentication"
  ]
```

And your router, you would write:

```elixir
plug EasyAuth, Confex.get_env(:yourapp, :easy_auth)
```
