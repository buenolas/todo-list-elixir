# Build Stage
FROM elixir:1.14 AS build

# Install build dependencies
RUN apt-get update -y && apt-get install -y build-essential git \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Install Hex + Rebar
RUN mix local.hex --force && \
    mix local.rebar --force

# Set environment variable
ENV MIX_ENV="prod"

# Install dependencies
COPY mix.exs mix.lock ./
RUN mix deps.get --only $MIX_ENV

# Compile the project
COPY config config/
COPY priv priv/
COPY lib lib/
COPY assets assets/
RUN mix deps.compile
RUN mix assets.deploy
RUN mix phx.digest
RUN mix compile

# Build release
RUN mix release

# Runtime Stage
FROM elixir:1.14

# Install CA certificates
RUN apt-get update -y && apt-get install -y ca-certificates \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

WORKDIR /app
RUN chown nobody:nogroup /app

# Set environment variable
ENV MIX_ENV="prod"

# Copy the release from the build stage
COPY --from=build --chown=nobody:nogroup /app/_build/prod/rel/todo_list ./

USER nobody

EXPOSE 4000

CMD ["./bin/todo_list", "start"]
