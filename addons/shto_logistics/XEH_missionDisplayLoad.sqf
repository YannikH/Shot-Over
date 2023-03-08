#include "script_component.hpp"

params ["_display"];

shto_carry_mouseButtonEvent = _display displayAddEventHandler ["MouseButtonDown", "_this call shot_over_shto_logistics_fnc_mouseButton;"];