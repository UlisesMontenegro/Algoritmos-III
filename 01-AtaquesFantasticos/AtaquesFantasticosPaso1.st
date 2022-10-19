!classDefinition: #Arthas category: 'AtaquesFantasticosPaso1'!
DenotativeObject subclass: #Arthas
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AtaquesFantasticosPaso1'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Arthas class' category: 'AtaquesFantasticosPaso1'!
Arthas class
	instanceVariableNames: 'objetivo arma enemigos estrategia'!

!Arthas class methodsFor: 'as yet unclassified' stamp: 'UM 9/6/2022 18:31:16'!
atacar
	
	estrategia = 'focalizarEnElMasSano' ifTrue: [self focalizarEnElMasSano].
	estrategia = 'focalizarEnElMasHerido' ifTrue: [self focalizarEnElMasHerido].
	enemigos notEmpty ifTrue: [self atacarA: objetivo].! !

!Arthas class methodsFor: 'as yet unclassified' stamp: 'UM 9/4/2022 02:36:20'!
atacarA: unCombatiente

	arma = 'Puños' ifTrue: [unCombatiente recibioUnaPiña].
	arma = 'Hacha' ifTrue: [unCombatiente recibioUnHachazo].
	arma = 'Espada' ifTrue: [unCombatiente recibioUnEspadazo].! !

!Arthas class methodsFor: 'as yet unclassified' stamp: 'UM 9/6/2022 18:17:01'!
enemigos: anArray 
	enemigos := anArray.
	anArray isEmpty ifTrue: [objetivo := nil] ifFalse: [objetivo := anArray anyOne].! !

!Arthas class methodsFor: 'as yet unclassified' stamp: 'UM 9/6/2022 18:33:05'!
focalizarEnElMasHerido

	estrategia := 'focalizarEnElMasHerido'.
	Olgra puntosDeVida = Mankrik puntosDeVida ifTrue: [objetivo := enemigos anyOne].
	Olgra puntosDeVida < Mankrik puntosDeVida ifTrue: [objetivo := Olgra].
	Olgra puntosDeVida > Mankrik puntosDeVida ifTrue: [objetivo := Mankrik].! !

!Arthas class methodsFor: 'as yet unclassified' stamp: 'UM 9/6/2022 18:32:43'!
focalizarEnElMasSano

	estrategia := 'focalizarEnElMasSano'.
	Olgra puntosDeVida = Mankrik puntosDeVida ifTrue: [objetivo := enemigos anyOne].
	Olgra puntosDeVida < Mankrik puntosDeVida ifTrue: [objetivo := Mankrik].
	Olgra puntosDeVida > Mankrik puntosDeVida ifTrue: [objetivo := Olgra].	! !

!Arthas class methodsFor: 'as yet unclassified' stamp: 'UM 9/6/2022 18:09:54'!
noTenesEnemigos

	enemigos := {}.
	objetivo := nil.! !

!Arthas class methodsFor: 'as yet unclassified' stamp: 'UM 9/4/2022 02:36:16'!
parateDeManos

	arma := 'Puños'.! !

!Arthas class methodsFor: 'as yet unclassified' stamp: 'UM 9/6/2022 18:34:31'!
sinEstrategia

	estrategia := nil.! !

!Arthas class methodsFor: 'as yet unclassified' stamp: 'UM 9/4/2022 02:30:42'!
usarEspada
	arma := 'Espada'.! !

!Arthas class methodsFor: 'as yet unclassified' stamp: 'UM 9/4/2022 02:02:26'!
usarHacha
	arma := 'Hacha'.! !


!Arthas class methodsFor: '--** private fileout/in **--' stamp: 'UM 9/6/2022 18:35:39'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	objetivo := nil.
	arma := 'Hacha'.
	enemigos := #().
	estrategia := nil.! !


!classDefinition: #CombatientesTest category: 'AtaquesFantasticosPaso1'!
DenotativeObject subclass: #CombatientesTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AtaquesFantasticosPaso1'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CombatientesTest class' category: 'AtaquesFantasticosPaso1'!
CombatientesTest class
	instanceVariableNames: ''!

!CombatientesTest class methodsFor: 'para completar' stamp: 'UM 9/4/2022 00:26:50'!
combatienteHumanoArthas
	^Arthas.! !

!CombatientesTest class methodsFor: 'para completar' stamp: 'UM 9/4/2022 02:52:51'!
combatienteOrcoMankrik
	^Mankrik ! !

!CombatientesTest class methodsFor: 'para completar' stamp: 'UM 9/4/2022 00:28:34'!
combatienteOrcoOlgra
	^Olgra! !

