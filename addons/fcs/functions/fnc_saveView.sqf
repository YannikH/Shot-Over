#include "..\script_component.hpp"

/*
 * Author: YannikH, toadball, Andx
 * Saves the open page of the FDC notebook (grids, elevations, notes, shell type, azimuth of lay) into
 * shto_fcs_pages, before a page is turned or the notebook is closed. Does nothing for the minimized notebook, which
 * has no fields.
 *
 * Arguments:
 * 0: Notebook display (default: the open one) <DISPLAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call shot_over_fcs_fnc_saveView
 *
 * Public: No
 */

params [["_dialog", displayNull, [displayNull]]];

if (isNull _dialog) then {
    _dialog = uiNamespace getVariable ["shto_fcs_dialog", displayNull];
};
if (isNull (_dialog displayCtrl IDC_OWN_GRID)) exitWith {};

private _pages = missionNamespace getVariable ["shto_fcs_pages", []];
_pages set [missionNamespace getVariable ["shto_fcs_currentPage", 0], [
    ctrlText (_dialog displayCtrl IDC_OWN_GRID),
    ctrlText (_dialog displayCtrl IDC_OWN_ELEVATION),
    ctrlText (_dialog displayCtrl IDC_TARGET_GRID),
    ctrlText (_dialog displayCtrl IDC_TARGET_ELEVATION),
    ctrlText (_dialog displayCtrl IDC_NOTES),
    lbCurSel (_dialog displayCtrl IDC_SHELL_TYPE),
    ctrlText (_dialog displayCtrl IDC_AZIMUTH_OF_LAY)
]];
missionNamespace setVariable ["shto_fcs_pages", _pages];
