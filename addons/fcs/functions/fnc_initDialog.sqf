#include "..\script_component.hpp"

/*
 * Author: YannikH, toadball, Andx
 * Fills the FDC notebook, or its minimized view, with a fire mission page and works it out
 * (fnc_calculateFromNotebook). Pages are kept per player in shto_fcs_pages; a new page takes the firing unit's
 * grid and elevation from the last one. Called by the dialogs' onLoad and by the page buttons.
 *
 * Arguments:
 * 0: Notebook display (default: the open one) <DISPLAY>
 * 1: Pages to turn, -1 back, 1 forward (default: 0) <NUMBER>
 * 2: The minimized notebook (default: false) <BOOL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [displayNull, 1] call shot_over_fcs_fnc_initDialog
 *
 * Public: No
 */

params [["_dialog", displayNull, [displayNull]], ["_pageChange", 0, [0]], ["_minimized", false, [false]]];

if (!_minimized) then {
    MINIMIZED_LAYER cutText ["", "PLAIN"];
};
if (isNull _dialog) then {
    _dialog = uiNamespace getVariable ["shto_fcs_dialog", displayNull];
} else {
    uiNamespace setVariable ["shto_fcs_dialog", _dialog];
};
if (isNull _dialog) exitWith {};

private _openPage = ((missionNamespace getVariable ["shto_fcs_currentPage", 0]) + _pageChange) max 0;
private _pages = missionNamespace getVariable ["shto_fcs_pages", []];
private _page = if (_openPage < count _pages) then {
    _pages select _openPage
} else {
    // a new page: the firing unit is still where the last mission had it
    (_pages param [count _pages - 1, ["", ""]]) params [["_ownGrid", ""], ["_ownElevation", ""]];
    [_ownGrid, _ownElevation, "", "", "", 0]
};

{
    (_dialog displayCtrl _x) ctrlSetText (_page select _forEachIndex);
} forEach [IDC_OWN_GRID, IDC_OWN_ELEVATION, IDC_TARGET_GRID, IDC_TARGET_ELEVATION, IDC_NOTES];

// the list is filled anew for every page, so clear it first
private _shellList = _dialog displayCtrl IDC_SHELL_TYPE;
lbClear _shellList;
{
    _shellList lbAdd _x;
} forEach [LLSTRING(Shell_HE), LLSTRING(Shell_Airburst), LLSTRING(Shell_FRAG), LLSTRING(Shell_WP), LLSTRING(Shell_Smoke), LLSTRING(Shell_Lume), LLSTRING(Shell_ICM)];
_shellList lbSetCurSel (_page select 5);

(_dialog displayCtrl IDC_TITLE) ctrlSetText format [LLSTRING(Firemission), _openPage + 1, count _pages max (_openPage + 1)];
missionNamespace setVariable ["shto_fcs_currentPage", _openPage];

[_minimized] call FUNC(calculateFromNotebook);
