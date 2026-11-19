# Mission Makers

## Placing it

In **Eden**:

- The gun: under its S.O.G. Prairie Fire faction, subcategory **Shot, Over!**.
- Shells and crates: **Props → Shot, Over! → Ammunition**.
- Pallets, cargo containers and the PRC-77 radio: **Props → Shot, Over! → Supplies**.

Everything is also in **Zeus**. Pallets and containers are filled when they are created, also when placed during the mission.

## Classnames

| Object | Classnames |
| --- | --- |
| M101 Howitzer | `shto_vn_static_m101_02_base`, `shto_vn_static_m101_01` |
| Shells | `shto_vn_m101_shell_he`, `_ab`, `_frag`, `_wp`, `_smk`, `_illum`, `_icm` |
| Crates | `shto_vn_m101_he_crate`, `_ab_crate`, `_frag_crate`, `_wp_crate`, `_smoke_crate`, `_illum_crate`, `_icm_crate` |
| Pallets | `shto_vn_m101_<type>_pallet_x42`, `_x24`, `_x18` with `<type>` `he`, `ab`, `frag`, `wp`, `smk`, `illum`, `icm` |
| Cargo containers | `shto_vn_m101_<type>_container_x504` with `<type>` `he`, `ab`, `frag`, `wp`, `smk`, `illum` |
| FDC Backpack | `shto_rto_pack` |
| PRC-77 Radio | `shto_vn_prop_prc77_01` |

The two M101 classes are the two models of S.O.G. Prairie Fire's M101 and work the same.

## Giving players the notebook

The notebook is opened by whoever wears, or stands at, an **FDC Backpack** (`shto_rto_pack`). Put it in the FDC's loadout or in a crate.

## The charge of a shell

The charge set on a shell is the object variable `shto_charge` (1 to 5, public). To place shells with another charge than 1:

```sqf
_shell setVariable ["shto_charge", 3, true];
```

## ACRE2

With ACRE2 loaded, the **PRC-77 Radio (Shot, Over!)** has a mounted ACRE PRC-77 that crew members can use from the ACE interaction menu. Without ACRE2 it is a prop that can be carried and dragged.

## What Shot, Over! changes

- The M101 of Shot, Over! is its own class; S.O.G. Prairie Fire's own M101 stays as it is.
- The gun has no artillery computer.
- Shot, Over! has no CBA settings.
