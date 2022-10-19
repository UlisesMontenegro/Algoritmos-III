!classDefinition: #ExtractorTest category: 'AlgoIII-2021-1C-1erParcial'!
TestCase subclass: #ExtractorTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AlgoIII-2021-1C-1erParcial'!

!ExtractorTest methodsFor: 'combustibles' stamp: 'JMB 6/11/2021 21:04:48'!
unaUnidadDeCarbon
	^ #unaMenaDeCarbon! !

!ExtractorTest methodsFor: 'combustibles' stamp: 'JMB 6/11/2021 21:15:24'!
unaUnidadDeGasoil
	^ #unLitroDeGasoil! !

!ExtractorTest methodsFor: 'combustibles' stamp: 'JMB 6/11/2021 21:04:58'!
unaUnidadDeMadera
	^ #unTrozoDeMadera  ! !


!ExtractorTest methodsFor: 'tests con motor universal' stamp: 'LL 6/12/2021 00:39:03'!
costoDeExtraccionPorMena
	"Este código está repetido tambien en Extractor pero NO va a sumar puntos si lo quitan"
	^5 * joule
! !

!ExtractorTest methodsFor: 'tests con motor universal' stamp: 'LL 6/11/2021 23:58:00'!
test01UnExtractorSinCombustibleNoExtraeMenasNiLeSobraEnergia
	| extractor menasExtraidas |
	extractor := self extractorConMotorUniversalSinDesgaste.
	extractor alimentarEnergiaCon: #().
	
	menasExtraidas _ extractor extraer.
	
	self assert: menasExtraidas isEmpty.
	self assert: 0 * joule equals: extractor energiaDisponible.
! !

!ExtractorTest methodsFor: 'tests con motor universal' stamp: 'LL 6/12/2021 00:35:49'!
test02UnExtractorConUnTrozoDeMaderaExtraeMenasSegunLaEnergiaGenerada
	| extractor menasExtraidas combustible |
	extractor := self extractorConMotorUniversalSinDesgaste.
	combustible := OrderedCollection with: self unaUnidadDeMadera.
	extractor alimentarEnergiaCon: combustible.
	
	menasExtraidas _ extractor extraer.
	
	self assert: (13*joule) // self costoDeExtraccionPorMena equals: menasExtraidas size.
	self assert: (13*joule) \\ self costoDeExtraccionPorMena equals: extractor energiaDisponible.
! !

!ExtractorTest methodsFor: 'tests con motor universal' stamp: 'LL 6/12/2021 00:37:39'!
test03UnExtractorConUnaMenaDeCarbonExtraeMenasSegunLaEnergiaGenerada
	| extractor menasExtraidas combustible |
	extractor := self extractorConMotorUniversalSinDesgaste.
	combustible := OrderedCollection with: self unaUnidadDeCarbon.
	extractor alimentarEnergiaCon: combustible.
	
	menasExtraidas _ extractor extraer.
	
	self assert: (26*joule) // self costoDeExtraccionPorMena equals: menasExtraidas size.
	self assert: (26*joule) \\ self costoDeExtraccionPorMena equals: extractor energiaDisponible.
! !

!ExtractorTest methodsFor: 'tests con motor universal' stamp: 'LL 6/12/2021 00:37:46'!
test04UnExtractorConUnLitroDeGasoilExtraeMenasSegunLaEnergiaGenerada
	| extractor menasExtraidas combustible |
	extractor := self extractorConMotorUniversalSinDesgaste.
	combustible := OrderedCollection with: self unaUnidadDeGasoil.
	extractor alimentarEnergiaCon: combustible.
	
	menasExtraidas _ extractor extraer.
	
	self assert: (100*joule) // self costoDeExtraccionPorMena equals: menasExtraidas size.	
	self assert: (100*joule) \\ self costoDeExtraccionPorMena equals: extractor energiaDisponible.
! !

