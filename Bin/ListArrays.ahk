/*
	Copyright (C) 2018-2020 Lucas Jaramillo
	
	This file is part of Dice.

	Dice is free software: you can redistribute it and/or modify
	it under the terms of the GNU General Public License as published by
	the Free Software Foundation, either version 3 of the License, or
	(at your option) any later version.

	Dice is distributed in the hope that it will be useful,
	but WITHOUT ANY WARRANTY; without even the implied warranty of
	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
	GNU General Public License for more details.

	You should have received a copy of the GNU General Public License
	along with Dice. If not, see <https://www.gnu.org/licenses/>.
*/

; We put all of these arrays here because they contain over 200 items and make the main code too difficult to understand!

; We have to break all of this into parts since AutoHotkey yells at me since the array is "too large"
; Even though it is too large, you can still dynamically add to it and make it larger than the overflow point
; Kinda strange...hmmm
superP1 := {"3D Flying Objects (98)": "\Win98\3D Flying Objects.scr", "3D Maze": "\Win98\3D Maze.scr", "3D Pipes (98)": "\Win98\3D Pipes.scr"
, "3D Text (98)": "\Win98\3D Text.scr", "Baseball": "\Win98\Baseball.scr", "Blank Screen": "\Win98\Blank Screen.scr", "Curves and Colors": "\Win98\Curves and Colors.scr"
, "Dangerous Creatures": "\Win98\Dangerous Creatures.scr", "Flying Through Space": "\Win98\Flying Through Space.scr", "Flying Windows": "\Win98\Flying Windows.scr"
, "Inside your Computer": "\Win98\Inside your Computer.scr", "Jungle": "\Win98\Jungle.scr", "Leonardo da Vinci": "\Win98\Leonardo da Vinci.scr"
, "Mystery": "\Win98\Mystery.scr", "Mystify Your Mind": "\Win98\Mystify Your Mind.scr", "Nature": "\Win98\Nature.scr", "Science": "\Win98\Science.scr"
, "Space": "\Win98\Space.scr", "Sports": "\Win98\Sports.scr", "The 60's USA": "\Win98\The 60's USA.scr", "The Golden Era": "\Win98\The Golden Era.scr"
, "Travel": "\Win98\Travel.scr", "Underwater": "\Win98\Underwater.scr", "Windows 98": "\Win98\Windows 98.scr", "3D FlowerBox": "\WinXP\ssflwbox.scr"
, "3D Flying Objects (XP)": "\WinXP\ss3dfo.scr", "3D Pipes (XP)": "\WinXP\sspipes.scr", "3D Text (XP)": "\WinXP\sstext3d.scr", "Beziers": "\WinXP\ssbezier.scr"
, "Marquee": "\WinXP\ssmarque.scr", "My Pictures": "\WinXP\ssmypics.scr", "Windows XP": "\WinXP\logon.scr", "Aurora": "\WinVista\Aurora.scr"
, "Bubbles (Vista)": "\WinVista\Bubbles.scr", "Windows Logo": "\WinVista\logon.scr", "Mystify": "\WinVista\Mystify.scr", "Ribbons": "\WinVista\Ribbons.scr"
, "Windows Energy": "\WinVista\ssBranded.scr"}

superP2 := {"Abstractile": "\Linux\abstractile.scr", "Anemone": "\Linux\anemone.scr", "Anemotaxis": "\Linux\anemotaxis.scr", "Ant": "\Linux\ant.scr"
, "AntInspect": "\Linux\antinspect.scr", "AntMaze": "\Linux\antmaze.scr", "AntSpotlight": "\Linux\antspotlight.scr", "Apollonian": "\Linux\apollonian.scr"
, "Apple2": "\Linux\apple2.scr", "Atlantis": "\Linux\atlantis.scr", "Attraction": "\Linux\attraction.scr", "Atunnel": "\Linux\atunnel.scr"
, "Barcode": "\Linux\barcode.scr", "Blaster": "\Linux\blaster.scr", "BlinkBox": "\Linux\blinkbox.scr", "BlitSpin": "\Linux\blitspin.scr"
, "BlockTube": "\Linux\blocktube.scr", "Boing": "\Linux\boing.scr", "Bouboule": "\Linux\bouboule.scr", "BouncingCow": "\Linux\bouncingcow.scr"
, "Boxed": "\Linux\boxed.scr", "BoxFit": "\Linux\boxfit.scr", "Braid": "\Linux\braid.scr", "BSOD": "\Linux\bsod.scr", "Bubble3D": "\Linux\bubble3d.scr"
, "Bubbles (Linux)": "\Linux\bubbles.scr", "Bumps": "\Linux\bumps.scr", "Cage": "\Linux\cage.scr", "Carousel": "\Linux\carousel.scr", "CCurve": "\Linux\ccurve.scr"
, "Celtic": "\Linux\celtic.scr", "Circuit": "\Linux\circuit.scr", "CloudLife": "\Linux\cloudlife.scr", "CompanionCube": "\Linux\companion.scr"
, "Compass": "\Linux\compass.scr", "Coral": "\Linux\coral.scr", "Crackberg": "\Linux\crackberg.scr", "Critical": "\Linux\critical.scr"
, "Crystal": "\Linux\crystal.scr", "Cube21": "\Linux\cube21.scr", "Cubenetic": "\Linux\cubenetic.scr", "CubeStorm": "\Linux\cubestorm.scr"}

