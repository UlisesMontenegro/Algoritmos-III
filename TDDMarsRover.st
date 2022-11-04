!classDefinition: #MarsRoverTests category: 'TDDMarsRover'!
TestCase subclass: #MarsRoverTests
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TDDMarsRover'!

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'UM 11/4/2022 17:22:15'!
test01SiRecibeUnaCadenaVaciaNoHaceNada

	| marsRover mensajeVacio posicionInicial puntoCardinalInicial |
	
	posicionInicial := 0@0.
	puntoCardinalInicial := Norte new.
	mensajeVacio := ''.
	
	marsRover := MarsRover comenzandoEn: posicionInicial apuntandoHacia: puntoCardinalInicial.
	
	marsRover recibirMensaje: mensajeVacio.
	
	self assert: posicionInicial equals: marsRover coordenadasActuales.
	self assert: puntoCardinalInicial equals: marsRover puntoCardinalActual.
	! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'UM 11/4/2022 17:22:26'!
test02SiEstaApuntandoHaciaElNorteYRecibeComandoAvanzarSeMueveUnPuntoHaciaElNorte

	| marsRover mensajeEnviadoDesdeLaTierra posicionInicial puntoCardinalInicial |
	
	posicionInicial := 0@0.
	puntoCardinalInicial := Norte new.
	mensajeEnviadoDesdeLaTierra := 'f'.
	
	marsRover := MarsRover comenzandoEn: posicionInicial apuntandoHacia: puntoCardinalInicial.
	
	marsRover recibirMensaje: mensajeEnviadoDesdeLaTierra.
	
	self assert: (0@1) equals: marsRover coordenadasActuales.
	self assert: puntoCardinalInicial equals: marsRover puntoCardinalActual.
	! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'UM 11/4/2022 17:22:47'!
test03SiEstaApuntandoHaciaElNorteYRecibeComandoHaciaAtrasSeMueveUnPuntoHaciaElSur

	| marsRover mensajeEnviadoDesdeLaTierra posicionInicial puntoCardinalInicial |
	
	posicionInicial := 0@0.
	puntoCardinalInicial := Norte new.
	mensajeEnviadoDesdeLaTierra := 'b'.
	
	marsRover := MarsRover comenzandoEn: posicionInicial apuntandoHacia: puntoCardinalInicial.
	
	marsRover recibirMensaje: mensajeEnviadoDesdeLaTierra.
	
	self assert: (0@-1) equals: marsRover coordenadasActuales.
	self assert: puntoCardinalInicial equals: marsRover puntoCardinalActual.
	! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'UM 11/4/2022 17:22:55'!
test04SiEstaApuntandoHaciaElNorteYRecibeComandoGirarIzquierdaApuntaHaciaElOesteYSeUbicaEnLasMismasCoordenadas

	| marsRover mensajeEnviadoDesdeLaTierra posicionInicial puntoCardinalInicial |
	
	posicionInicial := 0@0.
	puntoCardinalInicial := Norte new.
	mensajeEnviadoDesdeLaTierra := 'l'.
	
	marsRover := MarsRover comenzandoEn: posicionInicial apuntandoHacia: puntoCardinalInicial.
	
	marsRover recibirMensaje: mensajeEnviadoDesdeLaTierra.
	
	self assert: (0@0) equals: marsRover coordenadasActuales.
	self assert: (marsRover puntoCardinalActual isKindOf: Oeste).
	! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'UM 11/4/2022 17:23:02'!
