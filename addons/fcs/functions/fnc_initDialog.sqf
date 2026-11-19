#include "..\script_component.hpp"

params ["_dialog", ["_pageChange", 0], ["_minimized", false]];
// systemChat str _this;
if (!_minimized) then {95010 cutText ["", "PLAIN"];};
if (!isNil "_dialog") then {
	uiNamespace setVariable ["shto_fcs_dialog", _dialog];
} else {
	_dialog = uiNamespace getVariable "shto_fcs_dialog";
};
private _openPage = ((missionNamespace getVariable ["shto_fcs_currentPage", 0]) + _pageChange) max 0;
private _pages = missionNamespace getVariable ["shto_fcs_pages", []];
//systemChat str [_openPage, _pages];
private _lastPage = if (count _pages > 0) then [{
	[
		(_pages # ((count _pages) - 1)) # 0,
		(_pages # ((count _pages) - 1)) # 1,
		"","","",0
	]
}, {["","","","","",0]}];
private _page = if (_openPage >= count _pages) then [{_lastPage}, {(_pages # _openPage)}];
// systemChat str _page;
{
	(_dialog displayCtrl _x) ctrlSetText (_page # _forEachIndex);
} forEach [1500, 1501, 1502, 1503, 1504];
private _combo = _dialog displayCtrl 2100;
_combo lbAdd LLSTRING(Shell_HE);
_combo lbAdd LLSTRING(Shell_Airburst);
_combo lbAdd LLSTRING(Shell_FRAG);
_combo lbAdd LLSTRING(Shell_WP);
_combo lbAdd LLSTRING(Shell_Smoke);
_combo lbAdd LLSTRING(Shell_Lume);
_combo lbSetCurSel _page # 5;

lnbClear (_dialog displayCtrl 1800);
lnbClear (_dialog displayCtrl 1801);

(_dialog displayCtrl 1800) lnbAddRow [LLSTRING(Column_Charge), LLSTRING(Column_Elevation), LLSTRING(Column_TOF)];
(_dialog displayCtrl 1801) lnbAddRow ["", "", ""];

(_dialog displayCtrl 1000) ctrlSetText format[LLSTRING(Firemission), _openPage + 1, count _pages max 1];
missionNamespace setVariable ["shto_fcs_currentPage", _openPage];
[_minimized] spawn shot_over_fcs_fnc_calculateFromNotebook;
