#define FONT_TEXT "tt2020style_e_vn"
#define FONT_TITLE "tt2020style_e_vn_bold"
#define COLOR_TEXT {0.9, 0.9, 0.8, 1}
#define TEXT_SIZE (safeZoneH * 0.035)
#define LINE_H (safeZoneH * 0.002)
#define VIEW_W TO_X(safeZoneH)
#define PANEL_Y (safeZoneY + safeZoneH * 0.3)
#define PANEL_RIGHT_X (safeZoneX + safeZoneW - PANEL_W)
#define TAPE_W TO_X(TAPE_SIZE)
#define TAPE_X (safeZoneX + safeZoneW / 2 - TAPE_W / 2)
#define TAPE_Y (safeZoneY + safeZoneH - TAPE_SIZE)

class RscTitles {
    class GVAR(view) {
        idd = -1;
        movingEnable = 0;
        duration = 1e+011;
        fadeIn = 0;
        fadeOut = 0;
        onLoad = QUOTE(uiNamespace setVariable [ARR_2(QQGVAR(display),_this select 0)]);
        class Controls {
            // the telescope's view is a square of the screen's height, black beside it
            class BorderLeft: IGUIBack {
                idc = -1;
                x = "safeZoneX";
                y = "safeZoneY";
                w = QUOTE((safeZoneW - VIEW_W) / 2);
                h = "safeZoneH";
                colorBackground[] = {0, 0, 0, 1};
            };
            class BorderRight: BorderLeft {
                x = QUOTE(safeZoneX + (safeZoneW + VIEW_W) / 2);
            };
            // reticle: vertical line to lay on the aiming point, short horizontal line
            class ReticleVertical: IGUIBack {
                idc = -1;
                x = QUOTE(safeZoneX + safeZoneW / 2 - TO_X(LINE_H) / 2);
                y = "safeZoneY + safeZoneH * 0.1";
                w = QUOTE(TO_X(LINE_H));
                h = "safeZoneH * 0.55";
                colorBackground[] = {0, 0, 0, 1};
            };
            class ReticleHorizontal: ReticleVertical {
                x = QUOTE(safeZoneX + safeZoneW / 2 - TO_X(safeZoneH * 0.05));
                y = QUOTE(safeZoneY + safeZoneH * 0.375 - LINE_H / 2);
                w = QUOTE(TO_X(safeZoneH * 0.1));
                h = QUOTE(LINE_H);
            };

            // the dials and the gun's controls look alike in use; this line says which does what
            class Help: RscText {
                idc = -1;
                text = CSTRING(Help);
                style = 2;
                font = FONT_TEXT;
                sizeEx = QUOTE(TEXT_SIZE * 0.7);
                colorText[] = COLOR_TEXT;
                colorBackground[] = {0, 0, 0, 0.6};
                shadow = 0;
                x = QUOTE(safeZoneX + (safeZoneW - VIEW_W) / 2);
                y = "safeZoneY";
                w = QUOTE(VIEW_W);
                h = QUOTE(TEXT_SIZE * 1.2);
            };

            // deflection: tape behind the cover's window, moved by fnc_update; the group clips it to the window
            class TapeGroup: RscControlsGroupNoScrollbars {
                idc = IDC_TAPE_GROUP;
                x = QUOTE(TAPE_X + TAPE_W * TAPE_WINDOW_LEFT_PX / 1024);
                y = QUOTE(TAPE_Y);
                w = QUOTE(TAPE_W * (TAPE_WINDOW_RIGHT_PX - TAPE_WINDOW_LEFT_PX) / 1024);
                h = QUOTE(TAPE_SIZE);
                class Controls {
                    class Tape: RscPicture {
                        idc = IDC_TAPE;
                        text = QPATHTOF(data\deflection_scale_ca.paa);
                        x = 0;
                        y = 0;
                        w = QUOTE(TAPE_W);
                        h = QUOTE(TAPE_SIZE);
                    };
                    // the same tape one turn further, so the window is never empty around 0/6400
                    class TapeWrap: Tape {
                        idc = IDC_TAPE_WRAP;
                    };
                };
            };
            class TapeCover: RscPicture {
                idc = -1;
                text = QPATHTOF(data\deflection_cover_ca.paa);
                x = QUOTE(TAPE_X);
                y = QUOTE(TAPE_Y);
                w = QUOTE(TAPE_W);
                h = QUOTE(TAPE_SIZE);
            };