superP3 := {"CubicGrid": "\Linux\cubicgrid.scr", "CubicGridClock": "\Linux\cubicgridclock.scr", "CWaves": "\Linux\cwaves.scr", "Cynosure": "\Linux\cynosure.scr"
, "DangerBall": "\Linux\dangerball.scr", "DecayScreen": "\Linux\decayscreen.scr", "Deco": "\Linux\deco.scr", "Deluxe": "\Linux\deluxe.scr"
, "Demon": "\Linux\demon.scr", "Discrete": "\Linux\discrete.scr", "Distort": "\Linux\distort.scr", "DNALogo": "\Linux\dnalogo.scr"
, "Drift": "\Linux\drift.scr", "Endgame": "\Linux\endgame.scr", "Engine": "\Linux\engine.scr", "Epicycle": "\Linux\epicycle.scr"
, "Eruption": "\Linux\eruption.scr", "Euler2D": "\Linux\euler2d.scr", "Extrusion": "\Linux\extrusion.scr", "FadePlot": "\Linux\fadeplot.scr"
, "Fiberlamp": "\Linux\fiberlamp.scr", "Fireworkx": "\Linux\fireworkx.scr", "Flag": "\Linux\flag.scr", "Flame": "\Linux\flame.scr"
, "FlipFlop": "\Linux\flipflop.scr", "FlipScreen3D": "\Linux\flipscreen3d.scr", "FlipText": "\Linux\fliptext.scr", "Flow": "\Linux\flow.scr"
, "FluidBalls": "\Linux\fluidballs.scr", "Flurry": "\Linux\flurry.scr", "FlyingToasters": "\Linux\flyingtoasters.scr", "Forest": "\Linux\forest.scr"
, "FuzzyFlakes": "\Linux\fuzzyflakes.scr", "Galaxy": "\Linux\galaxy.scr", "Gears": "\Linux\gears.scr", "GFlux": "\Linux\gflux.scr"
, "GLBlur": "\Linux\glblur.scr", "GLCells": "\Linux\glcells.scr", "Gleidescope": "\Linux\gleidescope.scr", "GLForestFire": "\Linux\glforestfire.scr"}

superP4 := {"GLHanoi": "\Linux\glhanoi.scr", "GLKnots": "\Linux\glknots.scr", "GLMatrix": "\Linux\glmatrix.scr", "GLPlanet": "\Linux\glplanet.scr"
, "GLSchool": "\Linux\glschool.scr", "GLSlideshow": "\Linux\glslideshow.scr", "GLSnake": "\Linux\glsnake.scr", "GLText": "\Linux\gltext.scr"
, "Goop": "\Linux\goop.scr", "Grav": "\Linux\grav.scr", "Greynetic": "\Linux\greynetic.scr", "Halftone": "\Linux\halftone.scr", "Halo": "\Linux\halo.scr"
, "Helix": "\Linux\helix.scr", "Hexadrop": "\Linux\hexadrop.scr", "Hilbert": "\Linux\hilbert.scr", "Hopalong": "\Linux\hopalong.scr"
, "HyperBall": "\Linux\hyperball.scr", "HyperCube": "\Linux\hypercube.scr", "Hypertorus": "\Linux\hypertorus.scr", "Hypnowheel": "\Linux\hypnowheel.scr"
, "IFS": "\Linux\ifs.scr", "IMSMap": "\Linux\imsmap.scr", "Interaggregate": "\Linux\interaggregate.scr", "Interference": "\Linux\interference.scr"
, "Intermomentary": "\Linux\intermomentary.scr", "JigglyPuff": "\Linux\jigglypuff.scr", "Jigsaw": "\Linux\jigsaw.scr", "Juggle": "\Linux\juggle.scr"
, "Juggler3D": "\Linux\juggler3d.scr", "Julia": "\Linux\julia.scr", "Kaleidescope": "\Linux\kaleidescope.scr", "Kaleidocycle": "\Linux\kaleidocycle.scr"
, "Klein": "\Linux\klein.scr", "Kumppa": "\Linux\kumppa.scr", "Lament": "\Linux\lament.scr", "Laser": "\Linux\laser.scr", "Lavalite": "\Linux\lavalite.scr"
, "LCDScrub": "\Linux\lcdscrub.scr", "Lightning": "\Linux\lightning.scr", "Lisa": "\Linux\lisa.scr", "Lissie": "\Linux\lissie.scr", "LMorph": "\Linux\lmorph.scr"}

