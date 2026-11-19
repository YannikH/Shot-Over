# The FDC Notebook

The fire direction centre (FDC) works out the firing data for the gun in a paper notebook. It comes with the **FDC Backpack (Shot, Over!)**.

## Opening it

- Wearing the FDC backpack: self interaction (hold ++ctrl+left-windows++) → **Equipment** → **Open FDC Notebook**, or press ++end++.
- With the backpack on the ground: interaction on the backpack → **Open FDC Notebook**.

## A fire mission

Each page of the notebook is one fire mission.

1. **FIRING UNIT**: the gun's **Own Grid** and **Elevation** (m).
2. **TARGET INFO**: the **Target Grid** and its **Elevation** (m), and **NOTES** if you like.
3. Pick the **Shell Type**.
4. **CALC** works it out:
    - **Direction** to the target in mils and **Distance** in metres
    - the nearest place names to the target and to the gun
    - a line per **Charge** and angle: **Elevation** in mils and time of flight (**TOF**) in seconds. Low and high angle are both listed where they lie between -5° and 66° (about -89 and 1173 mils); charges that cannot reach the target are left out.
5. Give the gunner the direction, the charge and the elevation.

Grids are entered without spaces and with as many easting as northing digits, e.g. `123456` or `12345678`.

**BACK** and **NEXT** turn the pages. A new page takes the firing unit from the last one. The pages stay with you for the mission.

## Minimized notebook

When the notebook is closed, the open fire mission's solutions stay in a corner of the screen. **Hide FDC Notebook** (self interaction → Equipment) or ++ctrl+end++ hides them.

## Keybinds

Under **Options → Controls → Configure Addons → Shot, Over!** (CBA keybinds):

| Keybind | Default | Does |
| --- | --- | --- |
| **Open FDC Notebook** | ++end++ | Opens or closes the notebook (needs the FDC backpack) |
| **Close FDC Notebook** | ++ctrl+end++ | Closes the notebook, or hides the minimized notebook |

!!! note "Accuracy"
    The solutions are computed without air friction. If the shells are slowed down in flight (for example with ACE's artillery air resistance on), rounds land short; adjust on where they land.
