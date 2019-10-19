# ApiPlugCowboy

ApiPlugCowboy is an Simple API (CRUD Book) using Plug and Cowboy based on Elixir.

Main Tutorial : [this link](https://dev.to/jonlunsford/elixir-building-a-small-json-endpoint-with-plug-cowboy-and-poison-1826)

## Dependencies

- Elixir 1.7.3
- Erlang (OTP) 21
- MySQL

## Initial Setup

```bash
# get dependencies
mix deps.get

# create & migrate DB, see DB config here: config/confix.exs
mix ecto.create
mix ecto.migrate
```

## Running Aplication

```bash
mix run --no-halt
```
Endpoint URL : `localhost:4444`

Port Used in this ENV project : `MIX_ENV=env`
- dev : `4444`
- test : `4445`
- prod : `4446`

## Running Test Locally

```bash
# run test
mix test --no-start
```