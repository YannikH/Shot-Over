# FCS

`shot_over_fcs`: the FDC notebook. User docs: [docs/notebook.md](../../docs/notebook.md).

## How it works

- The notebook (`shto_calculator`, `uiConfig/fcs.hpp`) is opened by whoever wears or stands at an FDC backpack (`shto_rto_pack`). When it closes, its minimized view (`RscTitles` `shto_calculator_minimized`, layer `MINIMIZED_LAYER`) shows the open fire mission.
- Pages are kept per player in `missionNamespace` (`shto_fcs_pages`, `shto_fcs_currentPage`): `fnc_initDialog` fills the notebook or its minimized view from a page, `fnc_saveView` saves the fields back before a page is turned or the notebook closes.
- `fnc_calculateFromNotebook` reads the fields (or the saved page when minimized) and lists the solutions of `fnc_getFiringSolutionsForMagazines`.
- **Firing solutions** are computed without air friction, in closed form: with `a = g·d²/(2v²)`, `tan(e) = (d ± sqrt(d² − 4a(a + h))) / (2a)` for distance `d`, height of the target above the gun `h` and muzzle velocity `v` (the magazine's `initSpeed`). Kept between -5° and 66°, the limits the original asked ACE for. The original used ACE's artillery table extension with air friction 0; that extension no longer exists in current ACE and both versions are internal. Drag is issue #15.
- CBA keybinds do not fire in dialogs, so the notebook's `onKeyUp` (`fnc_dialogKeyUp`) checks them itself.

## Dependencies

- ACE3 (`ace_common_fnc_getMapPosFromGrid`, `ace_interact_menu`), CBA keybinds; S.O.G. Prairie Fire fonts and textures in the UI

## Functions

| Function | Public | What it does |
| --- | --- | --- |
| `fnc_calculateFromNotebook` |  | Works out the open fire mission: direction, distance, place names, solutions. |
| `fnc_dialogKeyUp` |  | KeyUp handler: the notebook's keybinds close it. |
| `fnc_getFiringSolutionsForMagazines` |  | Charge, elevation (mils) and time of flight per charge and angle, without air friction. |
| `fnc_initDialog` |  | Fills the notebook or its minimized view with a page. |
| `fnc_openMinimized` |  | Shows the minimized notebook. |
| `fnc_saveView` |  | Saves the open page. |