superP5 := {"Lockward": "\Linux\lockward.scr", "Loop": "\Linux\loop.scr", "m6502": "\Linux\m6502.scr", "Maze": "\Linux\maze.scr", "MemScroller": "\Linux\memscroller.scr"
, "Menger": "\Linux\menger.scr", "MetaBalls": "\Linux\metaballs.scr", "MirrorBlob": "\Linux\mirrorblob.scr", "Moebius": "\Linux\moebius.scr"
, "MoebiusGears": "\Linux\moebiusgears.scr", "Moire": "\Linux\moire.scr", "Moire2": "\Linux\moire2.scr", "Molecule": "\Linux\molecule.scr"
, "Morph3D": "\Linux\morph3d.scr", "Mountain": "\Linux\mountain.scr", "Munch": "\Linux\munch.scr", "NerveRot": "\Linux\nerverot.scr"
, "Noof": "\Linux\noof.scr", "NoseGuy": "\Linux\noseguy.scr", "Pacman": "\Linux\pacman.scr", "Pedal": "\Linux\pedal.scr", "Penetrate": "\Linux\penetrate.scr"
, "Penrose": "\Linux\penrose.scr", "Petri": "\Linux\petri.scr", "Phosphor": "\Linux\phosphor.scr", "Photopile": "\Linux\photopile.scr"
, "Piecewise": "\Linux\piecewise.scr", "Pinion": "\Linux\pinion.scr", "Pipes": "\Linux\pipes.scr", "Polyhedra": "\Linux\polyhedra.scr"
, "Polyominoes": "\Linux\polyominoes.scr", "Polytopes": "\Linux\polytopes.scr", "Pong": "\Linux\pong.scr", "PopSquares": "\Linux\popsquares.scr"
, "Providence": "\Linux\providence.scr", "Pulsar": "\Linux\pulsar.scr", "Pyro": "\Linux\pyro.scr", "Qix": "\Linux\qix.scr", "QuasiCrystal": "\Linux\quasicrystal.scr"
, "Queens": "\Linux\queens.scr", "Random": "\Linux\random.scr", "RDbomb": "\Linux\rd-bomb.scr", "Ripples": "\Linux\ripples.scr", "Rocks": "\Linux\rocks.scr"}

superP6 := {"Rorschach": "\Linux\rorschach.scr", "Rotor": "\Linux\rotor.scr", "RotZoomer": "\Linux\rotzoomer.scr", "Rubik": "\Linux\rubik.scr", "RubikBlocks": "\Linux\rubikblocks.scr"
, "SBalls": "\Linux\sballs.scr", "ShadeBobs": "\Linux\shadebobs.scr", "Sierpinski": "\Linux\sierpinski.scr", "Sierpinski3D": "\Linux\sierpinski3d.scr"
, "SkyTentacles": "\Linux\skytentacles.scr", "SlideScreen": "\Linux\slidescreen.scr", "Slip": "\Linux\slip.scr", "Sonar": "\Linux\sonar.scr"
, "SpeedMine": "\Linux\speedmine.scr", "Sphere": "\Linux\sphere.scr", "Spheremonics": "\Linux\spheremonics.scr", "Spiral": "\Linux\spiral.scr"
, "Spotlight": "\Linux\spotlight.scr", "Sproingies": "\Linux\sproingies.scr", "Squiral": "\Linux\squiral.scr", "Stairs": "\Linux\stairs.scr"
, "Starfish": "\Linux\starfish.scr", "StarWars": "\Linux\starwars.scr", "StonerView": "\Linux\stonerview.scr", "Strange": "\Linux\strange.scr"
, "Substrate": "\Linux\substrate.scr", "Superquadrics": "\Linux\superquadrics.scr", "Surfaces": "\Linux\surfaces.scr", "Swirl": "\Linux\swirl.scr"}

