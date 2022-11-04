!classDefinition: #MarsRoverTests category: 'TDDMarsRover'!
TestCase subclass: #MarsRoverTests
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TDDMarsRover'!

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'VDM 11/3/2022 22:44:45'!
test01_CAMBIAR_SiRecibeUnaCadenaVaciaNoHaceNada

	| marsRover mensajeVacio posicionInicial puntoCardinalInicial |
	
	posicionInicial := 0@0.
	puntoCardinalInicial := Norte new.
	mensajeVacio := ''.
	
	marsRover := MarsRover comenzandoEn: posicionInicial apuntandoHacia: puntoCardinalInicial.
	
	marsRover recibirMensaje: mensajeVacio.
	
	self assert: posicionInicial equals: marsRover coordenadasActuales.
	self assert: puntoCardinalInicial equals: marsRover puntoCardinalActual.
	! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'VDM 11/3/2022 22:44:45'!
test02_CAMBIAR_SiEstaApuntandoHaciaElNorteYRecibeComandoAvanzarSeMueveUnPuntoHaciaElNorte

	| marsRover mensajeEnviadoDesdeLaTierra posicionInicial puntoCardinalInicial |
	
	posicionInicial := 0@0.
	puntoCardinalInicial := Norte new.
	mensajeEnviadoDesdeLaTierra := 'f'.
	
	marsRover := MarsRover comenzandoEn: posicionInicial apuntandoHacia: puntoCardinalInicial.
	
	marsRover recibirMensaje: mensajeEnviadoDesdeLaTierra.
	
	self assert: (0@1) equals: marsRover coordenadasActuales.
	self assert: puntoCardinalInicial equals: marsRover puntoCardinalActual.
	! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'VDM 11/3/2022 22:44:45'!
test03_CAMBIAR_SiEstaApuntandoHaciaElNorteYRecibeComandoHaciaAtrasSeMueveUnPuntoHaciaElSur

	| marsRover mensajeEnviadoDesdeLaTierra posicionInicial puntoCardinalInicial |
	
	posicionInicial := 0@0.
	puntoCardinalInicial := Norte new.
	mensajeEnviadoDesdeLaTierra := 'b'.
	
	marsRover := MarsRover comenzandoEn: posicionInicial apuntandoHacia: puntoCardinalInicial.
	
	marsRover recibirMensaje: mensajeEnviadoDesdeLaTierra.
	
	self assert: (0@-1) equals: marsRover coordenadasActuales.
	self assert: puntoCardinalInicial equals: marsRover puntoCardinalActual.
	! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'VDM 11/3/2022 23:06:11'!
test04_CAMBIAR_SiEstaApuntandoHaciaElNorteYRecibeComandoGirarIzquierdaApuntaHaciaElOesteYSeUbicaEnLasMismasCoordenadas

	| marsRover mensajeEnviadoDesdeLaTierra posicionInicial puntoCardinalInicial |
	
	posicionInicial := 0@0.
	puntoCardinalInicial := Norte new.
	mensajeEnviadoDesdeLaTierra := 'l'.
	
	marsRover := MarsRover comenzandoEn: posicionInicial apuntandoHacia: puntoCardinalInicial.
	
	marsRover recibirMensaje: mensajeEnviadoDesdeLaTierra.
	
	self assert: (0@0) equals: marsRover coordenadasActuales.
	self assert: (marsRover puntoCardinalActual isKindOf: Oeste).
	! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'VDM 11/3/2022 23:07:21'!
test05_CAMBIAR_SiEstaApuntandoHaciaElNorteYRecibeComandoGirarDerechaApuntaHaciaElEsteYSeUbicaEnLasMismasCoordenadas

	| marsRover mensajeEnviadoDesdeLaTierra posicionInicial puntoCardinalInicial |
	
	posicionInicial := 0@0.
	puntoCardinalInicial := Norte new.
	mensajeEnviadoDesdeLaTierra := 'r'.
	
	marsRover := MarsRover comenzandoEn: posicionInicial apuntandoHacia: puntoCardinalInicial.
	
	marsRover recibirMensaje: mensajeEnviadoDesdeLaTierra.
	
	self assert: (0@0) equals: marsRover coordenadasActuales.
	self assert: (marsRover puntoCardinalActual isKindOf: Este).
	! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'VDM 11/3/2022 22:56:21'!
