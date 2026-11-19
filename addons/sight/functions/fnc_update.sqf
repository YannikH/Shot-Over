#include "..\script_component.hpp"
/*
 * Author: YannikH, Andx
 * Per-frame handler while the sights are open: turns a held dial, places the telescope's camera and moves the
 * deflection tape and the level bubble. Closes the sights once the player is no longer the gun's gunner.
 *
 * The telescope sits on the carriage and stays level: it turns with the traverse, not with the elevation, and looks
 * the deflection to the right of the barrel. With the aiming point on the vertical line, raising the deflection
 * therefore traverses the gun left, as on the real gun.
 *
 * Arguments:
 * 0: Gun <OBJECT>
 * 1: PFH handle <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [_gun, _handle] call shot_over_sight_fnc_update
 *
 * Public: No
 */

params ["_gun"];

if (isNull _gun || {!alive _gun} || {!alive ACE_player} || {ACE_player != gunner _gun}) exitWith {
    call FUNC(close);
};

if (GVAR(turning) isNotEqualTo []) then {
    GVAR(turning) params ["_dial", "_direction", "_pressed"];
    private _held = diag_tickTime - _pressed;
    if (_held > TURN_DELAY) then {
        private _rate = [TURN_RATE, TURN_RATE_FAST] select (_held > TURN_FAST_AFTER);
        [_dial, _direction * _rate * diag_deltaTime] call FUNC(turnDial);
    };
};

private _deflection = round GVAR(currentDeflection) % 6400;
private _quadrant = round GVAR(currentQuadrant);

private _weaponDir = _gun weaponDirection currentWeapon _gun;
private _azimuth = ((_weaponDir select 0) atan2 (_weaponDir select 1)) + _deflection / MILS_PER_DEGREE;
GVAR(camera) setPosASL (_gun modelToWorldVisualWorld ([_gun, TELESCOPE_OFFSET] call EFUNC(m101,posAlongDirection)));
GVAR(camera) setVectorDirAndUp [[sin _azimuth, cos _azimuth, 0], [0, 0, 1]];

private _display = uiNamespace getVariable [QGVAR(display), displayNull];
if (isNull _display) exitWith {};

(_display displayCtrl IDC_DEFLECTION) ctrlSetText ([_deflection, 4] call CBA_fnc_formatNumber);
(_display displayCtrl IDC_QUADRANT) ctrlSetText str _quadrant;
private _azimuthOfLay = _gun getVariable [QGVAR(azimuthOfLay), -1];
(_display displayCtrl IDC_AZIMUTH_OF_LAY) ctrlSetText (
    [format [LLSTRING(AzimuthOfLay), [_azimuthOfLay, 4] call CBA_fnc_formatNumber], ""] select (_azimuthOfLay < 0)
);

// the tape's mark for the deflection under the cover's index; a second tape one turn further fills the window
// around 0/6400
private _tape = _display displayCtrl IDC_TAPE;
private _scale = ((ctrlPosition _tape) select 2) / 1024;
private _tapeX = (TAPE_INDEX_PX - TAPE_WINDOW_LEFT_PX - TAPE_ZERO_PX - _deflection * TAPE_PX_PER_MIL) * _scale;
private _turn = 6400 * TAPE_PX_PER_MIL * _scale;
_tape ctrlSetPositionX _tapeX;
_tape ctrlCommit 0;
private _tapeWrap = _display displayCtrl IDC_TAPE_WRAP;
_tapeWrap ctrlSetPositionX (_tapeX + ([-_turn, _turn] select (_deflection >= 3200)));
_tapeWrap ctrlCommit 0;

// the quadrant sits on the breech and measures the barrel against the horizon, as the notebook's elevation does;
// the bubble moves to the end the barrel is off to
private _difference = _quadrant - (asin (_weaponDir select 2)) * MILS_PER_DEGREE;
private _offset = _difference max -BUBBLE_RANGE min BUBBLE_RANGE;
(ctrlPosition (_display displayCtrl IDC_VIAL)) params ["_vialX", "", "_vialW"];
private _bubble = _display displayCtrl IDC_BUBBLE;
private _bubbleW = (ctrlPosition _bubble) select 2;
_bubble ctrlSetPositionX (_vialX + (_vialW - _bubbleW) / 2 * (1 + _offset / BUBBLE_RANGE));
_bubble ctrlCommit 0;
(_display displayCtrl IDC_LEVEL) ctrlShow (abs _difference <= BUBBLE_LEVEL);