test05SiEstaApuntandoHaciaElNorteYRecibeComandoGirarDerechaApuntaHaciaElEsteYSeUbicaEnLasMismasCoordenadas

	| marsRover mensajeEnviadoDesdeLaTierra posicionInicial puntoCardinalInicial |
	
	posicionInicial := 0@0.
	puntoCardinalInicial := Norte new.
	mensajeEnviadoDesdeLaTierra := 'r'.
	
	marsRover := MarsRover comenzandoEn: posicionInicial apuntandoHacia: puntoCardinalInicial.
	
	marsRover recibirMensaje: mensajeEnviadoDesdeLaTierra.
	
	self assert: (0@0) equals: marsRover coordenadasActuales.
	self assert: (marsRover puntoCardinalActual isKindOf: Este).
	! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'UM 11/4/2022 17:23:09'!
test06SiEstaApuntandoHaciaElEsteYRecibeComandoAvanzarSeMueveUnPuntoHaciaElEste

	| marsRover mensajeEnviadoDesdeLaTierra posicionInicial puntoCardinalInicial |
	
	posicionInicial := 0@0.
	puntoCardinalInicial := Este new.
	mensajeEnviadoDesdeLaTierra := 'f'.
	
	marsRover := MarsRover comenzandoEn: posicionInicial apuntandoHacia: puntoCardinalInicial.
	
	marsRover recibirMensaje: mensajeEnviadoDesdeLaTierra.
	
	self assert: (1@0) equals: marsRover coordenadasActuales.
	self assert: puntoCardinalInicial equals: marsRover puntoCardinalActual.
	! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'UM 11/4/2022 17:23:23'!
test07SiEstaApuntandoHaciaElEsteYRecibeComandoHaciaAtrasSeMueveUnPuntoHaciaElOeste

	| marsRover mensajeEnviadoDesdeLaTierra posicionInicial puntoCardinalInicial |
	
	posicionInicial := 0@0.
	puntoCardinalInicial := Este new.
	mensajeEnviadoDesdeLaTierra := 'b'.
	
	marsRover := MarsRover comenzandoEn: posicionInicial apuntandoHacia: puntoCardinalInicial.
	
	marsRover recibirMensaje: mensajeEnviadoDesdeLaTierra.
	
	self assert: (-1@0) equals: marsRover coordenadasActuales.
	self assert: puntoCardinalInicial equals: marsRover puntoCardinalActual.
	! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'UM 11/4/2022 17:23:32'!
test08SiEstaApuntandoHaciaElEsteYRecibeComandoGirarIzquierdaApuntaHaciaElNorteYSeUbicaEnLasMismasCoordenadas

	| marsRover mensajeEnviadoDesdeLaTierra posicionInicial puntoCardinalInicial |
	
	posicionInicial := 0@0.
	puntoCardinalInicial := Este new.
	mensajeEnviadoDesdeLaTierra := 'l'.
	
	marsRover := MarsRover comenzandoEn: posicionInicial apuntandoHacia: puntoCardinalInicial.
	
	marsRover recibirMensaje: mensajeEnviadoDesdeLaTierra.
	
	self assert: (0@0) equals: marsRover coordenadasActuales.
	self assert: (marsRover puntoCardinalActual isKindOf: Norte).
	! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'UM 11/4/2022 17:23:38'!
test09SiEstaApuntandoHaciaElEsteYRecibeComandoGirarDerechaApuntaHaciaElSurYSeUbicaEnLasMismasCoordenadas

	| marsRover mensajeEnviadoDesdeLaTierra posicionInicial puntoCardinalInicial |
	
	posicionInicial := 0@0.
	puntoCardinalInicial := Este new.
	mensajeEnviadoDesdeLaTierra := 'r'.
	
	marsRover := MarsRover comenzandoEn: posicionInicial apuntandoHacia: puntoCardinalInicial.
	
	marsRover recibirMensaje: mensajeEnviadoDesdeLaTierra.
	
	self assert: (0@0) equals: marsRover coordenadasActuales.
	self assert: (marsRover puntoCardinalActual isKindOf: Sur).
	! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'UM 11/4/2022 17:23:48'!
