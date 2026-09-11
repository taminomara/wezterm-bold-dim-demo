# Demo: separate bold and dim tracking

Compile wezterm, then:

```sh
export WEZTERM=/path/to/wezterm
./showcase.sh -h
./showcase.sh 00 01    # compare two side by side
./showcase.sh all      # every config at once
```

| index | description |
|--|--|
| `00` | default config |
| `01` | `track_bold_and_dim_separately = true` |
| `02` | `dim_opacity` without separate tracking |
| `03` | translucent window, dim fade compositing |
| `04` | font rules written in the new vocabulary |
| `05` | a stale rule, to show the warning |
