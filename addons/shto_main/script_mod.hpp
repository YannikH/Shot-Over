// COMPONENT should be defined in the script_component.hpp and included BEFORE this hpp

#define PREFIX shot_over

#include "script_version.hpp"

#define VERSION MAJOR.MINOR.PATCHLVL.BUILD
#define VERSION_AR MAJOR,MINOR,PATCHLVL,BUILD

#define shot_over_TAG shot_over

// MINIMAL required version for the Mod. Components can specify others..
#define REQUIRED_VERSION 1.56

#ifdef COMPONENT_BEAUTIFIED
    #define COMPONENT_NAME QUOTE(shot_over - COMPONENT_BEAUTIFIED)
#else
    #define COMPONENT_NAME QUOTE(shot_over - COMPONENT)
#endif
