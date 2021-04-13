params ["_dialog", ["_pageChange", 0]];
systemChat str _this;
if (!isNil "_dialog") then {
	systemChat "setting var";
	uiNamespace setVariable ["shto_fcs_dialog", _dialog];
} else {
	_dialog = uiNamespace getVariable "shto_fcs_dialog";
};
private _openPage = ((missionNamespace getVariable ["shto_fcs_currentPage", 0]) + _pageChange) max 0;
private _pages = missionNamespace getVariable ["shto_fcs_pages", []];
systemChat str [_openPage, _pages];
private _page = if (_openPage >= count _pages) then [{["","","","","",0]}, {(_pages # _openPage)}];
systemChat str _page;
{
	(_dialog displayCtrl _x) ctrlSetText (_page # _forEachIndex);
} forEach [1500, 1501, 1502, 1503, 1504];
private _combo = _dialog displayCtrl 2100;
_combo lbAdd "HE";
_combo lbAdd "Airburst";
_combo lbAdd "FRAG";
_combo lbAdd "WP";
_combo lbAdd "Smoke";
_combo lbAdd "Lume";
_combo lbSetCurSel _page # 5;

lnbClear (_dialog displayCtrl 1800);
lnbClear (_dialog displayCtrl 1801);

(_dialog displayCtrl 1800) lnbAddRow ["Charge", "Elevation", "TOF"];
(_dialog displayCtrl 1801) lnbAddRow ["", "", ""];

(_dialog displayCtrl 1000) ctrlSetText format["FIREMISSION %1/%2", _openPage + 1, count _pages max 1];
missionNamespace setVariable ["shto_fcs_currentPage", _openPage];
[] spawn shto_fnc_calculateFromNotebook;