!ExtractorTest methodsFor: 'tests con motor universal' stamp: 'LL 6/12/2021 00:37:57'!
test05UnExtractorMasDeUnaUnidadDeCombustibleExtraeMenasSegunLaEnergiaGenerada
	| extractor menasExtraidas combustible |
	extractor := self extractorConMotorUniversalSinDesgaste.
	combustible := OrderedCollection 	with: self unaUnidadDeMadera 	with: self unaUnidadDeMadera.
	extractor alimentarEnergiaCon: combustible.
	
	menasExtraidas _ extractor extraer.
	
	self assert: (2*13*joule) // self costoDeExtraccionPorMena equals: menasExtraidas size.
	self assert: (2*13*joule) \\ self costoDeExtraccionPorMena equals: extractor energiaDisponible.
! !

!ExtractorTest methodsFor: 'tests con motor universal' stamp: 'LL 6/12/2021 00:39:27'!
test06UnExtractorConDiferentesTiposDeCombustibleExtraeMenasSegunLaEnergiaGenerada
	| extractor menasExtraidas combustible |
	extractor := self extractorConMotorUniversalSinDesgaste.
	combustible := OrderedCollection 	 	
		with: self unaUnidadDeCarbon 
		with: self unaUnidadDeGasoil.
	extractor alimentarEnergiaCon: combustible.
	
	menasExtraidas _ extractor extraer.
	
	self assert: ((26*joule) + (100*joule )) // self costoDeExtraccionPorMena equals: menasExtraidas size.
	self assert: ((26*joule) + (100*joule )) \\ self costoDeExtraccionPorMena equals: extractor energiaDisponible.
! !

!ExtractorTest methodsFor: 'tests con motor universal' stamp: 'LL 6/12/2021 00:39:36'!
test10UnExtractorDeCarbonPuedeUsarSuProductoComoCombustible
	| extractor menasDeCarbonExtraidas combustible |
	extractor := self extractorConMotorUniversalSinDesgaste.
	combustible := OrderedCollection with: self unaUnidadDeMadera.
	extractor alimentarEnergiaCon: combustible.
	menasDeCarbonExtraidas _ extractor extraer.
	extractor alimentarEnergiaCon: (menasDeCarbonExtraidas first: 1).
	
	menasDeCarbonExtraidas _ extractor extraer.
	
	self assert: (29*joule) // self costoDeExtraccionPorMena equals: menasDeCarbonExtraidas size.
	self assert: (29*joule) \\ self costoDeExtraccionPorMena equals: extractor energiaDisponible.
! !


!ExtractorTest methodsFor: 'tests con motor de solidos' stamp: 'LL 6/12/2021 00:39:42'!
test07UnExtractorConMotorDeSolidosOptimizaElRendimientoDeLaMadera
	| extractor combustible menasExtraidas |
	extractor := self extractorConMotorDeSolidosSinDesgaste.
	combustible := OrderedCollection with: self unaUnidadDeMadera.
	extractor alimentarEnergiaCon: combustible.
	
	menasExtraidas _ extractor extraer.
	
	self assert: (26*joule) // self costoDeExtraccionPorMena equals: menasExtraidas size.
	self assert: (26*joule) \\ self costoDeExtraccionPorMena equals: extractor energiaDisponible.
! !

!ExtractorTest methodsFor: 'tests con motor de solidos' stamp: 'LL 6/12/2021 00:39:48'!
test08UnExtractorConMotorDeSolidosOptimizaElRendimientoDelCarbon
	| extractor combustible menasExtraidas |
	extractor := self extractorConMotorDeSolidosSinDesgaste.
	combustible := OrderedCollection with: self unaUnidadDeCarbon.
	extractor alimentarEnergiaCon: combustible.
	
	menasExtraidas _ extractor extraer.
	
	self assert: (52*joule) // self costoDeExtraccionPorMena equals: menasExtraidas size.
	self assert: (52*joule) \\ self costoDeExtraccionPorMena equals: extractor energiaDisponible.