test06_CAMBIAR_SiEstaApuntandoHaciaElEsteYRecibeComandoAvanzarSeMueveUnPuntoHaciaElEste

	| marsRover mensajeEnviadoDesdeLaTierra posicionInicial puntoCardinalInicial |
	
	posicionInicial := 0@0.
	puntoCardinalInicial := Este new.
	mensajeEnviadoDesdeLaTierra := 'f'.
	
	marsRover := MarsRover comenzandoEn: posicionInicial apuntandoHacia: puntoCardinalInicial.
	
	marsRover recibirMensaje: mensajeEnviadoDesdeLaTierra.
	
	self assert: (1@0) equals: marsRover coordenadasActuales.
	self assert: puntoCardinalInicial equals: marsRover puntoCardinalActual.
	! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'VDM 11/3/2022 22:56:30'!
test07_CAMBIAR_SiEstaApuntandoHaciaElEsteYRecibeComandoHaciaAtrasSeMueveUnPuntoHaciaElOeste

	| marsRover mensajeEnviadoDesdeLaTierra posicionInicial puntoCardinalInicial |
	
	posicionInicial := 0@0.
	puntoCardinalInicial := Este new.
	mensajeEnviadoDesdeLaTierra := 'b'.
	
	marsRover := MarsRover comenzandoEn: posicionInicial apuntandoHacia: puntoCardinalInicial.
	
	marsRover recibirMensaje: mensajeEnviadoDesdeLaTierra.
	
	self assert: (-1@0) equals: marsRover coordenadasActuales.
	self assert: puntoCardinalInicial equals: marsRover puntoCardinalActual.
	! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'VDM 11/3/2022 23:10:48'!
test08_CAMBIAR_SiEstaApuntandoHaciaElEsteYRecibeComandoGirarIzquierdaApuntaHaciaElNorteYSeUbicaEnLasMismasCoordenadas

	| marsRover mensajeEnviadoDesdeLaTierra posicionInicial puntoCardinalInicial |
	
	posicionInicial := 0@0.
	puntoCardinalInicial := Este new.
	mensajeEnviadoDesdeLaTierra := 'l'.
	
	marsRover := MarsRover comenzandoEn: posicionInicial apuntandoHacia: puntoCardinalInicial.
	
	marsRover recibirMensaje: mensajeEnviadoDesdeLaTierra.
	
	self assert: (0@0) equals: marsRover coordenadasActuales.
	self assert: (marsRover puntoCardinalActual isKindOf: Norte).
	! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'VDM 11/3/2022 23:12:03'!
test09_CAMBIAR_SiEstaApuntandoHaciaElEsteYRecibeComandoGirarDerechaApuntaHaciaElSurYSeUbicaEnLasMismasCoordenadas

	| marsRover mensajeEnviadoDesdeLaTierra posicionInicial puntoCardinalInicial |
	
	posicionInicial := 0@0.
	puntoCardinalInicial := Este new.
	mensajeEnviadoDesdeLaTierra := 'r'.
	
	marsRover := MarsRover comenzandoEn: posicionInicial apuntandoHacia: puntoCardinalInicial.
	
	marsRover recibirMensaje: mensajeEnviadoDesdeLaTierra.
	
	self assert: (0@0) equals: marsRover coordenadasActuales.
	self assert: (marsRover puntoCardinalActual isKindOf: Sur).
	! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'VDM 11/3/2022 22:57:17'!
test10_CAMBIAR_SiEstaApuntandoHaciaElSurYRecibeComandoAvanzarSeMueveUnPuntoHaciaElSur

	| marsRover mensajeEnviadoDesdeLaTierra posicionInicial puntoCardinalInicial |
	
	posicionInicial := 0@0.
	puntoCardinalInicial := Sur new.
	mensajeEnviadoDesdeLaTierra := 'f'.
	
	marsRover := MarsRover comenzandoEn: posicionInicial apuntandoHacia: puntoCardinalInicial.
	
	marsRover recibirMensaje: mensajeEnviadoDesdeLaTierra.
	
	self assert: (0@-1) equals: marsRover coordenadasActuales.
	self assert: puntoCardinalInicial equals: marsRover puntoCardinalActual.
	! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'VDM 11/3/2022 22:57:25'!
