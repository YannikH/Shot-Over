// Global toggles for caching/logging
// #define DISABLE_COMPILE_CACHE
// #define DEBUG_MODE_FULL

#include "\x\cba\addons\main\script_macros_common.hpp"
#include "\x\cba\addons\xeh\script_xeh.hpp"
#include "\z\ace\addons\main\script_macros.hpp"

#undef PREP
#ifdef DISABLE_COMPILE_CACHE
    #define LINKFUNC(x) {call FUNC(x)}
    #define PREP(fncName) FUNC(fncName) = compile preprocessFileLineNumbers QPATHTOF(functions\DOUBLES(fnc,fncName).sqf)
    #define PREP_RECOMPILE_START    if (isNil "shot_over_fnc_recompile") then {shot_over_recompiles = []; shot_over_fnc_recompile = {{call _x} forEach shot_over_recompiles;}}; private _recomp = {
    #define PREP_RECOMPILE_END      }; call _recomp; shot_over_recompiles pushBack _recomp;
#else
    // LINKFUNC / PREP_RECOMPILE_START / PREP_RECOMPILE_END already match ACE3's script_debug.hpp for this branch - not redefined here.
    #define PREP(fncName) [QPATHTOF(functions\DOUBLES(fnc,fncName).sqf), QFUNC(fncName)] call CBA_fnc_compileFunction
#endif
