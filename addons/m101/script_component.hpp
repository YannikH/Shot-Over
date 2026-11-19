#define COMPONENT m101
#define COMPONENT_BEAUTIFIED M101
#include "\z\shot_over\addons\main\script_mod.hpp"

#include "\z\shot_over\addons\main\script_macros.hpp"

// Phases of the breech animation source: closed, open and empty (ready to load), loaded, just fired (recoil end)
#define BREECH_SOURCE "m101_reload_source"
#define BREECH_CLOSED 0
#define BREECH_OPEN 0.7
#define BREECH_LOADED 0.3
#define BREECH_FIRED 0.9

// ACE action distance (m) to the gun's action points
#define INTERACTION_DISTANCE 3
// The breech along the recoil axis (gun model, see fnc_posAlongRecoilAxis)
#define BREECH_OFFSET [0, -1.5, 0.5]
// How close (m) a carried shell must be to the breech to load it, and how far to look for a gun
#define LOAD_DISTANCE 1
#define GUN_SEARCH_DISTANCE 5
// Units closer than this (m, 2D) to the point behind the breech are knocked down by the recoil
#define RECOIL_OFFSET [0, -2, 0.5]
#define RECOIL_HIT_DISTANCE 0.35
// Force of the knock-down (addForce), to tune in-game
#define KNOCKDOWN_FORCE 400
// Seconds an ejected casing stays before the server deletes it
#define CASING_LIFETIME 300
// Muzzle velocity spread per shot, in percent of the muzzle velocity
#define MUZZLE_VELOCITY_SPREAD 0.25
