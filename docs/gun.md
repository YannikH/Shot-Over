# The M101 Howitzer

Shot, Over! adds the **M101 Howitzer (Shot, Over!)** from S.O.G. Prairie Fire, loaded and fired by hand. It holds one round at a time and has no artillery computer: the firing data comes from the [FDC notebook](notebook.md).

## The crew

- **Gunner**: sits on the gun, lays it on the direction and elevation from the notebook and fires.
- **Loaders**: carry shells from the crates to the gun, set the charge, open the breech, load and close it. Any number of players can work the gun; loading and firing work in multiplayer with any of them.

## Firing a round

All actions are in the ACE interaction menu (hold ++left-windows++) on the gun, at the part of the gun they belong to. They can be reached from 3 m.

1. **Set the charge** on a shell: interaction on the shell → **Interactions** → **M1 105mm HE Shell, Chg 1** → **Set Charge** → **Charge 1** to **Charge 5**. The action shows the shell and the charge it is set to; new shells have charge 1. See [Ammunition](ammunition.md).
2. **Carry the shell** with ACE's carry action. A hint tells you how to load it.
3. **Load**: with the breech open and empty, stand at the breech and use the interaction **Load Shell** there, or **right click** as a shortcut. The shell has to be within 1 m of the breech, and the gun within 5 m of you. If someone else loaded the gun in the meantime, your shell is put back at the breech.
4. **Close Breech**.
5. **Fire**: the gunner fires, or anyone at the breech pulls the lanyard with **Fire Howitzer**. Fire Howitzer needs a gunner on the gun.
6. **Open Breech** after the shot: the empty casing is thrown out (it disappears after 5 minutes) and the gun is ready for the next round.

After every shot the gun is empty: every round is loaded by hand.

!!! warning "Stand clear of the breech"
    The recoil throws anyone standing right behind the breech backwards.

## Laying the gun

The gunner traverses and elevates the gun as usual while looking through the optics. There, ACE shows where the gun points: **AZ** (direction) and **EL** (elevation), both in mils, the same units as the FDC notebook. Lay the gun until both match the fire mission. The **Sights Only** M101 has no readout: there the gunner lays with the gun's sights only.

Crew members outside the gun can check the elevation with **Elevate Turret** at the elevation handwheel: it shows the elevation in mils.

### The gun's sights

The gunner can also lay the gun with its own sights, as on the real M101: the **panoramic telescope** for direction and the **quadrant** with its level bubble for elevation. Open them with the self-interaction (hold ++left-windows++ on the gun) **Look Through Sights**, or with ++num5++. Close them the same way (**Close Sights**); they also close when you leave the gun.

Laying is always two steps, as on the real gun: **set the dials** to the fire mission, then **lay the gun** with the usual controls until the sights show it is on.

!!! info "The dials never move the gun"
    The deflection dial turns only the telescope, the quadrant dial only the bubble's reference. The gun moves only with the mouse (traverse) and ++page-up++ / ++page-down++ (elevation).

| Key | Dial |
| --- | --- |
| ++num6++ / ++num4++ | Deflection up / down |
| ++num8++ / ++num2++ | Quadrant up / down |

A press turns a dial by 1 mil; hold the key to turn it faster. The keys can be changed in the CBA keybindings under **Shot, Over!**. The dials keep their settings for the next gunner.

!!! tip "Everything on the keypad"
    The gun's elevation is Arma's own control (default ++page-up++ / ++page-down++). Bind it to ++num9++ / ++num3++ as well, and the sights (++num5++), both dials and the elevation are all on the keypad.

**Direction**:

1. Set the deflection of the fire mission (right panel, tape at the bottom). The view swings away from the aiming stakes: the telescope looks the deflection to the right of the barrel, all the way round from 0 to 6400 mils.
2. Traverse the gun with the mouse until the aiming stakes are back on the vertical line, the near one in front of the far one. The deflection reading does not change while you traverse; telescope and gun turn together.

Raising the deflection therefore lays the gun further left.

**Elevation**:

1. Set the quadrant of the fire mission (left panel).
2. Elevate the gun with ++page-up++ / ++page-down++ until the bubble is centred and **LEVEL** shows; tap the key for the last mils. The bubble moves to **HIGH** when the barrel is too high and to **LOW** when it is too low.

### Aiming stakes

Deflection is measured from the aiming stakes, not from north. Put them out once, when the gun is in position:

1. Lay the gun on the direction it should cover, for example the azimuth the FDC orders, with ACE's **AZ** readout. On the Sights Only M101, point it roughly that way; the exact direction is recorded in step 3.
2. A crew member on foot uses the interaction on the gun (hold ++left-windows++) → **Emplace Aiming Stakes**. Two stakes go up 25 m and 50 m from the gun, where the telescope sees them at deflection **2800**, and the gun's deflection dial is set to 2800.
3. The direction the gun pointed is now its **azimuth of lay**. It shows in a hint and in the sights under the deflection (**AZ OF LAY**). Pass it to the FDC: it goes into the notebook, which then gives the deflection for every fire mission.

The stakes stay until someone uses the interaction **Recover Aiming Stakes** on the gun, or the gun is removed. If the gun is moved, recover the stakes and put them out again: the azimuth of lay changes with it.

## Charges and ranges

Every shell type uses the same charges. Ranges are for level ground, without air friction, as the notebook computes them:

| Charge | Muzzle velocity | Maximum range |
| --- | --- | --- |
| 1 | 86 m/s | about 750 m |
| 2 | 160 m/s | about 2.6 km |
| 3 | 240 m/s | about 5.9 km |
| 4 | 320 m/s | about 10.4 km |
| 5 | 400 m/s | about 16.3 km |

Each shot varies a little (up to 0.25 % of the muzzle velocity), so rounds fired with the same data do not all land on the same spot.