test11_CAMBIAR_SiEstaApuntandoHaciaElSurYRecibeComandoHaciaAtrasSeMueveUnPuntoHaciaElNorte

	| marsRover mensajeEnviadoDesdeLaTierra posicionInicial puntoCardinalInicial |
	
	posicionInicial := 0@0.
	puntoCardinalInicial := Sur new.
	mensajeEnviadoDesdeLaTierra := 'b'.
	
	marsRover := MarsRover comenzandoEn: posicionInicial apuntandoHacia: puntoCardinalInicial.
	
	marsRover recibirMensaje: mensajeEnviadoDesdeLaTierra.
	
	self assert: (0@1) equals: marsRover coordenadasActuales.
	self assert: puntoCardinalInicial equals: marsRover puntoCardinalActual.
	! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'VDM 11/3/2022 23:12:38'!
test12_CAMBIAR_SiEstaApuntandoHaciaElSurYRecibeComandoGirarIzquierdaApuntaHaciaElEsteYSeUbicaEnLasMismasCoordenadas

	| marsRover mensajeEnviadoDesdeLaTierra posicionInicial puntoCardinalInicial |
	
	posicionInicial := 0@0.
	puntoCardinalInicial := Sur new.
	mensajeEnviadoDesdeLaTierra := 'l'.
	
	marsRover := MarsRover comenzandoEn: posicionInicial apuntandoHacia: puntoCardinalInicial.
	
	marsRover recibirMensaje: mensajeEnviadoDesdeLaTierra.
	
	self assert: (0@0) equals: marsRover coordenadasActuales.
	self assert: (marsRover puntoCardinalActual isKindOf: Este).
	! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'VDM 11/3/2022 23:13:07'!
test13_CAMBIAR_SiEstaApuntandoHaciaElSurYRecibeComandoGirarDerechaApuntaHaciaElOesteYSeUbicaEnLasMismasCoordenadas

	| marsRover mensajeEnviadoDesdeLaTierra posicionInicial puntoCardinalInicial |
	
	posicionInicial := 0@0.
	puntoCardinalInicial := Sur new.
	mensajeEnviadoDesdeLaTierra := 'r'.
	
	marsRover := MarsRover comenzandoEn: posicionInicial apuntandoHacia: puntoCardinalInicial.
	
	marsRover recibirMensaje: mensajeEnviadoDesdeLaTierra.
	
	self assert: (0@0) equals: marsRover coordenadasActuales.
	self assert: (marsRover puntoCardinalActual isKindOf: Oeste).
	! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'VDM 11/3/2022 22:57:59'!
test14_CAMBIAR_SiEstaApuntandoHaciaElOesteYRecibeComandoAvanzarSeMueveUnPuntoHaciaElOeste

	| marsRover mensajeEnviadoDesdeLaTierra posicionInicial puntoCardinalInicial |
	
	posicionInicial := 0@0.
	puntoCardinalInicial := Oeste new.
	mensajeEnviadoDesdeLaTierra := 'f'.
	
	marsRover := MarsRover comenzandoEn: posicionInicial apuntandoHacia: puntoCardinalInicial.
	
	marsRover recibirMensaje: mensajeEnviadoDesdeLaTierra.
	
	self assert: (-1@0) equals: marsRover coordenadasActuales.
	self assert: puntoCardinalInicial equals: marsRover puntoCardinalActual.
	! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'VDM 11/3/2022 22:58:20'!
test15_CAMBIAR_SiEstaApuntandoHaciaElOesteYRecibeComandoHaciaAtrasSeMueveUnPuntoHaciaElEste

	| marsRover mensajeEnviadoDesdeLaTierra posicionInicial puntoCardinalInicial |
	
	posicionInicial := 0@0.
	puntoCardinalInicial := Oeste new.
	mensajeEnviadoDesdeLaTierra := 'b'.
	
	marsRover := MarsRover comenzandoEn: posicionInicial apuntandoHacia: puntoCardinalInicial.
	
	marsRover recibirMensaje: mensajeEnviadoDesdeLaTierra.
	
	self assert: (1@0) equals: marsRover coordenadasActuales.
	self assert: puntoCardinalInicial equals: marsRover puntoCardinalActual.
	! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'VDM 11/3/2022 23:13:30'!
