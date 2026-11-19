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

The gunner traverses and elevates the gun as usual while looking through the optics. There, ACE shows where the gun points: **AZ** (direction) and **EL** (elevation), both in mils, the same units as the FDC notebook. Lay the gun until both match the fire mission.

Crew members outside the gun can check the elevation with **Elevate Turret** at the elevation handwheel: it shows the elevation in mils.

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