superP7 := {"T3D": "\Linux\t3d.scr", "Tangram": "\Linux\tangram.scr", "Thornbird": "\Linux\thornbird.scr", "TimeTunnel": "\Linux\timetunnel.scr", "TopBlock": "\Linux\topblock.scr"
, "Triangle": "\Linux\triangle.scr", "TronBit": "\Linux\tronbit.scr", "Truchet": "\Linux\truchet.scr", "Twang": "\Linux\twang.scr"
, "UnknownPleasures": "\Linux\unknownpleasures.scr", "Vermiculate": "\Linux\vermiculate.scr", "Vines": "\Linux\vines.scr", "Voronoi": "\Linux\voronoi.scr"
, "Wander": "\Linux\wander.scr", "WhirlWindWarp": "\Linux\whirlwindwarp.scr", "Whirlygig": "\Linux\whirlygig.scr", "Worm": "\Linux\worm.scr"
, "Wormhole": "\Linux\wormhole.scr", "XAnalogTV": "\Linux\xanalogtv.scr", "XFlame": "\Linux\xflame.scr", "XJack": "\Linux\xjack.scr"
, "XLyap": "\Linux\xlyap.scr", "XMatrix": "\Linux\xmatrix.scr", "XRaySwarm": "\Linux\xrayswarm.scr", "XSpirograph": "\Linux\xspirograph.scr"
, "Zoom": "\Linux\zoom.scr"}

; Contains every single possible screensaver, regardless of the OS version (will be used in calculations later on)
; Windows 7 and Windows 10 should be able to run all of these
super := {}
For x,y in superP1
	super[x] := y
For x,y in superP2
	super[x] := y
For x,y in superP3
	super[x] := y
For x,y in superP4
	super[x] := y
For x,y in superP5
	super[x] := y
For x,y in superP6
	super[x] := y
For x,y in superP7
	super[x] := y

; Contains names of screensavers unique to each OS
; We create these as associative arrays so we can use the HasKey method
; These are used in the initial INI file creation as well as when launching screensavers
scrnsvWin98 := {"3D Flying Objects (98)": "", "3D Maze": "", "3D Pipes (98)": "", "3D Text (98)": "", "Baseball": "", "Blank Screen": ""
			   , "Curves and Colors": "", "Dangerous Creatures": "", "Flying Through Space": "", "Flying Windows": ""
			   , "Inside your Computer": "", "Jungle": "", "Leonardo da Vinci": "", "Mystery": "", "Mystify Your Mind": ""
			   , "Nature": "", "Science": "", "Space": "", "Sports": "", "The 60's USA": "", "The Golden Era": ""
			   , "Travel": "", "Underwater": "", "Windows 98": ""}

scrnsvWinXP := {"Windows XP": "", "3D Flying Objects (XP)": "", "Beziers": "", "3D FlowerBox": "", "Marquee": "", "My Pictures": "", "3D Pipes (XP)": "", "3D Text (XP)": ""}

scrnsvWinVista := {"Aurora": "", "Bubbles (Vista)": "", "Windows Logo": "", "Mystify": "", "Ribbons": "", "Windows Energy": ""}

scrnsvLinuxP1 := {"Abstractile": "", "Anemone": "", "Anemotaxis": "", "Ant": "", "AntInspect": "", "AntMaze": "", "AntSpotlight": ""
			  , "Apollonian": "", "Apple2": "", "Atlantis": "", "Attraction": "", "Atunnel": "", "Barcode": "", "Blaster": ""
			  , "BlinkBox": "", "BlitSpin": "", "BlockTube": "", "Boing": "", "Bouboule": "", "BouncingCow": "", "Boxed": ""
			  , "BoxFit": "", "Braid": "", "BSOD": "", "Bubble3D": "", "Bubbles (Linux)": "", "Bumps": "", "Cage": "", "Carousel": ""
			  , "CCurve": "", "Celtic": "", "Circuit": "", "CloudLife": "", "CompanionCube": "", "Compass": "", "Coral": "", "Crackberg": ""
			  , "Critical": "", "Crystal": "", "Cube21": "", "Cubenetic": "", "CubeStorm": "", "CubicGrid": "", "CubicGridClock": ""
			  , "CWaves": "", "Cynosure": "", "DangerBall": "", "DecayScreen": "", "Deco": "", "Deluxe": "", "Demon": "", "Discrete": ""
			  , "Distort": "", "DNALogo": "", "Drift": "", "Endgame": "", "Engine": "", "Epicycle": "", "Eruption": "", "Euler2D": ""
			  , "Extrusion": "", "FadePlot": "", "Fiberlamp": "", "Fireworkx": "", "Flag": "", "Flame": "", "FlipFlop": ""}

