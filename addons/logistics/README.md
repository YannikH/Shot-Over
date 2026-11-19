# Logistics

`shot_over_logistics`: shells, crates, pallets and cargo containers. User docs: [docs/ammunition.md](../../docs/ammunition.md).

## How it works

- **Shells** (`shto_vn_m101_shell_<type>`) are ACE tracks with the SOG shell model, carried with ACE's own carry action. Their charge is the public variable `shto_charge`; `m101_fnc_getMagazineFromShell` turns shell and charge into a magazine. On `ace_dragging_startedCarry` the carrier gets a hint how to load.
- **Crates** (`shto_vn_m101_<type>_crate`) hold two shells. Unpacking (`fnc_unpackCrate`, server) hides the crate, attaches its open variant (`openVariant`) and two shells (`shellType`), and sets the public `shto_crateIsOpen`.
- **Pallets** (`shto_vn_m101_<type>_pallet_x42/x24/x18`) are stacked on the server by their CBA init event handler (`fnc_initPallet`, `Extended_Init_EventHandlers` in `CfgEventHandlers.hpp`; a plain `class EventHandlers` would replace the one the SOG parents inherit and break CBA's XEH for these classes): attached simple objects (`shto_crateList`, public) and their number (`shto_cratesleft`), and the ACE cargo size. It only runs on the server, so a joining client does not touch the crates.
- **Containers** (`shto_vn_m101_<type>_container_x504`) keep their stock only as `shto_cratesleft` (`fnc_initContainer`, server), no objects.
- Taking a crate or a pallet is a server event (`fnc_takeCrate`, `fnc_takePallet`), so the stock has one owner; the new crate or pallet is put on the ground next to the player. Only public ACE functions are used: ACE's `startCarry` is internal, so taken crates are not carried straight away.

## Dependencies

- S.O.G. Prairie Fire (`loadorder_f_vietnam`), ACE3 (`ace_cargo`, `ace_dragging`, `ace_repair` for `ACE_Track`, `ace_interact_menu`)

## CBA events

Internal events this addon handles (raised with `CBA_fnc_*Event`):

| Event | Runs on | Handler |
| --- | --- | --- |
| `shot_over_logistics_takeCrate` | Server | `fnc_takeCrate` |
| `shot_over_logistics_takePallet` | Server | `fnc_takePallet` |
| `shot_over_logistics_unpackCrate` | Server | `fnc_unpackCrate` |

Listens to ACE's `ace_dragging_startedCarry` for the load hint.

## Functions

| Function | Public | What it does |
| --- | --- | --- |
| `fnc_initContainer` |  | Init handler of containers: sets their stock on the server. |
| `fnc_initPallet` |  | Init handler of pallets: stacks their crates on the server. |
| `fnc_mouseButton` |  | Right click while carrying a shell: loads it (`m101_fnc_loadShell`). |
| `fnc_takeCrate` |  | Server: one crate from a pallet or container. |
| `fnc_takePallet` |  | Server: a pallet out of a container. |
| `fnc_unpackCrate` |  | Server: opens a crate and puts its two shells in it. |
