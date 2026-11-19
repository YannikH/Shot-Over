# ACRE Compatibility

`shot_over_compat_acre`: the ACRE2 radio rack of the PRC-77 prop (`shto_vn_prop_prc77_01`, from `shot_over_m101`): a mounted `ACRE_PRC77` in an external `ACRE_VRC64` rack. User docs: [docs/mission-makers.md](../../docs/mission-makers.md#acre2).

Loaded only with ACRE2 (`skipWhenMissingDependencies = 1`, needs `acre_main` and `acre_sys_rack`). ACRE's own `compat_sog` gives SOG's PRC-77 prop no rack, so Shot, Over! adds it here.

Test with `hemtt launch default acre`.
