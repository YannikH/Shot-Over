params ["_minimized"];
private _dialog = uiNamespace getVariable "shto_fcs_dialog";

private _ownPosStr = ctrlText  (1500);
private _ownElevStr = ctrlText  (1501);
private _tgtPosStr = ctrlText  (1502);
private _tgtElevStr = ctrlText  (1503);
private _notes = ctrlText  (1504);
private _shellType = lbCurSel (2100);
if (_minimized) then {
	private _openPage = missionNamespace getVariable ["shto_fcs_currentPage", 0];
	//private _pages = missionNamespace getVariable ["shto_fcs_pages", []];
	private _pages = missionNamespace getVariable ["shto_fcs_pages", [["123123","5","155155","6","",0]]];
	if (_openPage >= count _pages) exitWith {};
	_ownPosStr = (_pages # _openPage) # 0;
	_ownElevStr = (_pages # _openPage) # 1;
	_tgtPosStr = (_pages # _openPage) # 2;
	_tgtElevStr = (_pages # _openPage) # 3;
	_notes = (_pages # _openPage) # 4;
	_shellType = (_pages # _openPage) # 5;
};
//systemChat str [_ownPosStr, _ownElevStr, _tgtPosStr, _tgtElevStr, _shellType];

if (count _ownPosStr % 2 > 0 || _ownPosStr == "") exitWith {systemChat "bad";};
if (count _tgtPosStr % 2 > 0 || _tgtPosStr == "") exitWith {systemChat "bad";};

private _ownPos = ([_ownPosStr, false] call ace_common_fnc_getMapPosFromGrid);
private _tgtPos = ([_tgtPosStr, false] call ace_common_fnc_getMapPosFromGrid);
private _ownElev = parseNumber _ownElevStr;
private _tgtElev = parseNumber _tgtElevStr;

{
	_x params ["_format", "_pos", "_idc"];
	private _nearLocations = (nearestLocations [_pos, ["Airport","Area","BorderCrossing","CityCenter","CivilDefense","CulturalProperty","DangerousForces","Flag","FlatArea","FlatAreaCity","FlatAreaCitySmall","Hill","HistoricalSite","Invisible","Name","NameCity","NameCityCapital","NameMarine","NameVillage","RockArea","SafetyZone","Strategic","StrongpointArea","VegetationBroadleaf","VegetationFir","VegetationPalm","VegetationVineyard","ViewPoint"], 5000]);
	if (count _nearLocations > 0) then {
		private _name = text (_nearLocations # 0);
		if (_name != "") then {
			(_dialog displayCtrl _idc) ctrlSetText format [_format, _name];
		} else {
			(_dialog displayCtrl _idc) ctrlSetText "";
		};
	};
} forEach [["Tgt near %1", _tgtPos, 1017], ["We're near %1", _ownPos, 1018]];


//systemChat str [_ownPos, _tgtPos, _ownElev, _tgtElev];
private _altDiff = _tgtElev - _ownElev;
private _dist = _ownPos distance2D _tgtPos;
private _dir = _ownPos getDir _tgtPos;

private _magazineText = ["he", "ab", "frag", "wp", "chem", "lume"] # _shellType;
private _magazines = [1, 2, 3, 4, 5] apply {format ["shto_105mm_mag_%1_x1_c%2", _magazineText, _x]};

private _solutions = [_magazines, _dist, -_altDiff] call shot_over_shto_fcs_fnc_getFiringSolutionsForMagazines;
lnbClear (_dialog displayCtrl 1800);
lnbClear (_dialog displayCtrl 1801);
(_dialog displayCtrl 1800) lnbAddRow ["Charge", "Elevation", "TOF"];
(_dialog displayCtrl 1801) lnbAddRow ["", "", ""];
{
	(_dialog displayCtrl 1800 )lnbAddRow [ str round (_x # 0), str round (_x # 1), str ([(_x # 2), 1] call BIS_fnc_cutDecimals)];
	(_dialog displayCtrl 1801 )lnbAddRow ["____","____","____"];
} forEach _solutions;
(_dialog displayCtrl 1014) ctrlSetText format["%1 mils", round (_dir / 360 * 6400)];
(_dialog displayCtrl 1016) ctrlSetText format["%1m", round _dist];
