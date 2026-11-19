#define COMPONENT sight
#define COMPONENT_BEAUTIFIED Sight
#include "\z\shot_over\addons\main\script_mod.hpp"

#include "\z\shot_over\addons\main\script_macros.hpp"

#define GUN_CLASS "shto_vn_static_m101_02_base"
#define MILS_PER_DEGREE (6400 / 360)

// Panoramic telescope: position from the elevation axis with the gun pointing forward (model space, tune in-game),
// field of view (about 4x) and the deflection it shows before anyone set one (the common deflection)
#define TELESCOPE_OFFSET [-0.45, 0, 0.4]
#define TELESCOPE_FOV 0.19
#define DEFAULT_DEFLECTION 3200

// Quadrant limits (mils): the gun's elevation limits, -5 to 66 degrees, as in the notebook
#define QUADRANT_MIN -89
#define QUADRANT_MAX 1173
// Level bubble: mils from the centre to the end of the vial, and how close counts as level (the notebook gives
// whole mils; a tap of Page Up/Down moves the barrel about 2 mils, see the M101's maxVerticalRotSpeed)
#define BUBBLE_RANGE 20
#define BUBBLE_LEVEL 1

// Dials: a key press turns by 1 mil; held longer than TURN_DELAY s it turns at TURN_RATE mil/s,
// TURN_RATE_FAST mil/s after TURN_FAST_AFTER s
#define TURN_DELAY 0.4
#define TURN_RATE 20
#define TURN_RATE_FAST 400
#define TURN_FAST_AFTER 2

// Deflection tape texture (data\deflection_scale_ca.paa, 1024 px wide), measured on the texture:
// the 0 mark is at px 31 and one turn (6400 mils) is 980 px; the texture repeats seamlessly with that period (its
// first and last 44 px are the same), the index of the cover (data\deflection_cover_ca.paa) is at px 512 and its
// window from px 322 to 712
#define TAPE_ZERO_PX 31
#define TAPE_PX_PER_MIL (980 / 6400)
#define TAPE_INDEX_PX 512
#define TAPE_WINDOW_LEFT_PX 322
#define TAPE_WINDOW_RIGHT_PX 712

// UI (uiConfig\RscTitles.hpp). x and y units differ in pixels: TO_X turns a length in y units into the x units of
// the same length on screen. The tape and cover controls are square, TAPE_SIZE high; the side panels PANEL_SIZE wide.
#define TO_X(length) ((length) * pixelW / pixelH)
#define TAPE_SIZE (safeZoneH * 0.8)
#define PANEL_SIZE (safeZoneH * 0.3)
#define PANEL_W TO_X(PANEL_SIZE)

#define IDC_QUADRANT 1000
#define IDC_DEFLECTION 1001
#define IDC_BUBBLE 1002
#define IDC_LEVEL 1003
#define IDC_TAPE_GROUP 1004
#define IDC_TAPE 1005
#define IDC_TAPE_WRAP 1006
#define IDC_VIAL 1007
