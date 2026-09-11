#!/usr/bin/env bash
set -u

CONFIG=
ARGS=()
while (($#)); do
  case $1 in
    --config)
      CONFIG=${2:-}
      if (($# >= 2)); then shift 2; else shift; fi
      ;;
    *) ARGS+=("$1"); shift ;;
  esac
done

LABELS=(KK RR GG YY BB MM CC WW BK BR BG BY BU BM BC BW)

STATES=(
  "plain|"
  "bold|\033[1m"
  "dim|\033[2m"
  "dim, blinking|\033[2m\033[5m"
  "bold, then dim|\033[1m\033[2m"
  "dim, then bold|\033[2m\033[1m"
)

rule() { printf '\033[0m\n%s\n' "$1"; printf '%.0s─' $(seq 1 70); printf '\n'; }

header() {
  printf '\033[0m%-22s' ''
  for n in $(seq 0 15); do printf '%3s' "${LABELS[$n]}"; done
  printf '\n'
}

row() {
  local label=$1 sgr=$2 cell=$3 n
  printf '\033[0m%-22s' "$label"
  for n in $(seq 0 15); do
    printf '\033[0m'
    printf '%b' "$sgr"
    printf "$cell" "$n" "${LABELS[$n]}"
  done
  printf '\033[0m\n'
}

block() {
  local title=$1 cell=$2 entry
  rule "$title"
  header
  for entry in "${STATES[@]}"; do
    row "  ${entry%%|*}" "${entry#*|}" "$cell"
  done
}

printf '\033[0m\n'
if [[ -n $CONFIG && -r $CONFIG ]]; then
  printf '\033[1m%s\033[0m\n' "$(sed -n '1s/^-- //p' "$CONFIG")"
else
  printf '\033[1mBold and dim across the palette\033[0m\n'
fi

block 'Colour as foreground' ' \033[38;5;%dm%s'

printf '\033[0m\n'
printf 'What to look for\n'
printf '%.0s─' $(seq 1 70); printf '\n'

LOOKED=
if [[ -n $CONFIG && -r $CONFIG ]]; then
  while IFS= read -r line; do
    printf '  %s\n' "$line"
    LOOKED=yes
  done < <(sed -n 's/^-- LOOK: //p' "$CONFIG")
fi

if [[ -z $LOOKED ]]; then
  printf '  The two "then" rows differ    tracking is unified: the second code won\n'
  printf '  The two "then" rows match     tracking is separate: both codes are kept\n'
  printf '  Dim rows are fainter          dim_opacity is below 1.0\n'
  printf '  Blinking row peaks at "dim"   the blink moves colour, the fade moves alpha\n'
  printf '  Letters change shape          a font rule picked a different face\n'
  printf '  KK..WW brighten on bold       bold_brightens_ansi_colors is on\n'
  printf '  Background rows never fade    the fade applies to letters, not cells\n'
fi
printf '\n'
