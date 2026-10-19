#!/bin/sh
here="$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)"
sys="$(uname -s)"
case "$sys" in
MINGW* | MSYS* | CYGWIN*) rel="x86_64-pc-windows-msvc/gchat.exe" ;;
Darwin*)
    case "$(uname -m)" in
    arm64) rel="aarch64-apple-darwin/gchat" ;;
    *) rel="x86_64-apple-darwin/gchat" ;;
    esac ;;
*)
    case "$(uname -m)" in
    aarch64 | arm64) rel="aarch64-unknown-linux-musl/gchat" ;;
    *) rel="x86_64-unknown-linux-musl/gchat" ;;
    esac ;;
esac
if [ -x "$here/$rel" ]; then exec "$here/$rel" "$@"; fi
for cand in "$here/target/release/gchat.exe" "$here/target/release/gchat" "$here/target/debug/gchat.exe" "$here/target/debug/gchat"; do
    if [ -x "$cand" ]; then exec "$cand" "$@"; fi
done
echo "gchat binary not found in $here" >&2
exit 1