test10SiEstaApuntandoHaciaElSurYRecibeComandoAvanzarSeMueveUnPuntoHaciaElSur

	| marsRover mensajeEnviadoDesdeLaTierra posicionInicial puntoCardinalInicial |
	
	posicionInicial := 0@0.
	puntoCardinalInicial := Sur new.
	mensajeEnviadoDesdeLaTierra := 'f'.
	
	marsRover := MarsRover comenzandoEn: posicionInicial apuntandoHacia: puntoCardinalInicial.
	
	marsRover recibirMensaje: mensajeEnviadoDesdeLaTierra.
	
	self assert: (0@-1) equals: marsRover coordenadasActuales.
	self assert: puntoCardinalInicial equals: marsRover puntoCardinalActual.
	! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'UM 11/4/2022 17:23:53'!
test11SiEstaApuntandoHaciaElSurYRecibeComandoHaciaAtrasSeMueveUnPuntoHaciaElNorte

	| marsRover mensajeEnviadoDesdeLaTierra posicionInicial puntoCardinalInicial |
	
	posicionInicial := 0@0.
	puntoCardinalInicial := Sur new.
	mensajeEnviadoDesdeLaTierra := 'b'.
	
	marsRover := MarsRover comenzandoEn: posicionInicial apuntandoHacia: puntoCardinalInicial.
	
	marsRover recibirMensaje: mensajeEnviadoDesdeLaTierra.
	
	self assert: (0@1) equals: marsRover coordenadasActuales.
	self assert: puntoCardinalInicial equals: marsRover puntoCardinalActual.
	! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'UM 11/4/2022 17:23:58'!
test12SiEstaApuntandoHaciaElSurYRecibeComandoGirarIzquierdaApuntaHaciaElEsteYSeUbicaEnLasMismasCoordenadas

	| marsRover mensajeEnviadoDesdeLaTierra posicionInicial puntoCardinalInicial |
	
	posicionInicial := 0@0.
	puntoCardinalInicial := Sur new.
	mensajeEnviadoDesdeLaTierra := 'l'.
	
	marsRover := MarsRover comenzandoEn: posicionInicial apuntandoHacia: puntoCardinalInicial.
	
	marsRover recibirMensaje: mensajeEnviadoDesdeLaTierra.
	
	self assert: (0@0) equals: marsRover coordenadasActuales.
	self assert: (marsRover puntoCardinalActual isKindOf: Este).
	! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'UM 11/4/2022 17:24:04'!
test13SiEstaApuntandoHaciaElSurYRecibeComandoGirarDerechaApuntaHaciaElOesteYSeUbicaEnLasMismasCoordenadas

	| marsRover mensajeEnviadoDesdeLaTierra posicionInicial puntoCardinalInicial |
	
	posicionInicial := 0@0.
	puntoCardinalInicial := Sur new.
	mensajeEnviadoDesdeLaTierra := 'r'.
	
	marsRover := MarsRover comenzandoEn: posicionInicial apuntandoHacia: puntoCardinalInicial.
	
	marsRover recibirMensaje: mensajeEnviadoDesdeLaTierra.
	
	self assert: (0@0) equals: marsRover coordenadasActuales.
	self assert: (marsRover puntoCardinalActual isKindOf: Oeste).
	! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'UM 11/4/2022 17:24:09'!
test14SiEstaApuntandoHaciaElOesteYRecibeComandoAvanzarSeMueveUnPuntoHaciaElOeste

	| marsRover mensajeEnviadoDesdeLaTierra posicionInicial puntoCardinalInicial |
	
	posicionInicial := 0@0.
	puntoCardinalInicial := Oeste new.
	mensajeEnviadoDesdeLaTierra := 'f'.
	
	marsRover := MarsRover comenzandoEn: posicionInicial apuntandoHacia: puntoCardinalInicial.
	
	marsRover recibirMensaje: mensajeEnviadoDesdeLaTierra.
	
	self assert: (-1@0) equals: marsRover coordenadasActuales.
	self assert: puntoCardinalInicial equals: marsRover puntoCardinalActual.
	! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'UM 11/4/2022 17:24:14'!
