<div align="center">
  <img alt="gray-gchat" src="assets/icon.svg" width="120" height="120" />
  <h1>gray-gchat</h1>
  <p><strong>Google Chat space webhooks — the agent posts into a space.</strong></p>
  <p>
    <a href="https://gray.alignment.id">Website</a> ·
    <a href="https://github.com/vstaln/gray-gchat">Source</a> ·
    <a href="https://github.com/vstaln/gray">gray</a>
  </p>
  <p>
    <a href="LICENSE"><img alt="License: MIT" src="https://img.shields.io/badge/license-MIT-1c1c20?style=flat-square&labelColor=0a0a0b" /></a>
    <a href="https://www.rust-lang.org"><img alt="Built with Rust" src="https://img.shields.io/badge/built%20with-rust-1c1c20?style=flat-square&labelColor=0a0a0b&logo=rust&logoColor=d4a373" /></a>
    <img alt="gray plugin" src="https://img.shields.io/badge/gray-plugin-1c1c20?style=flat-square&labelColor=0a0a0b&color=7aa2f7" />
  </p>
</div>

<br/>
```bash
gray plugin install gchat
```

`gray-gchat` posts messages into a Google Chat space via the space's
incoming webhook URL.

## Setup

```sh
gchat setup --webhook 'https://chat.googleapis.com/v1/spaces/…/messages?key=…&token=…'
gchat status
```

Config: `~/.gray/gchat/config.json` (`{"webhook"}`) or env `GCHAT_WEBHOOK`.
Create the webhook in the space: Space menu → Apps & integrations →
Webhooks → Add.

## Tool

| Tool | What it does |
|---|---|
| `gchat_send` | Post text into the configured space. |

## Inbound?

Space webhooks are outbound-only. True inbound (the agent reading space
messages) needs a Google Workspace Chat app + Pub/Sub subscription —
that's a bigger integration this plugin deliberately doesn't pretend to
be. `gchat_send` answers clearly instead.

## Build from source

```sh
cargo build --release
gray plugin check ./target/release/gchat
```

## License

MIT
