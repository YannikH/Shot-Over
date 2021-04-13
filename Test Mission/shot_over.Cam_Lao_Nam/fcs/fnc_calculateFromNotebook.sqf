private _dialog = uiNamespace getVariable "shto_fcs_dialog";

private _ownPosStr = ctrlText  (1500);
private _ownElevStr = ctrlText  (1501);
private _tgtPosStr = ctrlText  (1502);
private _tgtElevStr = ctrlText  (1503);
private _notes = ctrlText  (1504);
private _shellType = lbCurSel (2100);
systemChat str [_ownPosStr, _ownElevStr, _tgtPosStr, _tgtElevStr, _shellType];

if (count _ownPosStr % 2 > 0) exitWith {systemChat "bad";};
if (count _tgtPosStr % 2 > 0) exitWith {systemChat "bad";};

private _ownPos = ((_ownPosStr call BIS_fnc_gridToPos) # 0) + [0];
private _tgtPos = ((_tgtPosStr call BIS_fnc_gridToPos) # 0) + [0];
private _ownElev = parseNumber _ownElevStr;
private _tgtElev = parseNumber _tgtElevStr;

systemChat str [_ownPos, _tgtPos, _ownElev, _tgtElev];
private _altDiff = _tgtElev - _ownElev;
private _dist = _ownPos distance2D _tgtPos;
private _dir = _ownPos getDir _tgtPos;

private _magazineText = ["he", "ab", "frag", "wp", "chem", "lume"] # _shellType;
private _magazines = [1, 2, 3, 4, 5] apply {format ["shto_105mm_mag_%1_x1_c%2", _magazineText, _x]};

private _solutions = [_magazines, _dist, -_altDiff] call shto_fnc_getFiringSolutionsForMagazines;
systemChat str _solutions;
{
	(_dialog displayCtrl 1800 )lnbAddRow [ str round (_x # 0), str round (_x # 1), str ([(_x # 2), 1] call BIS_fnc_cutDecimals)];
	(_dialog displayCtrl 1801 )lnbAddRow ["____","____","____"];
} forEach _solutions;
(_dialog displayCtrl 1014) ctrlSetText str (_dir / 360 * 6400);
