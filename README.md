# LSP Info Multiple buffnr Reported

## Install

- Clone repo
- Build and run

```sh
docker build -t nvim . && docker run -it nvim
```

## Repro

Run nvim and open an elixir file, run `:LspInfo`

```
nvim -O mix.exs lib/phoenix.ex
```

Observe buffnr:

```
*  Language client log: /root/.cache/nvim/lsp.log
   Detected filetype:   elixir

*  1 client(s) attached to this buffer:

*  Client: elixirls (id: 1, pid: 164, bufnr: [1, 1, 1, 2, 2, 2])
    filetypes:       elixir, eelixir
    autostart:       true
*   root directory:  /root/phoenix
    cmd:             /root/elixir-ls/language_server.sh

*  Configured servers list: elixirls
```
