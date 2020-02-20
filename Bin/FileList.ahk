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

	; We put all the FileInstalls here because it's quite a large amount (over 200 entries!)
	; We will NOT overwrite files as that will take a very long time!

	; WIN98
	FileInstall, 3D Flying Objects.scr, %workingDir%\Win98\3D Flying Objects.scr
	FileInstall, 3D Maze.scr, %workingDir%\Win98\3D Maze.scr
	FileInstall, 3D Pipes.scr, %workingDir%\Win98\3D Pipes.scr
	FileInstall, 3D Text.scr, %workingDir%\Win98\3D Text.scr
	FileInstall, Baseball.dll, %workingDir%\Win98\Baseball.dll
	FileInstall, Baseball.scr, %workingDir%\Win98\Baseball.scr
	FileInstall, Blank Screen.scr, %workingDir%\Win98\Blank Screen.scr
	FileInstall, Curves and Colors.scr, %workingDir%\Win98\Curves and Colors.scr
	FileInstall, Dangerous Creatures.dll, %workingDir%\Win98\Dangerous Creatures.dll
	FileInstall, Dangerous Creatures.scr, %workingDir%\Win98\Dangerous Creatures.scr
	FileInstall, Flying Through Space.scr, %workingDir%\Win98\Flying Through Space.scr
	FileInstall, Flying Windows.scr, %workingDir%\Win98\Flying Windows.scr
	FileInstall, Inside your Computer.dll, %workingDir%\Win98\Inside your Computer.dll
	FileInstall, Inside your Computer.scr, %workingDir%\Win98\Inside your Computer.scr
	FileInstall, Jungle.dll, %workingDir%\Win98\Jungle.dll
	FileInstall, Jungle.scr, %workingDir%\Win98\Jungle.scr
	FileInstall, Leonardo da Vinci.dll, %workingDir%\Win98\Leonardo da Vinci.dll
	FileInstall, Leonardo da Vinci.scr, %workingDir%\Win98\Leonardo da Vinci.scr
	FileInstall, Mystery.dll, %workingDir%\Win98\Mystery.dll
	FileInstall, Mystery.scr, %workingDir%\Win98\Mystery.scr
	FileInstall, Mystify Your Mind.scr, %workingDir%\Win98\Mystify Your Mind.scr
	FileInstall, Nature.dll, %workingDir%\Win98\Nature.dll
	FileInstall, Nature.scr, %workingDir%\Win98\Nature.scr
	FileInstall, Science.scr, %workingDir%\Win98\Science.scr
	FileInstall, Space.dll, %workingDir%\Win98\Space.dll
	FileInstall, Space.scr, %workingDir%\Win98\Space.scr
	FileInstall, Sports.dll, %workingDir%\Win98\Sports.dll
	FileInstall, Sports.scr, %workingDir%\Win98\Sports.scr
	FileInstall, The 60's USA.scr, %workingDir%\Win98\The 60's USA.scr
	FileInstall, The Golden Era.dll, %workingDir%\Win98\The Golden Era.dll
	FileInstall, The Golden Era.scr, %workingDir%\Win98\The Golden Era.scr
	FileInstall, Travel.dll, %workingDir%\Win98\Travel.dll
	FileInstall, Travel.scr, %workingDir%\Win98\Travel.scr
	FileInstall, Underwater.dll, %workingDir%\Win98\Underwater.dll
	FileInstall, Underwater.scr, %workingDir%\Win98\Underwater.scr
	FileInstall, WILDLB32.DLL, %workingDir%\Win98\WILDLB32.DLL
	FileInstall, Windows 98.scr, %workingDir%\Win98\Windows 98.scr
	FileInstall, WL32DLL.DLL, %workingDir%\Win98\WL32DLL.DLL

	; WINXP
	FileInstall, ss3dfo.scr, %workingDir%\WinXP\ss3dfo.scr
	FileInstall, ssbezier.scr, %workingDir%\WinXP\ssbezier.scr
	FileInstall, ssflwbox.scr, %workingDir%\WinXP\ssflwbox.scr
	FileInstall, ssmarque.scr, %workingDir%\WinXP\ssmarque.scr
	FileInstall, ssmypics.scr, %workingDir%\WinXP\ssmypics.scr
	FileInstall, sspipes.scr, %workingDir%\WinXP\sspipes.scr
	FileInstall, sstext3d.scr, %workingDir%\WinXP\sstext3d.scr

	; WINVISTA
	FileInstall, Aurora.scr, %workingDir%\WinVista\Aurora.scr
	FileInstall, BubblesV.scr, %workingDir%\WinVista\Bubbles.scr
	FileInstall, Mystify.scr, %workingDir%\WinVista\Mystify.scr
	FileInstall, Ribbons.scr, %workingDir%\WinVista\Ribbons.scr
	FileInstall, ssBranded.scr, %workingDir%\WinVista\ssBranded.scr

	; These screensavers are picky on which type of architecture they run on
	; If you try to run 32-bit on a 64-bit system (or vice-versa), it doesn't work
	If (A_Is64bitOS)
	{
		FileInstall, logonXP64.scr, %workingDir%\WinXP\logon.scr
		FileInstall, logonV64.scr, %workingDir%\WinVista\logon.scr
	}
	Else
	{
		FileInstall, logonXP32.scr, %workingDir%\WinXP\logon.scr
		FileInstall, logonV32.scr, %workingDir%\WinVista\logon.scr
	}

	; LINUX
	FileInstall, abstractile.scr, %workingDir%\Linux\abstractile.scr
	FileInstall, anemone.scr, %workingDir%\Linux\anemone.scr
	FileInstall, anemotaxis.scr, %workingDir%\Linux\anemotaxis.scr
	FileInstall, ant.scr, %workingDir%\Linux\ant.scr
	FileInstall, antinspect.scr, %workingDir%\Linux\antinspect.scr
	FileInstall, antmaze.scr, %workingDir%\Linux\antmaze.scr
	FileInstall, antspotlight.scr, %workingDir%\Linux\antspotlight.scr
	FileInstall, apollonian.scr, %workingDir%\Linux\apollonian.scr
	FileInstall, apple2.scr, %workingDir%\Linux\apple2.scr
	FileInstall, atlantis.scr, %workingDir%\Linux\atlantis.scr
	FileInstall, attraction.scr, %workingDir%\Linux\attraction.scr
	FileInstall, atunnel.scr, %workingDir%\Linux\atunnel.scr
	FileInstall, barcode.scr, %workingDir%\Linux\barcode.scr
	FileInstall, blaster.scr, %workingDir%\Linux\blaster.scr
	FileInstall, blinkbox.scr, %workingDir%\Linux\blinkbox.scr
	FileInstall, blitspin.scr, %workingDir%\Linux\blitspin.scr
	FileInstall, blocktube.scr, %workingDir%\Linux\blocktube.scr
	FileInstall, boing.scr, %workingDir%\Linux\boing.scr
	FileInstall, bouboule.scr, %workingDir%\Linux\bouboule.scr
	FileInstall, bouncingcow.scr, %workingDir%\Linux\bouncingcow.scr
	FileInstall, boxed.scr, %workingDir%\Linux\boxed.scr
	FileInstall, boxfit.scr, %workingDir%\Linux\boxfit.scr
	FileInstall, braid.scr, %workingDir%\Linux\braid.scr
	FileInstall, bsod.scr, %workingDir%\Linux\bsod.scr
	FileInstall, bubble3d.scr, %workingDir%\Linux\bubble3d.scr
	FileInstall, bubbles.scr, %workingDir%\Linux\bubbles.scr
	FileInstall, bumps.scr, %workingDir%\Linux\bumps.scr
	FileInstall, cage.scr, %workingDir%\Linux\cage.scr
	FileInstall, carousel.scr, %workingDir%\Linux\carousel.scr
	FileInstall, ccurve.scr, %workingDir%\Linux\ccurve.scr
	FileInstall, celtic.scr, %workingDir%\Linux\celtic.scr
	FileInstall, circuit.scr, %workingDir%\Linux\circuit.scr
	FileInstall, cloudlife.scr, %workingDir%\Linux\cloudlife.scr
	FileInstall, companion.scr, %workingDir%\Linux\companion.scr
	FileInstall, compass.scr, %workingDir%\Linux\compass.scr
	FileInstall, coral.scr, %workingDir%\Linux\coral.scr
	FileInstall, crackberg.scr, %workingDir%\Linux\crackberg.scr
	FileInstall, critical.scr, %workingDir%\Linux\critical.scr
	FileInstall, crystal.scr, %workingDir%\Linux\crystal.scr
	FileInstall, cube21.scr, %workingDir%\Linux\cube21.scr
	FileInstall, cubenetic.scr, %workingDir%\Linux\cubenetic.scr
	FileInstall, cubestorm.scr, %workingDir%\Linux\cubestorm.scr
	FileInstall, cubicgrid.scr, %workingDir%\Linux\cubicgrid.scr
	FileInstall, cubicgridclock.scr, %workingDir%\Linux\cubicgridclock.scr
	FileInstall, cwaves.scr, %workingDir%\Linux\cwaves.scr
	FileInstall, cynosure.scr, %workingDir%\Linux\cynosure.scr
	FileInstall, dangerball.scr, %workingDir%\Linux\dangerball.scr
	FileInstall, decayscreen.scr, %workingDir%\Linux\decayscreen.scr
	FileInstall, deco.scr, %workingDir%\Linux\deco.scr
	FileInstall, deluxe.scr, %workingDir%\Linux\deluxe.scr
	FileInstall, demon.scr, %workingDir%\Linux\demon.scr
	FileInstall, discrete.scr, %workingDir%\Linux\discrete.scr
	FileInstall, distort.scr, %workingDir%\Linux\distort.scr
	FileInstall, dnalogo.scr, %workingDir%\Linux\dnalogo.scr
	FileInstall, drift.scr, %workingDir%\Linux\drift.scr
	FileInstall, endgame.scr, %workingDir%\Linux\endgame.scr
	FileInstall, engine.scr, %workingDir%\Linux\engine.scr
	FileInstall, epicycle.scr, %workingDir%\Linux\epicycle.scr
	FileInstall, eruption.scr, %workingDir%\Linux\eruption.scr
	FileInstall, euler2d.scr, %workingDir%\Linux\euler2d.scr
	FileInstall, extrusion.scr, %workingDir%\Linux\extrusion.scr
	FileInstall, fadeplot.scr, %workingDir%\Linux\fadeplot.scr
	FileInstall, fiberlamp.scr, %workingDir%\Linux\fiberlamp.scr
	FileInstall, fireworkx.scr, %workingDir%\Linux\fireworkx.scr
	FileInstall, flag.scr, %workingDir%\Linux\flag.scr
	FileInstall, flame.scr, %workingDir%\Linux\flame.scr
	FileInstall, flipflop.scr, %workingDir%\Linux\flipflop.scr
	FileInstall, flipscreen3d.scr, %workingDir%\Linux\flipscreen3d.scr
	FileInstall, fliptext.scr, %workingDir%\Linux\fliptext.scr
	FileInstall, flow.scr, %workingDir%\Linux\flow.scr
	FileInstall, fluidballs.scr, %workingDir%\Linux\fluidballs.scr
	FileInstall, flurry.scr, %workingDir%\Linux\flurry.scr
	FileInstall, flyingtoasters.scr, %workingDir%\Linux\flyingtoasters.scr
	FileInstall, forest.scr, %workingDir%\Linux\forest.scr
	FileInstall, fuzzyflakes.scr, %workingDir%\Linux\fuzzyflakes.scr
	FileInstall, galaxy.scr, %workingDir%\Linux\galaxy.scr
	FileInstall, gears.scr, %workingDir%\Linux\gears.scr
	FileInstall, gflux.scr, %workingDir%\Linux\gflux.scr
	FileInstall, glblur.scr, %workingDir%\Linux\glblur.scr
	FileInstall, glcells.scr, %workingDir%\Linux\glcells.scr
	FileInstall, gleidescope.scr, %workingDir%\Linux\gleidescope.scr
	FileInstall, glforestfire.scr, %workingDir%\Linux\glforestfire.scr
	FileInstall, glhanoi.scr, %workingDir%\Linux\glhanoi.scr
	FileInstall, glknots.scr, %workingDir%\Linux\glknots.scr
	FileInstall, glmatrix.scr, %workingDir%\Linux\glmatrix.scr
	FileInstall, glplanet.scr, %workingDir%\Linux\glplanet.scr
	FileInstall, glschool.scr, %workingDir%\Linux\glschool.scr
	FileInstall, glslideshow.scr, %workingDir%\Linux\glslideshow.scr
	FileInstall, glsnake.scr, %workingDir%\Linux\glsnake.scr
	FileInstall, gltext.scr, %workingDir%\Linux\gltext.scr
	FileInstall, goop.scr, %workingDir%\Linux\goop.scr
	FileInstall, grav.scr, %workingDir%\Linux\grav.scr
	FileInstall, greynetic.scr, %workingDir%\Linux\greynetic.scr
	FileInstall, halftone.scr, %workingDir%\Linux\halftone.scr
	FileInstall, halo.scr, %workingDir%\Linux\halo.scr
	FileInstall, helix.scr, %workingDir%\Linux\helix.scr
	FileInstall, hexadrop.scr, %workingDir%\Linux\hexadrop.scr
	FileInstall, hilbert.scr, %workingDir%\Linux\hilbert.scr
	FileInstall, hopalong.scr, %workingDir%\Linux\hopalong.scr
	FileInstall, hyperball.scr, %workingDir%\Linux\hyperball.scr
	FileInstall, hypercube.scr, %workingDir%\Linux\hypercube.scr
	FileInstall, hypertorus.scr, %workingDir%\Linux\hypertorus.scr
	FileInstall, hypnowheel.scr, %workingDir%\Linux\hypnowheel.scr
	FileInstall, ifs.scr, %workingDir%\Linux\ifs.scr
	FileInstall, imsmap.scr, %workingDir%\Linux\imsmap.scr
	FileInstall, interaggregate.scr, %workingDir%\Linux\interaggregate.scr
	FileInstall, interference.scr, %workingDir%\Linux\interference.scr
	FileInstall, intermomentary.scr, %workingDir%\Linux\intermomentary.scr
	FileInstall, jigglypuff.scr, %workingDir%\Linux\jigglypuff.scr
	FileInstall, jigsaw.scr, %workingDir%\Linux\jigsaw.scr
	FileInstall, juggle.scr, %workingDir%\Linux\juggle.scr
	FileInstall, juggler3d.scr, %workingDir%\Linux\juggler3d.scr
	FileInstall, julia.scr, %workingDir%\Linux\julia.scr
	FileInstall, kaleidescope.scr, %workingDir%\Linux\kaleidescope.scr
	FileInstall, kaleidocycle.scr, %workingDir%\Linux\kaleidocycle.scr
	FileInstall, klein.scr, %workingDir%\Linux\klein.scr
	FileInstall, kumppa.scr, %workingDir%\Linux\kumppa.scr
	FileInstall, lament.scr, %workingDir%\Linux\lament.scr
	FileInstall, laser.scr, %workingDir%\Linux\laser.scr
	FileInstall, lavalite.scr, %workingDir%\Linux\lavalite.scr
	FileInstall, lcdscrub.scr, %workingDir%\Linux\lcdscrub.scr
	FileInstall, lightning.scr, %workingDir%\Linux\lightning.scr
	FileInstall, lisa.scr, %workingDir%\Linux\lisa.scr
	FileInstall, lissie.scr, %workingDir%\Linux\lissie.scr
	FileInstall, lmorph.scr, %workingDir%\Linux\lmorph.scr
	FileInstall, lockward.scr, %workingDir%\Linux\lockward.scr
	FileInstall, loop.scr, %workingDir%\Linux\loop.scr
	FileInstall, m6502.scr, %workingDir%\Linux\m6502.scr
	FileInstall, maze.scr, %workingDir%\Linux\maze.scr
	FileInstall, memscroller.scr, %workingDir%\Linux\memscroller.scr
	FileInstall, menger.scr, %workingDir%\Linux\menger.scr
	FileInstall, metaballs.scr, %workingDir%\Linux\metaballs.scr
	FileInstall, mirrorblob.scr, %workingDir%\Linux\mirrorblob.scr
	FileInstall, moebius.scr, %workingDir%\Linux\moebius.scr
	FileInstall, moebiusgears.scr, %workingDir%\Linux\moebiusgears.scr
	FileInstall, moire.scr, %workingDir%\Linux\moire.scr
	FileInstall, moire2.scr, %workingDir%\Linux\moire2.scr
	FileInstall, molecule.scr, %workingDir%\Linux\molecule.scr
	FileInstall, morph3d.scr, %workingDir%\Linux\morph3d.scr
	FileInstall, mountain.scr, %workingDir%\Linux\mountain.scr
	FileInstall, munch.scr, %workingDir%\Linux\munch.scr
	FileInstall, nerverot.scr, %workingDir%\Linux\nerverot.scr
	FileInstall, noof.scr, %workingDir%\Linux\noof.scr
	FileInstall, noseguy.scr, %workingDir%\Linux\noseguy.scr
	FileInstall, pacman.scr, %workingDir%\Linux\pacman.scr
	FileInstall, pedal.scr, %workingDir%\Linux\pedal.scr
	FileInstall, penetrate.scr, %workingDir%\Linux\penetrate.scr
	FileInstall, penrose.scr, %workingDir%\Linux\penrose.scr
	FileInstall, petri.scr, %workingDir%\Linux\petri.scr
	FileInstall, phosphor.scr, %workingDir%\Linux\phosphor.scr
	FileInstall, photopile.scr, %workingDir%\Linux\photopile.scr
	FileInstall, piecewise.scr, %workingDir%\Linux\piecewise.scr
	FileInstall, pinion.scr, %workingDir%\Linux\pinion.scr
	FileInstall, pipes.scr, %workingDir%\Linux\pipes.scr
	FileInstall, polyhedra.scr, %workingDir%\Linux\polyhedra.scr
	FileInstall, polyominoes.scr, %workingDir%\Linux\polyominoes.scr
	FileInstall, polytopes.scr, %workingDir%\Linux\polytopes.scr
	FileInstall, pong.scr, %workingDir%\Linux\pong.scr
	FileInstall, popsquares.scr, %workingDir%\Linux\popsquares.scr
	FileInstall, providence.scr, %workingDir%\Linux\providence.scr
	FileInstall, pulsar.scr, %workingDir%\Linux\pulsar.scr
	FileInstall, pyro.scr, %workingDir%\Linux\pyro.scr
	FileInstall, qix.scr, %workingDir%\Linux\qix.scr
	FileInstall, quasicrystal.scr, %workingDir%\Linux\quasicrystal.scr
	FileInstall, queens.scr, %workingDir%\Linux\queens.scr
	FileInstall, random.scr, %workingDir%\Linux\random.scr
	FileInstall, rd-bomb.scr, %workingDir%\Linux\rd-bomb.scr
	FileInstall, ripples.scr, %workingDir%\Linux\ripples.scr
	FileInstall, rocks.scr, %workingDir%\Linux\rocks.scr
	FileInstall, rorschach.scr, %workingDir%\Linux\rorschach.scr
	FileInstall, rotor.scr, %workingDir%\Linux\rotor.scr
	FileInstall, rotzoomer.scr, %workingDir%\Linux\rotzoomer.scr
	FileInstall, rubik.scr, %workingDir%\Linux\rubik.scr
	FileInstall, rubikblocks.scr, %workingDir%\Linux\rubikblocks.scr
	FileInstall, sballs.scr, %workingDir%\Linux\sballs.scr
	FileInstall, shadebobs.scr, %workingDir%\Linux\shadebobs.scr
	FileInstall, sierpinski.scr, %workingDir%\Linux\sierpinski.scr
	FileInstall, sierpinski3d.scr, %workingDir%\Linux\sierpinski3d.scr
	FileInstall, skytentacles.scr, %workingDir%\Linux\skytentacles.scr
	FileInstall, slidescreen.scr, %workingDir%\Linux\slidescreen.scr
	FileInstall, slip.scr, %workingDir%\Linux\slip.scr
	FileInstall, sonar.scr, %workingDir%\Linux\sonar.scr
	FileInstall, speedmine.scr, %workingDir%\Linux\speedmine.scr
	FileInstall, sphere.scr, %workingDir%\Linux\sphere.scr
	FileInstall, spheremonics.scr, %workingDir%\Linux\spheremonics.scr
	FileInstall, spiral.scr, %workingDir%\Linux\spiral.scr
	FileInstall, spotlight.scr, %workingDir%\Linux\spotlight.scr
	FileInstall, sproingies.scr, %workingDir%\Linux\sproingies.scr
	FileInstall, squiral.scr, %workingDir%\Linux\squiral.scr
	FileInstall, stairs.scr, %workingDir%\Linux\stairs.scr
	FileInstall, starfish.scr, %workingDir%\Linux\starfish.scr
	FileInstall, starwars.scr, %workingDir%\Linux\starwars.scr
	FileInstall, starwars.txt, %workingDir%\Linux\starwars.txt
	FileInstall, stonerview.scr, %workingDir%\Linux\stonerview.scr
	FileInstall, strange.scr, %workingDir%\Linux\strange.scr
	FileInstall, substrate.scr, %workingDir%\Linux\substrate.scr
	FileInstall, superquadrics.scr, %workingDir%\Linux\superquadrics.scr
	FileInstall, surfaces.scr, %workingDir%\Linux\surfaces.scr
	FileInstall, swirl.scr, %workingDir%\Linux\swirl.scr
	FileInstall, t3d.scr, %workingDir%\Linux\t3d.scr
	FileInstall, tangram.scr, %workingDir%\Linux\tangram.scr
	FileInstall, thornbird.scr, %workingDir%\Linux\thornbird.scr
	FileInstall, timetunnel.scr, %workingDir%\Linux\timetunnel.scr
	FileInstall, topblock.scr, %workingDir%\Linux\topblock.scr
	FileInstall, triangle.scr, %workingDir%\Linux\triangle.scr
	FileInstall, tronbit.scr, %workingDir%\Linux\tronbit.scr
	FileInstall, truchet.scr, %workingDir%\Linux\truchet.scr
	FileInstall, twang.scr, %workingDir%\Linux\twang.scr
	FileInstall, unknownpleasures.scr, %workingDir%\Linux\unknownpleasures.scr
	FileInstall, vermiculate.scr, %workingDir%\Linux\vermiculate.scr
	FileInstall, vines.scr, %workingDir%\Linux\vines.scr
	FileInstall, voronoi.scr, %workingDir%\Linux\voronoi.scr
	FileInstall, wander.scr, %workingDir%\Linux\wander.scr
	FileInstall, whirlwindwarp.scr, %workingDir%\Linux\whirlwindwarp.scr
	FileInstall, whirlygig.scr, %workingDir%\Linux\whirlygig.scr
	FileInstall, worm.scr, %workingDir%\Linux\worm.scr
	FileInstall, wormhole.scr, %workingDir%\Linux\wormhole.scr
	FileInstall, xanalogtv.scr, %workingDir%\Linux\xanalogtv.scr
	FileInstall, xflame.scr, %workingDir%\Linux\xflame.scr
	FileInstall, xjack.scr, %workingDir%\Linux\xjack.scr
	FileInstall, xlyap.scr, %workingDir%\Linux\xlyap.scr
	FileInstall, xmatrix.scr, %workingDir%\Linux\xmatrix.scr
	FileInstall, xrayswarm.scr, %workingDir%\Linux\xrayswarm.scr
	FileInstall, xscreensaver-text.exe, %workingDir%\Linux\xscreensaver-text.exe
	FileInstall, xspirograph.scr, %workingDir%\Linux\xspirograph.scr
	FileInstall, zoom.scr, %workingDir%\Linux\zoom.scr

	FileInstall, DiceHiddenSettings.exe, %workingDir%\DiceHiddenSettings.exe
	FileInstall, COPYING, %workingDir%\COPYING
	FileInstall, LICENSE-mit-x11.txt, %workingDir%\LICENSE-mit-x11.txt
	FileCopy, %A_ScriptFullPath%, %A_AppData%\Dice, 0