test16_CAMBIAR_SiEstaApuntandoHaciaElOesteYRecibeComandoGirarIzquierdaApuntaHaciaElSurYSeUbicaEnLasMismasCoordenadas

	| marsRover mensajeEnviadoDesdeLaTierra posicionInicial puntoCardinalInicial |
	
	posicionInicial := 0@0.
	puntoCardinalInicial := Oeste new.
	mensajeEnviadoDesdeLaTierra := 'l'.
	
	marsRover := MarsRover comenzandoEn: posicionInicial apuntandoHacia: puntoCardinalInicial.
	
	marsRover recibirMensaje: mensajeEnviadoDesdeLaTierra.
	
	self assert: (0@0) equals: marsRover coordenadasActuales.
	self assert: (marsRover puntoCardinalActual isKindOf: Sur).
	! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'VDM 11/3/2022 23:13:55'!
test17_CAMBIAR_SiEstaApuntandoHaciaElOesteYRecibeComandoGirarDerechaApuntaHaciaElNorteYSeUbicaEnLasMismasCoordenadas

	| marsRover mensajeEnviadoDesdeLaTierra posicionInicial puntoCardinalInicial |
	
	posicionInicial := 0@0.
	puntoCardinalInicial := Oeste new.
	mensajeEnviadoDesdeLaTierra := 'r'.
	
	marsRover := MarsRover comenzandoEn: posicionInicial apuntandoHacia: puntoCardinalInicial.
	
	marsRover recibirMensaje: mensajeEnviadoDesdeLaTierra.
	
	self assert: (0@0) equals: marsRover coordenadasActuales.
	self assert: (marsRover puntoCardinalActual isKindOf: Norte).
	! !


!classDefinition: #MarsRover category: 'TDDMarsRover'!
Object subclass: #MarsRover
	instanceVariableNames: 'coordenadasActuales puntoCardinalActual'
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

!MarsRover methodsFor: 'as yet unclassified' stamp: 'VDM 11/3/2022 18:39:58'!
coordenadasActuales
	
	^ coordenadasActuales copy.! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'VDM 11/3/2022 19:46:29'!
inicializadoEn: unasCoordenadasIniciales apuntandoHacia: unPuntoCardinalInicial 
	
	coordenadasActuales := unasCoordenadasIniciales.
	puntoCardinalActual := unPuntoCardinalInicial.
	! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'VDM 11/3/2022 23:08:48'!
moveteUnPuntoHaciaElEste
	
	coordenadasActuales := (1@0).! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'VDM 11/3/2022 22:41:33'!
moveteUnPuntoHaciaElNorte
	
	coordenadasActuales := (0@1).! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'VDM 11/3/2022 23:09:34'!
moveteUnPuntoHaciaElOeste
	
	coordenadasActuales := (-1@0).! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'VDM 11/3/2022 22:42:39'!
moveteUnPuntoHaciaElSur
	
	coordenadasActuales := (0@-1).! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'VDM 11/3/2022 23:15:37'!
puntoCardinalActual
	
	^ puntoCardinalActual.! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'VDM 11/3/2022 22:55:11'!
recibirMensaje: unMensajeRecibido

	puntoCardinalActual procesarMensaje: unMensajeRecibido soy: self.
	
	"puntoCardinalActual = 'N' ifTrue: [
		unMensajeRecibido = 'f' ifTrue: [
			coordenadasActuales := (0@1).
		].
		unMensajeRecibido = 'b' ifTrue: [
			coordenadasActuales := (0@-1).
		].
		unMensajeRecibido = 'l' ifTrue: [
			puntoCardinalActual := 'O'.
			^ self.
		].
		unMensajeRecibido = 'r' ifTrue: [
			puntoCardinalActual := 'E'.
			^ self.
		].
	].
	
	puntoCardinalActual = 'E' ifTrue: [
		unMensajeRecibido = 'f' ifTrue: [
			coordenadasActuales := (1@0).
		].
		unMensajeRecibido = 'b' ifTrue: [
			coordenadasActuales := (-1@0).
		].
		unMensajeRecibido = 'l' ifTrue: [
			puntoCardinalActual := 'N'.
		].
		unMensajeRecibido = 'r' ifTrue: [
			puntoCardinalActual := 'S'.
			^self.
		].
	].
	puntoCardinalActual = 'S' ifTrue: [
		unMensajeRecibido = 'f' ifTrue: [
			coordenadasActuales := (0@-1).
		].
		unMensajeRecibido = 'b' ifTrue: [
			coordenadasActuales := (0@1).
		].
		unMensajeRecibido = 'l' ifTrue: [
			puntoCardinalActual := 'E'.
		].
		unMensajeRecibido = 'r' ifTrue: [
			puntoCardinalActual := 'O'.
			^self.
		].
	].
	puntoCardinalActual = 'O' ifTrue: [
		unMensajeRecibido = 'f' ifTrue: [
			coordenadasActuales := (-1@0).
		].
		unMensajeRecibido = 'b' ifTrue: [
			coordenadasActuales := (1@0).
		].
		unMensajeRecibido = 'l' ifTrue: [
			puntoCardinalActual := 'S'.
		].
		unMensajeRecibido = 'r' ifTrue: [
			puntoCardinalActual := 'N'.
		].
	].

	self error: 'Punto cardinal desconocido.'."! !

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