test15SiEstaApuntandoHaciaElOesteYRecibeComandoHaciaAtrasSeMueveUnPuntoHaciaElEste

	| marsRover mensajeEnviadoDesdeLaTierra posicionInicial puntoCardinalInicial |
	
	posicionInicial := 0@0.
	puntoCardinalInicial := Oeste new.
	mensajeEnviadoDesdeLaTierra := 'b'.
	
	marsRover := MarsRover comenzandoEn: posicionInicial apuntandoHacia: puntoCardinalInicial.
	
	marsRover recibirMensaje: mensajeEnviadoDesdeLaTierra.
	
	self assert: (1@0) equals: marsRover coordenadasActuales.
	self assert: puntoCardinalInicial equals: marsRover puntoCardinalActual.
	! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'UM 11/4/2022 17:24:20'!
test16SiEstaApuntandoHaciaElOesteYRecibeComandoGirarIzquierdaApuntaHaciaElSurYSeUbicaEnLasMismasCoordenadas

	| marsRover mensajeEnviadoDesdeLaTierra posicionInicial puntoCardinalInicial |
	
	posicionInicial := 0@0.
	puntoCardinalInicial := Oeste new.
	mensajeEnviadoDesdeLaTierra := 'l'.
	
	marsRover := MarsRover comenzandoEn: posicionInicial apuntandoHacia: puntoCardinalInicial.
	
	marsRover recibirMensaje: mensajeEnviadoDesdeLaTierra.
	
	self assert: (0@0) equals: marsRover coordenadasActuales.
	self assert: (marsRover puntoCardinalActual isKindOf: Sur).
	! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'UM 11/4/2022 17:24:26'!
test17SiEstaApuntandoHaciaElOesteYRecibeComandoGirarDerechaApuntaHaciaElNorteYSeUbicaEnLasMismasCoordenadas

	| marsRover mensajeEnviadoDesdeLaTierra posicionInicial puntoCardinalInicial |
	
	posicionInicial := 0@0.
	puntoCardinalInicial := Oeste new.
	mensajeEnviadoDesdeLaTierra := 'r'.
	
	marsRover := MarsRover comenzandoEn: posicionInicial apuntandoHacia: puntoCardinalInicial.
	
	marsRover recibirMensaje: mensajeEnviadoDesdeLaTierra.
	
	self assert: (0@0) equals: marsRover coordenadasActuales.
	self assert: (marsRover puntoCardinalActual isKindOf: Norte).
	! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'UM 11/4/2022 17:13:53'!
test18PuedeRecibirMasDeUnComandoValido

	| marsRover mensajeEnviadoDesdeLaTierra posicionInicial puntoCardinalInicial |
	
	posicionInicial := 0@0.
	puntoCardinalInicial := Norte new.
	mensajeEnviadoDesdeLaTierra := 'rf'.
	
	marsRover := MarsRover comenzandoEn: posicionInicial apuntandoHacia: puntoCardinalInicial.
	
	marsRover recibirMensaje: mensajeEnviadoDesdeLaTierra.
	
	self assert: (1@0) equals: marsRover coordenadasActuales.
	self assert: (marsRover puntoCardinalActual isKindOf: Este).
	! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'UM 11/4/2022 17:13:36'!
test19SiRecibeUnaInstruccionNoValidaDejaDeProcesar

	| marsRover mensajeEnviadoDesdeLaTierra posicionInicial puntoCardinalInicial |
	
	posicionInicial := 0@0.
	puntoCardinalInicial := Norte new.
	mensajeEnviadoDesdeLaTierra := '4f'.
	
	marsRover := MarsRover comenzandoEn: posicionInicial apuntandoHacia: puntoCardinalInicial.
	
	marsRover recibirMensaje: mensajeEnviadoDesdeLaTierra.
	
	self assert: (0@0) equals: marsRover coordenadasActuales.
	self assert: (marsRover puntoCardinalActual isKindOf: Norte).
	! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'UM 11/4/2022 17:22:04'!