!CombatientesTest class methodsFor: 'para completar' stamp: 'UM 9/6/2022 18:34:13'!
comenzarUnNuevoCombate
	self combatienteOrcoOlgra resucita.
	self combatienteOrcoOlgra sinArmadura.
	self combatienteOrcoMankrik resucita.
	self combatienteOrcoMankrik sinArmadura.
	self combatienteHumanoArthas parateDeManos.
	self combatienteHumanoArthas noTenesEnemigos.
	self combatienteHumanoArthas sinEstrategia.! !


!CombatientesTest class methodsFor: 'combatientes tests' stamp: 'SF 8/27/2022 05:58:49'!
test01UnCombatientePuedeAtacarAOtro
	
	self comenzarUnNuevoCombate.
	self combatienteHumanoArthas atacarA: self combatienteOrcoOlgra.
	
	Assert that: self combatienteOrcoOlgra puntosDeVida isEqualTo: 18.! !

!CombatientesTest class methodsFor: 'combatientes tests' stamp: 'SF 8/27/2022 06:06:50'!
test02MultiplesAtaquesVanBajandoMasVida

	self comenzarUnNuevoCombate.
	self combatienteHumanoArthas atacarA: self combatienteOrcoOlgra.
	self combatienteHumanoArthas atacarA: self combatienteOrcoOlgra.
	
	Assert that: self combatienteOrcoOlgra puntosDeVida isEqualTo: 16.! !

!CombatientesTest class methodsFor: 'combatientes tests' stamp: 'SF 8/27/2022 06:06:42'!
test03UnHachaHace10DeDaño

	self comenzarUnNuevoCombate.
	self combatienteHumanoArthas usarHacha.
	self combatienteHumanoArthas atacarA: self combatienteOrcoOlgra.
	
	Assert that: self combatienteOrcoOlgra puntosDeVida isEqualTo: 10.! !

!CombatientesTest class methodsFor: 'combatientes tests' stamp: 'SF 8/27/2022 06:06:55'!
test04UnEspadaHace8DeDaño

	self comenzarUnNuevoCombate.
	self combatienteHumanoArthas usarEspada.
	self combatienteHumanoArthas atacarA: self combatienteOrcoOlgra.
	
	Assert that: self combatienteOrcoOlgra puntosDeVida isEqualTo: 12.! !

!CombatientesTest class methodsFor: 'combatientes tests' stamp: 'SF 8/27/2022 06:07:03'!
test05UnaArmaduraDeCueroAbsorbe2DeDaño

	self comenzarUnNuevoCombate.
	self combatienteHumanoArthas usarEspada.
	self combatienteOrcoOlgra usarArmaduraDeCuero.
	
	self combatienteHumanoArthas atacarA: self combatienteOrcoOlgra.
	
	Assert that: self combatienteOrcoOlgra puntosDeVida isEqualTo: 14.! !

!CombatientesTest class methodsFor: 'combatientes tests' stamp: 'SF 8/27/2022 06:07:10'!
test06UnaArmaduraDeMetalAbsorbe6DeDaño

	self comenzarUnNuevoCombate.
	self combatienteHumanoArthas usarEspada.
	self combatienteOrcoOlgra usarArmaduraDeMetal.
	
	self combatienteHumanoArthas atacarA: self combatienteOrcoOlgra.
	
	Assert that: self combatienteOrcoOlgra puntosDeVida isEqualTo: 18.! !

!CombatientesTest class methodsFor: 'combatientes tests' stamp: 'SF 8/27/2022 06:07:18'!
test07UnaArmaduraReduceElDañoInfligidoACero

	self comenzarUnNuevoCombate.
	self combatienteOrcoOlgra usarArmaduraDeMetal.
	
	self combatienteHumanoArthas atacarA: self combatienteOrcoOlgra.
	
	Assert that: self combatienteOrcoOlgra puntosDeVida isEqualTo: 20.! !


!CombatientesTest class methodsFor: 'atacar tests' stamp: 'JMB 8/27/2022 13:54:53'!
test08CuandoUnCombatienteNoTieneEnemigosNoAtacaANadie
	
	self comenzarUnNuevoCombate.
	
	self combatienteHumanoArthas atacar.
	
	Assert that: self combatienteOrcoOlgra puntosDeVida isEqualTo: 20.
	Assert that: self combatienteOrcoMankrik puntosDeVida isEqualTo: 20.
	
	! !