            // right panel: deflection counter
            class PanelRight: RscPicture {
                idc = -1;
                text = QPATHTOF(data\panel_co.paa);
                x = QUOTE(PANEL_RIGHT_X);
                y = QUOTE(PANEL_Y);
                w = QUOTE(PANEL_W);
                h = QUOTE(PANEL_SIZE * 0.5);
            };
            class DeflectionTitle: RscText {
                idc = -1;
                text = CSTRING(Deflection);
                style = 2;
                font = FONT_TITLE;
                sizeEx = QUOTE(TEXT_SIZE);
                colorText[] = COLOR_TEXT;
                shadow = 0;
                x = QUOTE(PANEL_RIGHT_X);
                y = QUOTE(PANEL_Y + PANEL_SIZE * 0.08);
                w = QUOTE(PANEL_W);
                h = QUOTE(TEXT_SIZE * 1.2);
            };
            class Deflection: DeflectionTitle {
                idc = IDC_DEFLECTION;
                text = "";
                font = FONT_TEXT;
                sizeEx = QUOTE(TEXT_SIZE * 1.5);
                y = QUOTE(PANEL_Y + PANEL_SIZE * 0.22);
                h = QUOTE(TEXT_SIZE * 1.8);
            };

            // left panel: quadrant counter and level bubble
            class PanelLeft: PanelRight {
                x = "safeZoneX";
                h = QUOTE(PANEL_SIZE * 0.8);
            };
            class QuadrantTitle: DeflectionTitle {
                text = CSTRING(Quadrant);
                x = "safeZoneX";
            };
            class Quadrant: Deflection {
                idc = IDC_QUADRANT;
                x = "safeZoneX";
            };
            class Vial: IGUIBack {
                idc = IDC_VIAL;
                x = QUOTE(safeZoneX + PANEL_W * 0.25);
                y = QUOTE(PANEL_Y + PANEL_SIZE * 0.5);
                w = QUOTE(PANEL_W * 0.5);
                h = QUOTE(PANEL_SIZE * 0.08);
                colorBackground[] = {0.2, 0.2, 0.08, 1};
            };
            class Bubble: Vial {
                idc = IDC_BUBBLE;
                x = QUOTE(safeZoneX + PANEL_W * 0.5 - TO_X(PANEL_SIZE * 0.04));
                w = QUOTE(TO_X(PANEL_SIZE * 0.08));
                colorBackground[] = {0.8, 0.85, 0.3, 1};
            };
            class High: QuadrantTitle {
                text = CSTRING(High);
                style = 0;
                sizeEx = QUOTE(TEXT_SIZE * 0.7);
                x = QUOTE(safeZoneX + PANEL_W * 0.02);
                y = QUOTE(PANEL_Y + PANEL_SIZE * 0.5);
                w = QUOTE(PANEL_W * 0.22);
                h = QUOTE(PANEL_SIZE * 0.08);
            };
            class Low: High {
                text = CSTRING(Low);
                style = 1;
                x = QUOTE(safeZoneX + PANEL_W * 0.76);
            };
            class Level: QuadrantTitle {
                idc = IDC_LEVEL;
                text = CSTRING(Level);
                sizeEx = QUOTE(TEXT_SIZE * 0.8);
                y = QUOTE(PANEL_Y + PANEL_SIZE * 0.62);
            };
        };
    };
};
