#define COMPONENT fcs
#define COMPONENT_BEAUTIFIED FCS
#include "\z\shot_over\addons\main\script_mod.hpp"

#include "\z\shot_over\addons\main\script_macros.hpp"

// ACE action distance (m) of the "Open FDC Notebook" action on a backpack lying on the ground
#define INTERACTION_DISTANCE 3

// Firing solutions: the M101's elevation limits (degrees); GRAVITY comes from ACE's script_macros.hpp
#define MIN_ELEVATION -5
#define MAX_ELEVATION 66

// Magazine class of a shell type and charge, and the shell types in the order of the notebook's shell list
#define MAGAZINE_FORMAT "shto_105mm_mag_%1_x1_c%2"
#define SHELL_TYPES ["he", "ab", "frag", "wp", "chem", "lume", "icm"]
#define CHARGES [1, 2, 3, 4, 5]

// Notebook controls (uiConfig\fcs.hpp)
#define IDC_TITLE 1000
#define IDC_DIRECTION 1014
#define IDC_DISTANCE 1016
#define IDC_TARGET_NEAR 1017
#define IDC_OWN_NEAR 1018
#define IDC_OWN_GRID 1500
#define IDC_OWN_ELEVATION 1501
#define IDC_TARGET_GRID 1502
#define IDC_TARGET_ELEVATION 1503
#define IDC_NOTES 1504
#define IDC_SOLUTIONS 1800
#define IDC_SOLUTION_LINES 1801
#define IDC_SHELL_TYPE 2100
#define IDC_AZIMUTH_OF_LAY 1505
#define IDC_DEFLECTION 1021
// Layer of the minimized notebook (cutRsc)
#define MINIMIZED_LAYER 95010
