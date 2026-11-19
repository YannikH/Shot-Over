# M101

`shot_over_m101`: the hand-loaded M101 howitzer. User docs: [docs/gun.md](../../docs/gun.md).

## How it works

- The gun (`shto_vn_static_m101_02_base`, `shto_vn_static_m101_01`) inherits S.O.G. Prairie Fire's M101 with its own weapon (`shto_howitzer_105mm_base`), one-round magazines per shell type and charge (`shto_105mm_mag_<type>_x1_c<1-5>`) and no artillery computer (`artilleryScanner = 0`).
- The breech is the SOG model's animation source `m101_reload_source`. Its phases (`script_component.hpp`): 0 closed, 0.3 loaded, 0.7 open and empty, 0.9 just fired. The ACE actions move it from any machine, as `animateSource` is global; their positions follow the barrel (`fnc_posAlongRecoilAxis`) or the carriage (`fnc_posAlongDirection`).
- **Loading** runs on two machines: the carrier (`fnc_loadShell`, called by the "Load Shell" breech action or by `logistics_fnc_mouseButton` on a right click; ACE's carry mouse hint can't show the right click, so the action makes loading discoverable) checks the breech and the distance and deletes the shell; ACE ends the carry by itself once the carried object is gone. The gun's owner (`fnc_onLoadShell`, event `shot_over_m101_loadShell`) checks again and loads, or puts the shell back at the breech if another crew member was faster.
- **Firing**: the weapon's `fired` event handler (`fnc_fired`) does its work where the gun is local (the gunner's machine): muzzle velocity spread, recoil animation, knock-down of units behind the breech (event `knockDown` to each unit, `fnc_knockDown`) and emptying the gun (`setVehicleAmmo`/`removeMagazine` only work where the gun is local). "Fire Howitzer" sends `fire` to the gun's owner (`fnc_onFire`), which needs a gunner.
- **Casings**: "Open Breech" sends `ejectCasing` to the server (`fnc_ejectCasing`), which throws the casing out and deletes it after `CASING_LIFETIME`.

## Dependencies

- S.O.G. Prairie Fire (`loadorder_f_vietnam`), ACE3 (`ace_interact_menu`; the carry belongs to ACE dragging)

## CBA events

Internal events this addon handles (raised with `CBA_fnc_*Event`):

| Event | Runs on | Handler |
| --- | --- | --- |
| `shot_over_m101_loadShell` | Gun's owner | `fnc_onLoadShell` |
| `shot_over_m101_fire` | Gun's owner | `fnc_onFire` |
| `shot_over_m101_knockDown` | Unit's owner | `fnc_knockDown` |
| `shot_over_m101_ejectCasing` | Server | `fnc_ejectCasing` |

## Functions

| Function | Public | What it does |
| --- | --- | --- |
| `fnc_ejectCasing` |  | Server: throws the empty casing out of the breech and deletes it later. |
| `fnc_fired` |  | Fired handler of the weapon: velocity spread, recoil, knock-down, empties the gun, where the gun is local. |
| `fnc_getMagazineFromShell` |  | The one-round magazine a shell object loads as (its `magazineBase` and charge). |
| `fnc_knockDown` |  | Throws a unit behind the breech backwards, on its own machine. |
| `fnc_loadShell` |  | Carrier's side of loading: checks, deletes the shell, sends the load to the gun. |
| `fnc_onFire` |  | Gun owner's side of "Fire Howitzer": the gunner fires. |
| `fnc_onLoadShell` |  | Gun owner's side of loading: loads the magazine or puts the shell back. |
| `fnc_posAlongDirection` |  | Model position that turns with the traverse. |
| `fnc_posAlongRecoilAxis` |  | Model position that turns with traverse and elevation (the breech). |
