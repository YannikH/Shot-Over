# Sight

`shot_over_sight`: the M101's sights for the gunner, the panoramic telescope and the quadrant. Ported from the original team's prototype in the test mission (`extras/Test Mission/shot_over.Cam_Lao_Nam/sight`, issue #8). User docs: [docs/gun.md](../../docs/gun.md#the-guns-sights).

## How it works

- **Opening**: the gunner's ACE self-action on the gun or the toggle keybind (`fnc_open`). The view is a scripted camera (`cameraEffect`) and an overlay (`RscTitles` `shot_over_sight_view`, layer of the same name). Everything runs on the gunner's machine; the gun does not have to be local.
- **Gunner hidden**: the camera sits next to the gunner's head, so `fnc_open` hides the player with `hideObject` (local only, the crew still sees the gunner) unless something else already hid them, and `fnc_close` shows them again. ACE's `hideUnit` is not used: it hides globally.
- **Per frame** while open (`fnc_update`, a CBA PFH removed by `fnc_close`): turns a held dial, places the camera and moves the tape and the bubble. It closes the sights once the player is no longer the gun's gunner, dies or the gun is gone.
- **Telescope**: the camera sits at `TELESCOPE_OFFSET` on the carriage (`m101_fnc_posAlongDirection`), so it turns with the traverse but not with the elevation, and stays level. It looks at the barrel's azimuth plus the deflection minus `DEFLECTION_FORWARD` (3200): as on the US panoramic telescope, 3200 looks along the barrel and 0/6400 straight back, so the stakes at 2800 stand to the left front. With the aiming point on the vertical line, raising the deflection traverses the gun left (the real rule "left add, right subtract").
- **Quadrant**: compares the set quadrant with the barrel's elevation against the horizon (`asin` of `weaponDirection`), the same elevation the notebook computes and ACE's EL readout shows. The bubble spans ±`BUBBLE_RANGE` mils; **LEVEL** shows within `BUBBLE_LEVEL`.
- **Dials**: the CBA keybinds turn them by 1 mil; held past `TURN_DELAY` they turn at `TURN_RATE`, then `TURN_RATE_FAST`, mil/s (`fnc_turnDial`). Keybinds instead of the prototype's clickable dials: the overlay is a title, not a dialog, so it can't take mouse input, and a dialog would stop the gunner from traversing.
- **Shared setting**: while the sights are open the dials are local (`shot_over_sight_currentDeflection`, `shot_over_sight_currentQuadrant`). On closing, `fnc_close` writes them to the gun as public variables `shot_over_sight_deflection` and `shot_over_sight_quadrant`, once per use and only if changed; a public variable also reaches players who join later.
- **Aiming stakes**: "Emplace Aiming Stakes" in the gun's ACE main actions (`fnc_emplaceStakes`) takes the barrel's azimuth, rounded to the mil, as the gun's azimuth of lay and works out two positions (`STAKE_DISTANCES`) along the telescope's line at `REFERRED_DEFLECTION` (2800, `main\script_macros.hpp`, shared with the notebook). The server creates the stakes (`fnc_onEmplaceStakes`) and keeps them, the azimuth of lay and the deflection dial at 2800 on the gun as public variables (`shot_over_sight_stakes`, `shot_over_sight_azimuthOfLay`, `shot_over_sight_deflection`). They go on "Recover Aiming Stakes" or when the gun is deleted (`fnc_removeStakes`, class event handler `Deleted`). The notebook computes the deflection with the same rule: `2800 + azimuth of lay − direction`.
- **Textures** (`data/`): converted from the prototype's PNGs. The tape's mark positions are measured on the texture (`TAPE_*` in `script_component.hpp`); a second tape one turn further fills the window around 0/6400.

## Dependencies

- `shot_over_m101` (the gun, `fnc_posAlongDirection`), ACE3 (`ace_interact_menu`), CBA keybinds; S.O.G. Prairie Fire fonts

## CBA events

Internal events this addon handles (raised with `CBA_fnc_serverEvent`):

| Event | Runs on | Handler |
| --- | --- | --- |
| `shot_over_sight_emplaceStakes` | Server | `fnc_onEmplaceStakes` |
| `shot_over_sight_recoverStakes` | Server | `fnc_removeStakes` |

## Functions

| Function | Public | What it does |
| --- | --- | --- |
| `fnc_close` |  | Closes the sights and leaves the dials' settings on the gun. |
| `fnc_emplaceStakes` |  | Crew member's side of emplacing the stakes: azimuth of lay and stake positions. |
| `fnc_onEmplaceStakes` |  | Server: creates the stakes, keeps them and the azimuth of lay on the gun. |
| `fnc_open` |  | Opens the sights for the gun's gunner. |
| `fnc_removeStakes` |  | Server: deletes the stakes and forgets the azimuth of lay. |
| `fnc_turnDial` |  | Turns the deflection or quadrant dial. |
| `fnc_update` |  | Per-frame handler: dials, camera, tape and bubble. |
