# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

<!-- TEMPLATE: `hemtt publish` looks up the entry whose heading exactly
matches the current project version (see .hemtt/project.toml's
[version] / addons/main/script_version.hpp) -- so before publishing,
rename "[Unreleased]" below to "[X.Y.Z] - YYYY-MM-DD" matching that
version, and start a fresh empty [Unreleased] section above it. -->

## [Unreleased]

## [0.1.0] - 2026-11-19

### Added

- Main - Mod icon in the launcher and main menu, and a Workshop preview image, in the ANDX branding (#19) by Andx
- Docs - Documentation site: the M101 and its crew, ammunition and logistics, the FDC notebook, and a page for mission makers (#16) by Andx
- Editor - Gun, shells, crates, pallets and containers in their own "Shot, Over!" Eden category and in Zeus (#11) by Andx
- ACRE - The PRC-77 prop's radio rack moved into an optional ACRE compatibility addon, so Shot, Over! loads without ACRE (#11) by Andx
- M101 - The gunner sees the gun's direction and elevation in mils (ACE's AZ/EL readout) instead of the vanilla optics overlay (#32) by Andx
- M101 - A carried shell can be loaded with the interaction "Load Shell" at the open breech; right click still works as a shortcut (#28) by Andx

### Fixed

- ACRE - The PRC-77 radio's mounted ACRE PRC-77 can be used: its rack was never set up, so it had no "Racks" interaction (#35) by Andx
- Logistics - Pallets and containers keep CBA's and SOG's event handlers: no more "does not support Extended Event Handlers" warnings in the RPT (#25) by Andx
- Logistics - Illumination pallets were stacked with smoke crates (#24) by Andx
- FCS - The FDC notebook works out its solutions again: it asked for range tables from an ACE extension that current ACE no longer has; it now computes them itself, with the same no-air-friction ballistics (#14) by Andx
- FCS - ICM can be picked as shell type in the notebook (#14) by Andx
- FCS - Turning pages no longer adds the shell types to the list again; Ctrl+End closes the open notebook; no script error from "Hide FDC Notebook" before the notebook was first opened (#14) by Andx
- FCS - A new or incomplete fire mission page no longer shows the direction, distance and place names of the page before it, and a new page no longer counts as more pages than there are (e.g. "14/13") (#26) by Andx
- Logistics - A player joining mid-mission no longer deletes the crates on every pallet (#13) by Andx
- Logistics - Taking crates, taking pallets and unpacking crates run on the server: two players can no longer take the same crate or unpack a crate twice, and unpacking works when a client opens it (#13) by Andx
- Logistics - "Take Pallet" is available on containers and gives a pallet of the container's ammunition; the FRAG container's smaller pallets were AB (#13) by Andx
- Logistics - A shell's charge is set from its "Interactions" menu, so shells lying side by side in an open crate no longer show overlapping actions (#27) by Andx
- M101 - Works in multiplayer: the gun is emptied after each shot with a client gunner, loading and firing run where the gun is local, two crew members loading at once no longer lose a shell (#12) by Andx
- M101 - Both M101 variants have the gun's actions; one of the two had no Open or Close Breech, Fire Howitzer, Traverse or Elevate Turret (#30) by Andx
- M101 - The recoil knock-down no longer turns damage back on for units a mission made invulnerable (#12) by Andx
- M101 - The gun without shields (`shto_vn_static_m101_02_base`) and the gun with shields (`shto_vn_static_m101_01`) had each other's model; wheel damage, shields and SOG's "hide clutter" option work again (#33) by Andx
- Logistics - The illumination crate unpacked ICM shells, and the ICM crate opened as an illumination crate (#11) by Andx
- Logistics - Typos in the names of the empty shell casing and the 18-crate HE pallet (#11) by Andx

### Changed

- Logistics - Shells are carried with ACE's own carry action, with a hint on how to load them; taken crates are put on the ground to carry (#13) by Andx
- Logistics - Containers hold 252 crates (504 rounds) as a number and show it in the "Take" action, instead of stacking crate objects (#13) by Andx
- M101 - "Fire Howitzer" needs a gunner; no AI gunner is created for it (#12) by Andx
- M101 - Empty casings are removed after 5 minutes; the gun's actions are reached from 3 m (#12) by Andx
- M101 - No artillery computer: the firing data comes from the FDC notebook (#11) by Andx
- Config - Loads after S.O.G. Prairie Fire and the ACE parts it patches; all names, actions and hints are in stringtables (#11) by Andx
- Build - Move from SCons to HEMTT and the arma-mod-template; addons renamed to `main`, `m101`, `logistics`, `fcs`, functions to `shot_over_<component>_fnc_*` (#10) by Andx

### Removed

- M101 - The "Traverse Turret" action at the handwheel: the gunner lays the direction with ACE's AZ readout while aiming (#34) by Andx