scrnsvLinuxP2 := {"FlipScreen3D": "", "FlipText": "", "Flow": "", "FluidBalls": "", "Flurry": "", "FlyingToasters": "", "Forest": ""
			  , "FuzzyFlakes": "", "Galaxy": "", "Gears": "", "GFlux": "", "GLBlur": "", "GLCells": "", "Gleidescope": "", "GLForestFire": ""
			  , "GLHanoi": "", "GLKnots": "", "GLMatrix": "", "GLPlanet": "", "GLSchool": "", "GLSlideshow": "", "GLSnake": "", "GLText": ""
			  , "Goop": "", "Grav": "", "Greynetic": "", "Halftone": "", "Halo": "", "Helix": "", "Hexadrop": "", "Hilbert": ""
			  , "Hopalong": "", "HyperBall": "", "HyperCube": "", "Hypertorus": "", "Hypnowheel": "", "IFS": "", "IMSMap": ""
			  , "Interaggregate": "", "Interference": "", "Intermomentary": "", "JigglyPuff": "", "Jigsaw": "", "Juggle": ""
			  , "Juggler3D": "", "Julia": "", "Kaleidescope": "", "Kaleidocycle": "", "Klein": "", "Kumppa": "", "Lament": ""
			  , "Laser": "", "Lavalite": "", "LCDScrub": "", "Lightning": "", "Lisa": "", "Lissie": "", "LMorph": ""
			  , "Lockward": "", "Loop": "", "m6502": "", "Maze": "", "MemScroller": "", "Menger": "", "MetaBalls": ""}
			  
scrnsvLinuxP3 := {"MirrorBlob": "", "Moebius": "", "MoebiusGears": "", "Moire": "", "Moire2": "", "Molecule": "", "Morph3D": ""
			   , "Mountain": "", "Munch": "", "NerveRot": "", "Noof": "", "NoseGuy": "", "Pacman": "", "Pedal": "", "Penetrate": ""
			   , "Penrose": "", "Petri": "", "Phosphor": "", "Photopile": "", "Piecewise": "", "Pinion": "", "Pipes": "", "Polyhedra": ""
			   , "Polyominoes": "", "Polytopes": "", "Pong": "", "PopSquares": "", "Providence": "", "Pulsar": "", "Pyro": "", "Qix": ""
			   , "QuasiCrystal": "", "Queens": "", "Random": "", "RDbomb": "", "Ripples": "", "Rocks": "", "Rorschach": "", "Rotor": ""
			   , "RotZoomer": "", "Rubik": "", "RubikBlocks": "", "SBalls": "", "ShadeBobs": "", "Sierpinski": "", "Sierpinski3D": ""
			   , "SkyTentacles": "", "SlideScreen": "", "Slip": "", "Sonar": "", "SpeedMine": "", "Sphere": "", "Spheremonics": ""
			   , "Spiral": "", "Spotlight": "", "Sproingies": "", "Squiral": "", "Stairs": "", "Starfish": "", "StarWars": ""
			   , "StonerView": "", "Strange": "", "Substrate": "", "Superquadrics": "", "Surfaces": "", "Swirl": "", "T3D": ""}
			  
scrnsvLinuxP4 := {"Tangram": "", "Thornbird": "", "TimeTunnel": "", "TopBlock": "", "Triangle": "", "TronBit": "", "Truchet": ""
			   , "Twang": "", "UnknownPleasures": "", "Vermiculate": "", "Vines": "", "Voronoi": "", "Wander": "", "WhirlWindWarp": ""
			   , "Whirlygig": "", "Worm": "", "Wormhole": "", "XAnalogTV": "", "XFlame": "", "XJack": "", "XLyap": "", "XMatrix": ""
			   , "XRaySwarm": "", "XSpirograph": "", "Zoom": ""}

scrnsvLinux := {}
For x,y in scrnsvLinuxP1
	scrnsvLinux[x] := y
For x,y in scrnsvLinuxP2
	scrnsvLinux[x] := y
For x,y in scrnsvLinuxP3
	scrnsvLinux[x] := y
For x,y in scrnsvLinuxP4
	scrnsvLinux[x] := y