test20SePuedeMoverVariasVecesEnLaMismaDireccion

	| marsRover mensajeEnviadoDesdeLaTierra posicionInicial puntoCardinalInicial |
	
	posicionInicial := 0@0.
	puntoCardinalInicial := Norte new.
	mensajeEnviadoDesdeLaTierra := 'ff'.
	
	marsRover := MarsRover comenzandoEn: posicionInicial apuntandoHacia: puntoCardinalInicial.
	
	marsRover recibirMensaje: mensajeEnviadoDesdeLaTierra.
	
	self assert: (0@2) equals: marsRover coordenadasActuales.
	self assert: (marsRover puntoCardinalActual isKindOf: Norte).
	! !


!classDefinition: #MarsRover category: 'TDDMarsRover'!
Object subclass: #MarsRover
	instanceVariableNames: 'coordenadasActuales puntoCardinalActual instruccionesValidas'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TDDMarsRover'!

!MarsRover methodsFor: 'as yet unclassified' stamp: 'VDM 11/3/2022 23:08:01'!
apuntarHaciaElEste
	
	puntoCardinalActual := Este new.! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'VDM 11/3/2022 23:10:04'!
apuntarHaciaElNorte
	
	puntoCardinalActual := Norte new.! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'VDM 11/3/2022 23:14:24'!
apuntarHaciaElOeste
	
	puntoCardinalActual := Oeste new.! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'VDM 11/3/2022 23:11:18'!
apuntarHaciaElSur
	
	puntoCardinalActual := Sur new.! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'UM 11/4/2022 17:19:03'!
coordenadasActuales
	
	^ coordenadasActuales.! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'UM 11/4/2022 17:06:24'!
esUnaInstruccionValida: unaInstruccion

	^instruccionesValidas includes: unaInstruccion.! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'UM 11/4/2022 17:09:11'!
inicializadoEn: unasCoordenadasIniciales apuntandoHacia: unPuntoCardinalInicial 
	
	coordenadasActuales := unasCoordenadasIniciales.
	puntoCardinalActual := unPuntoCardinalInicial.
	instruccionesValidas := OrderedCollection with: $f with:$b with:$r with:$l.
	! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'UM 11/4/2022 17:20:41'!
moveteUnPuntoHaciaElEste
	
	coordenadasActuales := coordenadasActuales + (1@0).! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'UM 11/4/2022 17:15:57'!
moveteUnPuntoHaciaElNorte
	
	coordenadasActuales := coordenadasActuales + (0@1).! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'UM 11/4/2022 17:20:48'!
moveteUnPuntoHaciaElOeste
	
	coordenadasActuales := coordenadasActuales + (-1@0).! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'UM 11/4/2022 17:20:56'!
moveteUnPuntoHaciaElSur
	
	coordenadasActuales := coordenadasActuales + (0@-1).! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'VDM 11/3/2022 23:15:37'!
puntoCardinalActual
	
	^ puntoCardinalActual.! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'UM 11/4/2022 17:26:31'!
recibirMensaje: unMensajeRecibido
	unMensajeRecibido do: [:unaInstruccion | (self esUnaInstruccionValida: unaInstruccion) ifTrue: [puntoCardinalActual procesarInstruccion: unaInstruccion soy: self] ifFalse: [^self]].! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRover class' category: 'TDDMarsRover'!
MarsRover class
	instanceVariableNames: ''!

!MarsRover class methodsFor: 'as yet unclassified' stamp: 'VDM 11/3/2022 17:15:10'!
comenzandoEn: unasCoordenadasIniciales apuntandoHacia: unPuntoCardinalInicial 
	^ self new inicializadoEn: unasCoordenadasIniciales apuntandoHacia: unPuntoCardinalInicial.! !


