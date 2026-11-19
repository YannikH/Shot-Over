#define MAINPREFIX z
#define PREFIX shot_over
// the mod is "Shot, Over!", but a comma cannot go into a macro argument (QUOTE), so CfgPatches names read "Shot Over - ..."
#define MOD_NAME Shot Over
#define AUTHOR "YannikH, toadball, Yax"

#define REQUIRED_VERSION 2.18

#include "script_version.hpp"

#define VERSION MAJOR.MINOR
#define VERSION_STR MAJOR.MINOR.PATCH
#define VERSION_AR MAJOR,MINOR,PATCH
#define VERSION_CONFIG version = VERSION; versionStr = QUOTE(VERSION_STR); versionAr[] = {VERSION_AR}

#ifndef COMPONENT_BEAUTIFIED
    #define COMPONENT_BEAUTIFIED COMPONENT
#endif
#define COMPONENT_NAME QUOTE(MOD_NAME - COMPONENT_BEAUTIFIED)