!CombatientesTest class methodsFor: 'atacar tests' stamp: 'SF 8/27/2022 06:07:34'!
test09CuandoUnCombatienteTieneEnemigosAtacaAUno
	| enemigo1Herido enemigo2Herido |
	self comenzarUnNuevoCombate.
	self combatienteHumanoArthas enemigos: {self combatienteOrcoOlgra . self combatienteOrcoMankrik .}.
	
	self combatienteHumanoArthas atacar.
	
	enemigo1Herido := self combatienteOrcoOlgra puntosDeVida < 20 and: [self combatienteOrcoMankrik puntosDeVida = 20].
	enemigo2Herido := self combatienteOrcoMankrik puntosDeVida < 20 and: [self combatienteOrcoOlgra puntosDeVida = 20].
	Assert isTrue: (enemigo1Herido or: [enemigo2Herido]).! !

!CombatientesTest class methodsFor: 'atacar tests' stamp: 'JMB 8/27/2022 13:55:22'!
test10UnCombatientePuedeTenerComoEstrategiaAtacarAlMasHerido
	
	self comenzarUnNuevoCombate.
	self combatienteHumanoArthas enemigos: {self combatienteOrcoOlgra. self combatienteOrcoMankrik.}.
	self combatienteHumanoArthas atacarA: self combatienteOrcoOlgra.
	
	self combatienteHumanoArthas focalizarEnElMasHerido.
	self combatienteHumanoArthas atacar.

	Assert that: self combatienteOrcoOlgra puntosDeVida isEqualTo: 16.
	! !

!CombatientesTest class methodsFor: 'atacar tests' stamp: 'JMB 8/27/2022 13:56:08'!
test11UnCombatientePuedeTenerComoEstrategiaAtacarAlMasSano
	
	self comenzarUnNuevoCombate.
	
	self combatienteHumanoArthas usarEspada .
	self combatienteHumanoArthas enemigos: {self combatienteOrcoOlgra. self combatienteOrcoMankrik.}.
	self combatienteHumanoArthas atacarA: self combatienteOrcoMankrik.
	
	self combatienteHumanoArthas focalizarEnElMasSano.
	self combatienteHumanoArthas atacar.
	
	Assert that: self combatienteOrcoOlgra puntosDeVida isEqualTo: 12.! !

!CombatientesTest class methodsFor: 'atacar tests' stamp: 'UM 9/6/2022 18:25:55'!
test12ElEnemigoFocalizadoMasSanoCambiaDinamicamente

	self comenzarUnNuevoCombate.

	self combatienteHumanoArthas enemigos: {self combatienteOrcoOlgra. self combatienteOrcoMankrik.}.
	self combatienteHumanoArthas atacarA: self combatienteOrcoMankrik.

	self combatienteHumanoArthas usarEspada.
	self combatienteHumanoArthas focalizarEnElMasSano.
	self combatienteHumanoArthas atacar. 
	self combatienteHumanoArthas atacar.

	Assert that: self combatienteOrcoOlgra puntosDeVida isEqualTo: 12.
	Assert that: self combatienteOrcoMankrik puntosDeVida isEqualTo: 10.! !

!CombatientesTest class methodsFor: 'atacar tests' stamp: 'UM 9/6/2022 17:43:57'!
test13ElEnemigoFocalizadoMasHeridoCambiaDinamicamente

	self comenzarUnNuevoCombate.

	self combatienteHumanoArthas enemigos: {self combatienteOrcoOlgra. self combatienteOrcoMankrik.}.
	self combatienteHumanoArthas atacarA: self combatienteOrcoMankrik.

	self combatienteHumanoArthas usarEspada.
	self combatienteHumanoArthas focalizarEnElMasHerido.
	self combatienteHumanoArthas atacar.

	self combatienteHumanoArthas atacarA: self combatienteOrcoOlgra.
	self combatienteHumanoArthas atacarA: self combatienteOrcoOlgra.

	self combatienteHumanoArthas atacar.

	Assert that: self combatienteOrcoOlgra puntosDeVida isEqualTo: -4.
	Assert that: self combatienteOrcoMankrik puntosDeVida isEqualTo: 10.! !


!classDefinition: #Mankrik category: 'AtaquesFantasticosPaso1'!
DenotativeObject subclass: #Mankrik
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AtaquesFantasticosPaso1'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Mankrik class' category: 'AtaquesFantasticosPaso1'!
Mankrik class
	instanceVariableNames: 'puntosDeVida armadura'!

!Mankrik class methodsFor: 'as yet unclassified' stamp: 'UM 9/4/2022 02:49:43'!
puntosDeVida
	^puntosDeVida.! !

!Mankrik class methodsFor: 'as yet unclassified' stamp: 'UM 9/4/2022 02:50:10'!
recibioUnEspadazo
	armadura = 'Ninguna' ifTrue: [puntosDeVida := puntosDeVida - 8].
	armadura = 'Cuero' ifTrue: [puntosDeVida := puntosDeVida - 6].
	armadura = 'Metal' ifTrue: [puntosDeVida := puntosDeVida - 2].	! !