!PuntoCardinal methodsFor: 'as yet unclassified' stamp: 'VDM 11/3/2022 23:16:27'!
procesarMensaje: unMensajeRecibido soy: unMarsRover

	self subclassResponsibility.! !


!classDefinition: #Este category: 'TDDMarsRover'!
PuntoCardinal subclass: #Este
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TDDMarsRover'!

!Este methodsFor: 'as yet unclassified' stamp: 'VDM 11/3/2022 22:52:17'!
procesarMensaje: unMensajeRecibido soy: unMarsRover   

	unMensajeRecibido isEmpty ifTrue: [
		^ self.
	].
	unMensajeRecibido = 'f' ifTrue: [
		unMarsRover moveteUnPuntoHaciaElEste.
	].
	unMensajeRecibido = 'b' ifTrue: [
		unMarsRover moveteUnPuntoHaciaElOeste.
	].
	unMensajeRecibido = 'l' ifTrue: [
		unMarsRover apuntarHaciaElNorte.
	].
	unMensajeRecibido = 'r' ifTrue: [
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

!Norte methodsFor: 'as yet unclassified' stamp: 'VDM 11/3/2022 22:48:14'!
procesarMensaje: unMensajeRecibido soy: unMarsRover   

	unMensajeRecibido isEmpty ifTrue: [
		^ self.
	].
	unMensajeRecibido = 'f' ifTrue: [
		unMarsRover moveteUnPuntoHaciaElNorte.
	].
	unMensajeRecibido = 'b' ifTrue: [
		unMarsRover moveteUnPuntoHaciaElSur.
	].
	unMensajeRecibido = 'l' ifTrue: [
		unMarsRover apuntarHaciaElOeste.
	].
	unMensajeRecibido = 'r' ifTrue: [
		unMarsRover apuntarHaciaElEste.
	].! !


!classDefinition: #Oeste category: 'TDDMarsRover'!
PuntoCardinal subclass: #Oeste
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TDDMarsRover'!

!Oeste methodsFor: 'as yet unclassified' stamp: 'VDM 11/3/2022 22:54:50'!
procesarMensaje: unMensajeRecibido soy: unMarsRover

	unMensajeRecibido isEmpty ifTrue: [
		^ self.
	].
	unMensajeRecibido = 'f' ifTrue: [
		unMarsRover moveteUnPuntoHaciaElOeste.
	].
	unMensajeRecibido = 'b' ifTrue: [
		unMarsRover moveteUnPuntoHaciaElEste.
	].
	unMensajeRecibido = 'l' ifTrue: [
		unMarsRover apuntarHaciaElSur.
	].
	unMensajeRecibido = 'r' ifTrue: [
		unMarsRover apuntarHaciaElNorte.
	]. ! !


!classDefinition: #Sur category: 'TDDMarsRover'!
PuntoCardinal subclass: #Sur
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TDDMarsRover'!

!Sur methodsFor: 'as yet unclassified' stamp: 'VDM 11/3/2022 22:53:47'!
procesarMensaje: unMensajeRecibido soy: unMarsRover 

	unMensajeRecibido isEmpty ifTrue: [
		^ self.
	].
	unMensajeRecibido = 'f' ifTrue: [
		unMarsRover moveteUnPuntoHaciaElSur.
	].
	unMensajeRecibido = 'b' ifTrue: [
		unMarsRover moveteUnPuntoHaciaElNorte.
	].
	unMensajeRecibido = 'l' ifTrue: [
		unMarsRover apuntarHaciaElEste.
	].
	unMensajeRecibido = 'r' ifTrue: [
		unMarsRover apuntarHaciaElOeste.
	]. ! !
