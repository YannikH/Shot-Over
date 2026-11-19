#include "..\script_component.hpp"

/*
 * Author: YannikH, toadball, Andx
 * Works out the open fire mission of the FDC notebook: direction and distance from the firing unit to the target,
 * the nearest place names, and a solution (charge, elevation, time of flight) per charge and angle for the
 * selected shell type (fnc_getFiringSolutionsForMagazines). Reads the notebook's fields, or in the minimized
 * notebook the saved page. Invalid or missing grids leave the solutions empty.
 *
 * Arguments:
 * 0: The notebook is minimized (default: false) <BOOL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [false] call shot_over_fcs_fnc_calculateFromNotebook
 *
 * Public: No
 */

params [["_minimized", false, [false]]];

private _dialog = uiNamespace getVariable ["shto_fcs_dialog", displayNull];
if (isNull _dialog) exitWith {};

private _page = if (_minimized) then {
    (missionNamespace getVariable ["shto_fcs_pages", []]) param [missionNamespace getVariable ["shto_fcs_currentPage", 0], []]
} else {
    [
        ctrlText (_dialog displayCtrl IDC_OWN_GRID),
        ctrlText (_dialog displayCtrl IDC_OWN_ELEVATION),
        ctrlText (_dialog displayCtrl IDC_TARGET_GRID),
        ctrlText (_dialog displayCtrl IDC_TARGET_ELEVATION),
        ctrlText (_dialog displayCtrl IDC_NOTES),
        lbCurSel (_dialog displayCtrl IDC_SHELL_TYPE)
    ]
};
_page params [["_ownGrid", "", [""]], ["_ownElevation", "", [""]], ["_targetGrid", "", [""]], ["_targetElevation", "", [""]], "", ["_shellType", 0, [0]]];

private _solutionsCtrl = _dialog displayCtrl IDC_SOLUTIONS;
private _linesCtrl = _dialog displayCtrl IDC_SOLUTION_LINES;
lnbClear _solutionsCtrl;
lnbClear _linesCtrl;
_solutionsCtrl lnbAddRow [LLSTRING(Column_Charge), LLSTRING(Column_Elevation), LLSTRING(Column_TOF)];
_linesCtrl lnbAddRow ["", "", ""];

// a grid has as many easting as northing digits
private _isGrid = {_this != "" && {count _this % 2 == 0}};
if !(_ownGrid call _isGrid && {_targetGrid call _isGrid}) exitWith {};

private _ownPos = [_ownGrid, false] call ace_common_fnc_getMapPosFromGrid;
private _targetPos = [_targetGrid, false] call ace_common_fnc_getMapPosFromGrid;

{
    _x params ["_format", "_pos", "_idc"];
    private _locations = nearestLocations [_pos, [
        "Airport", "Area", "BorderCrossing", "CityCenter", "CivilDefense", "CulturalProperty", "DangerousForces", "Flag",
        "FlatArea", "FlatAreaCity", "FlatAreaCitySmall", "Hill", "HistoricalSite", "Invisible", "Name", "NameCity",
        "NameCityCapital", "NameMarine", "NameVillage", "RockArea", "SafetyZone", "Strategic", "StrongpointArea",
        "VegetationBroadleaf", "VegetationFir", "VegetationPalm", "VegetationVineyard", "ViewPoint"
    ], 5000];
    private _name = if (_locations isEqualTo []) then {""} else {text (_locations select 0)};
    (_dialog displayCtrl _idc) ctrlSetText ([format [_format, _name], ""] select (_name == ""));
} forEach [[LLSTRING(TargetNear), _targetPos, IDC_TARGET_NEAR], [LLSTRING(OwnNear), _ownPos, IDC_OWN_NEAR]];

private _distance = _ownPos distance2D _targetPos;
private _height = parseNumber _targetElevation - parseNumber _ownElevation;
private _shell = SHELL_TYPES param [_shellType max 0, SHELL_TYPES select 0];
private _magazines = CHARGES apply {format [MAGAZINE_FORMAT, _shell, _x]};

{
    _x params ["_charge", "_elevation", "_timeOfFlight"];
    _solutionsCtrl lnbAddRow [str _charge, str round _elevation, str ([_timeOfFlight, 1] call BIS_fnc_cutDecimals)];
    _linesCtrl lnbAddRow ["____", "____", "____"];
} forEach ([_magazines, _distance, _height] call FUNC(getFiringSolutionsForMagazines));

(_dialog displayCtrl IDC_DIRECTION) ctrlSetText format [LLSTRING(Format_Mils), round ((_ownPos getDir _targetPos) * 6400 / 360)];
(_dialog displayCtrl IDC_DISTANCE) ctrlSetText format [LLSTRING(Format_Meters), round _distance];
