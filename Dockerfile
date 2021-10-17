FROM hexpm/elixir:1.12.0-erlang-24.1.2-debian-buster-20210902-slim

RUN apt update && \
    apt install -y git curl unzip

WORKDIR /root

RUN curl -LO https://github.com/neovim/neovim/releases/download/v0.5.1/nvim-linux64.tar.gz && \
    curl -LO https://github.com/elixir-lsp/elixir-ls/releases/download/v0.8.1/elixir-ls-1.12.zip

RUN tar xzf nvim-linux64.tar.gz && \
    echo "PATH=/root/nvim-linux64/bin:$PATH" >> /root/.bashrc

RUN unzip elixir-ls-1.12.zip -d elixir-ls

RUN git clone https://github.com/phoenixframework/phoenix.git && \
    cd phoenix && \
    mix local.hex --force && \
    mix local.rebar --force && \
    mix deps.get

COPY config /root/.config/nvim
RUN INSTALL=1 /root/nvim-linux64/bin/nvim --headless +'autocmd User PackerComplete sleep 100m | qall' +PackerSync

WORKDIR /root/phoenix
