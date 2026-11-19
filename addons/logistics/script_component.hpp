#define COMPONENT logistics
#define COMPONENT_BEAUTIFIED Logistics
#include "\z\shot_over\addons\main\script_mod.hpp"

#include "\z\shot_over\addons\main\script_macros.hpp"

// ACE action distance (m) of the shell, crate, pallet and container actions
#define INTERACTION_DISTANCE 5
// ACE cargo size of a pallet per started 21 crates (a full x42 pallet)
#define PALLET_CARGO_SIZE(crates) (ceil ((crates) / 21) * 5)
// Where the two shells lie in an opened crate (open crate model)
#define CRATE_SHELL_POSITIONS [[0.425, 0.075, 0.1], [0.425, -0.075, 0.1]]
