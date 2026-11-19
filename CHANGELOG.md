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

### Added

- Editor - Gun, shells, crates, pallets and containers in their own "Shot, Over!" Eden category and in Zeus (#11) by Andx
- ACRE - The PRC-77 prop's radio rack moved into an optional ACRE compatibility addon, so Shot, Over! loads without ACRE (#11) by Andx

### Fixed

- Logistics - The illumination crate unpacked ICM shells, and the ICM crate opened as an illumination crate (#11) by Andx
- Logistics - Typos in the names of the empty shell casing and the 18-crate HE pallet (#11) by Andx

### Changed

- M101 - No artillery computer: the firing data comes from the FDC notebook (#11) by Andx
- Config - Loads after S.O.G. Prairie Fire and the ACE parts it patches; all names, actions and hints are in stringtables (#11) by Andx
- Build - Move from SCons to HEMTT and the arma-mod-template; addons renamed to `main`, `m101`, `logistics`, `fcs`, functions to `shot_over_<component>_fnc_*` (#10) by Andx