! !

!ExtractorTest methodsFor: 'tests con motor de solidos' stamp: 'LL 6/12/2021 00:39:56'!
test09UnExtractorConMotorDeSolidosDegradaElRendimientoDelGasoil
	| extractor combustible menasExtraidas |
	extractor := self extractorConMotorDeSolidosSinDesgaste.
	combustible := OrderedCollection with: self unaUnidadDeGasoil.
	extractor alimentarEnergiaCon: combustible.
	
	menasExtraidas _ extractor extraer.
	
	self assert: (25*joule) // self costoDeExtraccionPorMena equals: menasExtraidas size.
	self assert: (25*joule) \\ self costoDeExtraccionPorMena equals: extractor energiaDisponible.
! !


!ExtractorTest methodsFor: 'tests con motor con desgaste' stamp: 'LL 6/12/2021 00:40:18'!
test11UnExtractorConMotorUniversalDesgastadoTieneUnPeorRendimiento
	| extractor menasExtraidas combustible |
	extractor := self extractorConMotorUniversalConDesgaste: 0.5.
	combustible := OrderedCollection with: self unaUnidadDeGasoil.
	extractor alimentarEnergiaCon: combustible.
	
	menasExtraidas _ extractor extraer.
	
	self assert: ((1 - 0.5)*100*joule) // self costoDeExtraccionPorMena equals: menasExtraidas size.
	self assert: ((1 - 0.5)*100*joule) \\ self costoDeExtraccionPorMena equals: extractor energiaDisponible.
! !

!ExtractorTest methodsFor: 'tests con motor con desgaste' stamp: 'LL 6/12/2021 00:40:31'!
test12UnExtractorConMotorDeSolidosDesgastadoTieneUnPeorRendimiento
	| extractor menasExtraidas combustible |
	extractor := self extractorConMotorDeSolidosConDesgaste: 0.5.
	combustible := OrderedCollection with: self unaUnidadDeCarbon .
	extractor alimentarEnergiaCon: combustible.
	
	menasExtraidas _ extractor extraer.
	
	self assert: ((1 - 0.5)*52*joule) // self costoDeExtraccionPorMena equals: menasExtraidas size.
	self assert: ((1 - 0.5)*52*joule) \\ self costoDeExtraccionPorMena equals: extractor energiaDisponible.
! !


!ExtractorTest methodsFor: 'extractores' stamp: 'UM 10/19/2022 17:48:16'!
extractorConMotorDeSolidosConDesgaste: unNivelDeDesgaste
	| extractor motor |
	extractor := Extractor deCarbon.
	
	motor := MotorDeSolidos new.
	motor tipo: #motorDeSolidos.
	motor nivelDeDesgaste: unNivelDeDesgaste.
	
	extractor motor: motor.
	
	^extractor
! !

!ExtractorTest methodsFor: 'extractores' stamp: 'UM 10/19/2022 17:48:07'!
extractorConMotorDeSolidosSinDesgaste
	| extractor motor |
	extractor := Extractor deCarbon.
	
	motor := MotorDeSolidos new.
	motor tipo: #motorDeSolidos.
	motor nivelDeDesgaste: 0.
	
	extractor motor: motor.
	
	^extractor
! !

!ExtractorTest methodsFor: 'extractores' stamp: 'UM 10/19/2022 17:47:34'!
extractorConMotorUniversalConDesgaste: unNivelDeDesgaste
	| extractor motor |
	extractor := Extractor deCarbon.
	
	motor := MotorUniversal new.
	motor tipo: #motorUniversal.
	motor nivelDeDesgaste: unNivelDeDesgaste.
	
	extractor motor: motor.
	
	^extractor
! !

!ExtractorTest methodsFor: 'extractores' stamp: 'UM 10/19/2022 17:50:13'!
extractorConMotorUniversalSinDesgaste
	| extractor motor |
	extractor := Extractor deCarbon.
	
	motor := MotorUniversal new.
	motor nivelDeDesgaste: 0.
	
	extractor motor: motor.
	
	^extractor