!Mankrik class methodsFor: 'as yet unclassified' stamp: 'UM 9/4/2022 02:50:36'!
recibioUnHachazo
	armadura = 'Ninguna' ifTrue: [puntosDeVida := puntosDeVida - 10].
	armadura = 'Cuero' ifTrue: [puntosDeVida := puntosDeVida - 8].
	armadura = 'Metal' ifTrue: [puntosDeVida := puntosDeVida - 4].! !

!Mankrik class methodsFor: 'as yet unclassified' stamp: 'UM 9/4/2022 02:50:48'!
recibioUnaPiña
	armadura = 'Ninguna' ifTrue: [puntosDeVida := puntosDeVida - 2].
	armadura = 'Cuero' ifTrue: [puntosDeVida := puntosDeVida].
	armadura = 'Metal' ifTrue: [puntosDeVida := puntosDeVida].! !

!Mankrik class methodsFor: 'as yet unclassified' stamp: 'UM 9/4/2022 02:50:59'!
resucita

	puntosDeVida := 20.! !

!Mankrik class methodsFor: 'as yet unclassified' stamp: 'UM 9/4/2022 02:51:09'!
sinArmadura

	armadura := 'Ninguna'.! !

!Mankrik class methodsFor: 'as yet unclassified' stamp: 'UM 9/4/2022 02:51:18'!
usarArmaduraDeCuero
	armadura := 'Cuero'.! !

!Mankrik class methodsFor: 'as yet unclassified' stamp: 'UM 9/4/2022 02:51:27'!
usarArmaduraDeMetal
	armadura := 'Metal'.! !


!Mankrik class methodsFor: '--** private fileout/in **--' stamp: 'UM 9/6/2022 18:35:39'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	puntosDeVida := 20.
	armadura := 'Ninguna'.! !


!classDefinition: #Olgra category: 'AtaquesFantasticosPaso1'!
DenotativeObject subclass: #Olgra
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AtaquesFantasticosPaso1'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Olgra class' category: 'AtaquesFantasticosPaso1'!
Olgra class
	instanceVariableNames: 'puntosDeVida armadura'!

!Olgra class methodsFor: 'as yet unclassified' stamp: 'UM 9/4/2022 00:52:07'!
puntosDeVida
	^puntosDeVida.! !

!Olgra class methodsFor: 'as yet unclassified' stamp: 'UM 9/4/2022 02:46:43'!
recibioUnEspadazo
	armadura = 'Ninguna' ifTrue: [puntosDeVida := puntosDeVida - 8].
	armadura = 'Cuero' ifTrue: [puntosDeVida := puntosDeVida - 6].
	armadura = 'Metal' ifTrue: [puntosDeVida := puntosDeVida - 2].	! !

!Olgra class methodsFor: 'as yet unclassified' stamp: 'UM 9/4/2022 02:47:02'!
recibioUnHachazo
	armadura = 'Ninguna' ifTrue: [puntosDeVida := puntosDeVida - 10].
	armadura = 'Cuero' ifTrue: [puntosDeVida := puntosDeVida - 8].
	armadura = 'Metal' ifTrue: [puntosDeVida := puntosDeVida - 4].! !

!Olgra class methodsFor: 'as yet unclassified' stamp: 'UM 9/4/2022 02:47:12'!
recibioUnaPiña
	armadura = 'Ninguna' ifTrue: [puntosDeVida := puntosDeVida - 2].
	armadura = 'Cuero' ifTrue: [puntosDeVida := puntosDeVida].
	armadura = 'Metal' ifTrue: [puntosDeVida := puntosDeVida].! !

!Olgra class methodsFor: 'as yet unclassified' stamp: 'UM 9/4/2022 00:56:59'!
resucita

	puntosDeVida := 20.! !

!Olgra class methodsFor: 'as yet unclassified' stamp: 'UM 9/4/2022 02:43:21'!
sinArmadura

	armadura := 'Ninguna'.! !

!Olgra class methodsFor: 'as yet unclassified' stamp: 'UM 9/4/2022 02:38:21'!
usarArmaduraDeCuero
	armadura := 'Cuero'.! !

!Olgra class methodsFor: 'as yet unclassified' stamp: 'UM 9/4/2022 02:44:44'!
usarArmaduraDeMetal
	armadura := 'Metal'.! !


!Olgra class methodsFor: '--** private fileout/in **--' stamp: 'UM 9/6/2022 18:35:39'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	puntosDeVida := 10.
	armadura := 'Ninguna'.! !

Arthas initializeAfterFileIn!
Mankrik initializeAfterFileIn!
Olgra initializeAfterFileIn!