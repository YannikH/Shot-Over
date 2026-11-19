#include "..\script_component.hpp"

/*
 * Author: YannikH, toadball
 * Shows the minimized FDC notebook (the open fire mission's solutions in a corner of the screen) after the
 * notebook is closed. Its onLoad fills it (fnc_initDialog).
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call shot_over_fcs_fnc_openMinimized
 *
 * Public: No
 */

MINIMIZED_LAYER cutRsc ["shto_calculator_minimized", "PLAIN", -1, true];