! !


!classDefinition: #Extractor category: 'AlgoIII-2021-1C-1erParcial'!
Object subclass: #Extractor
	instanceVariableNames: 'producto energiaActual motor'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AlgoIII-2021-1C-1erParcial'!

!Extractor methodsFor: 'combustible' stamp: 'JMB 5/28/2021 16:30:38'!
alimentarEnergiaCon: unidadesDeCombustibleACargar
	| energiaAAgregar |
	energiaAAgregar := motor transformarEnEnergia: unidadesDeCombustibleACargar.
	energiaActual := energiaActual + energiaAAgregar.! !


!Extractor methodsFor: 'extraccion' stamp: 'JMB 5/28/2021 16:21:09'!
extraer
	| cantidadDeMenas energiaConsumida |
	cantidadDeMenas := self menasAExtraerSegunEnergiaActual.
	energiaConsumida := self energiaParaExtraerTodasLasMenasPosibles.
	self consumirEnergia: energiaConsumida.
	^(self obtenerUnaCantidadDeMenas: cantidadDeMenas).! !


!Extractor methodsFor: 'initialization' stamp: 'JMB 6/8/2021 22:27:09'!
initializeWithMaterial: material 
	self ponerEnCeroLaEnergia.	
	producto := material.! !


!Extractor methodsFor: 'accessing' stamp: 'SF 5/5/2021 20:50:00'!
energiaDisponible
	^energiaActual.! !

!Extractor methodsFor: 'accessing' stamp: 'JMB 6/8/2021 22:25:16'!
motor: unMotor
	motor := unMotor! !


!Extractor methodsFor: 'private' stamp: 'SF 5/5/2021 20:35:27'!
consumirEnergia: energiaAConsumir
	energiaActual := energiaActual - energiaAConsumir.! !

!Extractor methodsFor: 'private' stamp: 'SF 5/5/2021 20:39:48'!
costoDeExtraccionPorMena
	^5 * joule.! !

!Extractor methodsFor: 'private' stamp: 'SF 5/5/2021 20:40:41'!
energiaParaExtraerTodasLasMenasPosibles
	^self menasAExtraerSegunEnergiaActual * self costoDeExtraccionPorMena.! !

!Extractor methodsFor: 'private' stamp: 'SF 5/5/2021 20:39:37'!
menasAExtraerSegunEnergiaActual
	^energiaActual // self costoDeExtraccionPorMena.! !

!Extractor methodsFor: 'private' stamp: 'JMB 5/28/2021 16:21:08'!
obtenerUnaCantidadDeMenas: cantidadDeMenas
	^(Array new: cantidadDeMenas withAll: producto) asOrderedCollection.! !

!Extractor methodsFor: 'private' stamp: 'SF 5/5/2021 20:10:18'!
ponerEnCeroLaEnergia
	energiaActual := 0 * joule.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Extractor class' category: 'AlgoIII-2021-1C-1erParcial'!
Extractor class
	instanceVariableNames: ''!

!Extractor class methodsFor: 'as yet unclassified' stamp: 'JMB 6/11/2021 21:16:05'!
deCarbon
	^self new initializeWithMaterial: #unaMenaDeCarbon.! !


!classDefinition: #Motor category: 'AlgoIII-2021-1C-1erParcial'!
Object subclass: #Motor
	instanceVariableNames: 'tipo nivelDeDesgaste'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AlgoIII-2021-1C-1erParcial'!

!Motor methodsFor: 'private' stamp: 'UM 10/19/2022 18:02:59'!
transformarEnEnergiaUnaUnidad: unaUnidadDeCombustible
	^self convertirAUnidadDeCombustible: unaUnidadDeCombustible.! !