!classDefinition: #PuntoCardinal category: 'TDDMarsRover'!
Object subclass: #PuntoCardinal
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TDDMarsRover'!

!PuntoCardinal methodsFor: 'as yet unclassified' stamp: 'UM 11/4/2022 17:26:31'!
procesarInstruccion: unMensajeRecibido soy: unMarsRover

	self subclassResponsibility.! !


!classDefinition: #Este category: 'TDDMarsRover'!
PuntoCardinal subclass: #Este
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TDDMarsRover'!

!Este methodsFor: 'as yet unclassified' stamp: 'UM 11/4/2022 17:26:31'!
procesarInstruccion: unCaracter soy: unMarsRover   

	unCaracter isNil ifTrue: [
		^ self.
	].
	unCaracter = $f ifTrue: [
		unMarsRover moveteUnPuntoHaciaElEste.
	].
	unCaracter = $b ifTrue: [
		unMarsRover moveteUnPuntoHaciaElOeste.
	].
	unCaracter = $l ifTrue: [
		unMarsRover apuntarHaciaElNorte.
	].
	unCaracter = $r ifTrue: [
		unMarsRover apuntarHaciaElSur.
	].! !


!classDefinition: #NoValido category: 'TDDMarsRover'!
PuntoCardinal subclass: #NoValido
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TDDMarsRover'!


!classDefinition: #Norte category: 'TDDMarsRover'!
PuntoCardinal subclass: #Norte
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TDDMarsRover'!

!Norte methodsFor: 'as yet unclassified' stamp: 'UM 11/4/2022 17:26:31'!
procesarInstruccion: unCaracter soy: unMarsRover   

	unCaracter isNil ifTrue: [
		^ self.
	].
	unCaracter = $f ifTrue: [
		unMarsRover moveteUnPuntoHaciaElNorte.
	].
	unCaracter = $b ifTrue: [
		unMarsRover moveteUnPuntoHaciaElSur.
	].
	unCaracter = $l ifTrue: [
		unMarsRover apuntarHaciaElOeste.
	].
	unCaracter = $r ifTrue: [
		unMarsRover apuntarHaciaElEste.
	].! !


!classDefinition: #Oeste category: 'TDDMarsRover'!
PuntoCardinal subclass: #Oeste
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TDDMarsRover'!

!Oeste methodsFor: 'as yet unclassified' stamp: 'UM 11/4/2022 17:26:31'!
procesarInstruccion: unCaracter soy: unMarsRover

	unCaracter isNil ifTrue: [
		^ self.
	].
	unCaracter = $f ifTrue: [
		unMarsRover moveteUnPuntoHaciaElOeste.
	].
	unCaracter = $b ifTrue: [
		unMarsRover moveteUnPuntoHaciaElEste.
	].
	unCaracter = $l ifTrue: [
		unMarsRover apuntarHaciaElSur.
	].
	unCaracter = $r ifTrue: [
		unMarsRover apuntarHaciaElNorte.
	]. ! !


!classDefinition: #Sur category: 'TDDMarsRover'!
PuntoCardinal subclass: #Sur
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TDDMarsRover'!

!Sur methodsFor: 'as yet unclassified' stamp: 'UM 11/4/2022 17:26:31'!
procesarInstruccion: unCaracter soy: unMarsRover 

	unCaracter isNil ifTrue: [
		^ self.
	].
	unCaracter = $f ifTrue: [
		unMarsRover moveteUnPuntoHaciaElSur.
	].
	unCaracter = $b ifTrue: [
		unMarsRover moveteUnPuntoHaciaElNorte.
	].
	unCaracter = $l ifTrue: [
		unMarsRover apuntarHaciaElEste.
	].
	unCaracter = $r ifTrue: [
		unMarsRover apuntarHaciaElOeste.
	]. ! !
