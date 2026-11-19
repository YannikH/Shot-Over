#include "script_component.hpp"

ADDON = false;

#include "XEH_PREP.hpp"

// the dial keys' release handlers read this before the sights are first opened
GVAR(turning) = [];

ADDON = true;