!Motor methodsFor: 'funcionamiento' stamp: 'UM 10/19/2022 17:04:37'!
transformarEnEnergia: unidadesDeCombustible
	
	^unidadesDeCombustible sum: [:unidadDeCombustible | self transformarEnEnergiaUnaUnidad: unidadDeCombustible] ifEmpty: [0*joule].! !


!Motor methodsFor: 'accessing' stamp: 'JMB 6/8/2021 22:37:21'!
nivelDeDesgaste: unNivelDeDesgaste
	nivelDeDesgaste := unNivelDeDesgaste ! !

!Motor methodsFor: 'accessing' stamp: 'JMB 6/8/2021 22:37:33'!
tipo: unTipoDeMotor
	tipo := unTipoDeMotor ! !


!Motor methodsFor: 'as yet unclassified' stamp: 'UM 10/19/2022 17:29:35'!
convertirAUnidadDeCombustible: unaUnidadDeCombustible

	self subclassResponsibility.! !


!classDefinition: #CAMBIARNOMBRES category: 'AlgoIII-2021-1C-1erParcial'!
Motor subclass: #CAMBIARNOMBRES
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AlgoIII-2021-1C-1erParcial'!


!classDefinition: #MotorDeSolidos category: 'AlgoIII-2021-1C-1erParcial'!
Motor subclass: #MotorDeSolidos
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AlgoIII-2021-1C-1erParcial'!

!MotorDeSolidos methodsFor: 'as yet unclassified' stamp: 'UM 10/19/2022 17:31:10'!
convertirAUnidadDeCombustible: unaUnidadDeCombustible

	unaUnidadDeCombustible = #unTrozoDeMadera ifTrue: [^(26 * joule)* (1 - nivelDeDesgaste)].
	unaUnidadDeCombustible = #unaMenaDeCarbon ifTrue: [^(52 * joule)* (1 - nivelDeDesgaste)].
	unaUnidadDeCombustible = #unLitroDeGasoil ifTrue: [^(25 * joule)* (1 - nivelDeDesgaste)].
	self error: 'Tipo de combustible desconocido: ', unaUnidadDeCombustible asString.! !

!MotorDeSolidos methodsFor: 'as yet unclassified' stamp: 'UM 10/19/2022 18:02:08'!
initialize

	tipo := #motorDeSolidos.! !


!classDefinition: #MotorDesconocido category: 'AlgoIII-2021-1C-1erParcial'!
Motor subclass: #MotorDesconocido
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AlgoIII-2021-1C-1erParcial'!

!MotorDesconocido methodsFor: 'as yet unclassified' stamp: 'UM 10/19/2022 17:33:00'!
convertirAUnidadDeCombustible: unaUnidadDeCombustible

	self error: 'Tipo de motor desconocido: ', tipo asString.! !

!MotorDesconocido methodsFor: 'as yet unclassified' stamp: 'UM 10/19/2022 17:52:49'!
initialize

	tipo := #motorDesconocido.! !


!classDefinition: #MotorUniversal category: 'AlgoIII-2021-1C-1erParcial'!
Motor subclass: #MotorUniversal
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AlgoIII-2021-1C-1erParcial'!

!MotorUniversal methodsFor: 'as yet unclassified' stamp: 'UM 10/19/2022 17:33:06'!
convertirAUnidadDeCombustible: unaUnidadDeCombustible
	
	unaUnidadDeCombustible = #unTrozoDeMadera ifTrue: [^(13 * joule)* (1 - nivelDeDesgaste)].
	unaUnidadDeCombustible = #unaMenaDeCarbon ifTrue: [^(26 * joule)* (1 - nivelDeDesgaste)].
	unaUnidadDeCombustible = #unLitroDeGasoil ifTrue: [^(100 * joule)* (1 - nivelDeDesgaste)].
	self error: 'Tipo de combustible desconocido: ', unaUnidadDeCombustible asString.! !

!MotorUniversal methodsFor: 'as yet unclassified' stamp: 'UM 10/19/2022 17:53:02'!
initialize
	
	tipo := #motorUniversal.! !
