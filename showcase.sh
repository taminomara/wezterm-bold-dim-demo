#!/usr/bin/env bash
set -euo pipefail

HERE=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
CONFIGS="$HERE/configs"
MATRIX="$HERE/palette-matrix.sh"

if [[ -z ${WEZTERM:-} ]]; then
  printf 'No wezterm found. Point WEZTERM at a binary.\n'
  exit 1
fi

list() {
  printf 'Usage:\n'
  printf '  ./showcase.sh 00 01     # compare two side by side\n'
  printf '  ./showcase.sh all       # every config at once\n'
  printf 'Configs:\n'
  local f
  for f in "$CONFIGS"/*.lua; do
    printf '  %-4s %s\n' "$(basename "$f" .lua | cut -d- -f1)" \
      "$(sed -n '1s/^-- [0-9]* — //p' "$f")"
  done
}

spawn() {
  local n=$1 matches cfg cmd
  matches=("$CONFIGS"/"$n"-*.lua)
  if [[ ! -e ${matches[0]} ]]; then
    printf 'no such config: %s\n' "$n" >&2
    printf 'run ./showcase.sh with no arguments to see the list\n' >&2
    return 1
  fi
  cfg=${matches[0]}
  printf 'spawning %s\n' "$(basename "$cfg")"
  cmd=$(printf '%q --config %q; exec bash --noprofile --norc' \
    "$MATRIX" "$cfg")
  "$WEZTERM" --config-file "$cfg" start -- bash --noprofile --norc -c "$cmd" &
}

case "${1:-}" in
  ''|'-h'|'--help')
    list
    ;;
  all)
    for f in "$CONFIGS"/*.lua; do spawn "$(basename "$f" .lua | cut -d- -f1)"; sleep 0.4; done
    printf '\nclose the windows to end this script\n'
    wait
    ;;
  *)
    for n in "$@"; do spawn "$n"; sleep 0.4; done
    printf '\nclose the windows to end this script\n'
    wait
    ;;
esac
