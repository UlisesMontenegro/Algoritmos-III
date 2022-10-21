!classDefinition: #ExtractorTest category: 'AlgoIII-2021-1C-1erParcial'!
TestCase subclass: #ExtractorTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AlgoIII-2021-1C-1erParcial'!

!ExtractorTest methodsFor: 'combustibles' stamp: 'VDM 10/20/2022 16:48:51'!
unaUnidadDeCarbon
	^ UnaMenaDeCarbon new.! !

!ExtractorTest methodsFor: 'combustibles' stamp: 'VDM 10/20/2022 16:49:22'!
unaUnidadDeGasoil
	^ UnLitroDeGasoil new.! !

!ExtractorTest methodsFor: 'combustibles' stamp: 'VDM 10/20/2022 16:49:16'!
unaUnidadDeMadera
	^ UnTrozoDeMadera  new.! !


!ExtractorTest methodsFor: 'tests con motor universal' stamp: 'LL 6/12/2021 00:39:03'!
costoDeExtraccionPorMena
	"Este código está repetido tambien en Extractor pero NO va a sumar puntos si lo quitan"
	^5 * joule
! !

!ExtractorTest methodsFor: 'tests con motor universal' stamp: 'VDM 10/20/2022 21:39:20'!
test01UnExtractorSinCombustibleNoExtraeMenasNiLeSobraEnergia
	| extractor menasExtraidas |
	extractor := self extractorConMotorUniversalConDesgaste: 0.
	
	extractor alimentarEnergiaCon: #().
	
	menasExtraidas _ extractor extraer.
	
	self assert: menasExtraidas isEmpty.
	self assert: 0 * joule equals: extractor energiaDisponible.
! !

!ExtractorTest methodsFor: 'tests con motor universal' stamp: 'VDM 10/20/2022 22:11:42'!
test02UnExtractorConUnTrozoDeMaderaExtraeMenasSegunLaEnergiaGenerada
	| extractor menasExtraidas combustible |
	
	extractor := self extractorConMotorUniversalConDesgaste: 0.
	combustible := OrderedCollection with: self unaUnidadDeMadera.
	
	menasExtraidas := self extraerMenasCon: extractor alimentadoCon: combustible.

	self assert: (13*joule) // self costoDeExtraccionPorMena equals: menasExtraidas size.
	self assert: (13*joule) \\ self costoDeExtraccionPorMena equals: extractor energiaDisponible.
! !

!ExtractorTest methodsFor: 'tests con motor universal' stamp: 'VDM 10/20/2022 22:14:14'!
test03UnExtractorConUnaMenaDeCarbonExtraeMenasSegunLaEnergiaGenerada
	| extractor menasExtraidas combustible |
	extractor := self extractorConMotorUniversalConDesgaste: 0.
	combustible := OrderedCollection with: self unaUnidadDeCarbon.
	menasExtraidas := self extraerMenasCon: extractor alimentadoCon: combustible.
	self assert: (26*joule) // self costoDeExtraccionPorMena equals: menasExtraidas size.
	self assert: (26*joule) \\ self costoDeExtraccionPorMena equals: extractor energiaDisponible.
! !

!ExtractorTest methodsFor: 'tests con motor universal' stamp: 'VDM 10/20/2022 22:14:39'!
test04UnExtractorConUnLitroDeGasoilExtraeMenasSegunLaEnergiaGenerada
	| extractor menasExtraidas combustible |
	extractor := self extractorConMotorUniversalConDesgaste: 0.
	
	combustible := OrderedCollection with: self unaUnidadDeGasoil.
	menasExtraidas := self extraerMenasCon: extractor alimentadoCon: combustible.
	
	self assert: (100*joule) // self costoDeExtraccionPorMena equals: menasExtraidas size.	
	self assert: (100*joule) \\ self costoDeExtraccionPorMena equals: extractor energiaDisponible.
! !

!ExtractorTest methodsFor: 'tests con motor universal' stamp: 'VDM 10/20/2022 22:15:29'!
test05UnExtractorMasDeUnaUnidadDeCombustibleExtraeMenasSegunLaEnergiaGenerada
	| extractor menasExtraidas combustible |
	extractor := self extractorConMotorUniversalConDesgaste: 0.
	
	combustible := OrderedCollection 	with: self unaUnidadDeMadera 	with: self unaUnidadDeMadera.
	menasExtraidas := self extraerMenasCon: extractor alimentadoCon: combustible.
	
	self assert: (2*13*joule) // self costoDeExtraccionPorMena equals: menasExtraidas size.
	self assert: (2*13*joule) \\ self costoDeExtraccionPorMena equals: extractor energiaDisponible.
! !

!ExtractorTest methodsFor: 'tests con motor universal' stamp: 'VDM 10/20/2022 22:16:17'!
test06UnExtractorConDiferentesTiposDeCombustibleExtraeMenasSegunLaEnergiaGenerada
	| extractor menasExtraidas combustible |
	extractor := self extractorConMotorUniversalConDesgaste: 0.
	
	combustible := OrderedCollection 	 	
		with: self unaUnidadDeCarbon 
		with: self unaUnidadDeGasoil.
	menasExtraidas := self extraerMenasCon: extractor alimentadoCon: combustible.
	
	self assert: ((26*joule) + (100*joule )) // self costoDeExtraccionPorMena equals: menasExtraidas size.
	self assert: ((26*joule) + (100*joule )) \\ self costoDeExtraccionPorMena equals: extractor energiaDisponible.
! !

!ExtractorTest methodsFor: 'tests con motor universal' stamp: 'VDM 10/20/2022 22:23:30'!
test10UnExtractorDeCarbonPuedeUsarSuProductoComoCombustible
	| extractor menasDeCarbonExtraidas combustible |
	extractor := self extractorConMotorUniversalConDesgaste: 0.
	
	combustible := OrderedCollection with: self unaUnidadDeMadera.
	menasDeCarbonExtraidas := self extraerMenasCon: extractor alimentadoCon: combustible.
	
	menasDeCarbonExtraidas := self extraerMenasCon: extractor alimentadoCon: (menasDeCarbonExtraidas first: 1).

	self assert: (29*joule) // self costoDeExtraccionPorMena equals: menasDeCarbonExtraidas size.
	self assert: (29*joule) \\ self costoDeExtraccionPorMena equals: extractor energiaDisponible.
! !


!ExtractorTest methodsFor: 'tests con motor de solidos' stamp: 'VDM 10/20/2022 22:24:07'!
test07UnExtractorConMotorDeSolidosOptimizaElRendimientoDeLaMadera
	| extractor combustible menasExtraidas |
	extractor := self extractorConMotorDeSolidosConDesgaste: 0.
	
	combustible := OrderedCollection with: self unaUnidadDeMadera.
	menasExtraidas := self extraerMenasCon: extractor alimentadoCon: combustible.
	
	self assert: (26*joule) // self costoDeExtraccionPorMena equals: menasExtraidas size.
	self assert: (26*joule) \\ self costoDeExtraccionPorMena equals: extractor energiaDisponible.
! !

!ExtractorTest methodsFor: 'tests con motor de solidos' stamp: 'VDM 10/20/2022 22:24:27'!
test08UnExtractorConMotorDeSolidosOptimizaElRendimientoDelCarbon
	| extractor combustible menasExtraidas |
	extractor := self extractorConMotorDeSolidosConDesgaste: 0.
	
	combustible := OrderedCollection with: self unaUnidadDeCarbon.
	menasExtraidas := self extraerMenasCon: extractor alimentadoCon: combustible.
	
	self assert: (52*joule) // self costoDeExtraccionPorMena equals: menasExtraidas size.
	self assert: (52*joule) \\ self costoDeExtraccionPorMena equals: extractor energiaDisponible.
! !

!ExtractorTest methodsFor: 'tests con motor de solidos' stamp: 'VDM 10/20/2022 22:24:49'!
test09UnExtractorConMotorDeSolidosDegradaElRendimientoDelGasoil
	| extractor combustible menasExtraidas |
	extractor := self extractorConMotorDeSolidosConDesgaste: 0.
	
	combustible := OrderedCollection with: self unaUnidadDeGasoil.
	menasExtraidas := self extraerMenasCon: extractor alimentadoCon: combustible.
	
	self assert: (25*joule) // self costoDeExtraccionPorMena equals: menasExtraidas size.
	self assert: (25*joule) \\ self costoDeExtraccionPorMena equals: extractor energiaDisponible.
! !


!ExtractorTest methodsFor: 'tests con motor con desgaste' stamp: 'VDM 10/20/2022 22:25:26'!
test11UnExtractorConMotorUniversalDesgastadoTieneUnPeorRendimiento
	| extractor menasExtraidas combustible |
	extractor := self extractorConMotorUniversalConDesgaste: 0.5.
	combustible := OrderedCollection with: self unaUnidadDeGasoil.
	menasExtraidas := self extraerMenasCon: extractor alimentadoCon: combustible.
	
	self assert: ((1 - 0.5)*100*joule) // self costoDeExtraccionPorMena equals: menasExtraidas size.
	self assert: ((1 - 0.5)*100*joule) \\ self costoDeExtraccionPorMena equals: extractor energiaDisponible.
! !

!ExtractorTest methodsFor: 'tests con motor con desgaste' stamp: 'VDM 10/20/2022 22:25:52'!
test12UnExtractorConMotorDeSolidosDesgastadoTieneUnPeorRendimiento
	| extractor menasExtraidas combustible |
	extractor := self extractorConMotorDeSolidosConDesgaste: 0.5.
	combustible := OrderedCollection with: self unaUnidadDeCarbon .
	menasExtraidas := self extraerMenasCon: extractor alimentadoCon: combustible.
	
	self assert: ((1 - 0.5)*52*joule) // self costoDeExtraccionPorMena equals: menasExtraidas size.
	self assert: ((1 - 0.5)*52*joule) \\ self costoDeExtraccionPorMena equals: extractor energiaDisponible.
! !


!ExtractorTest methodsFor: 'extractores' stamp: 'UM 10/20/2022 19:20:08'!
extractorConMotorDeSolidosConDesgaste: unNivelDeDesgaste
	| extractor motor |
	extractor := Extractor deCarbon.
	
	motor := MotorDeSolidos new.
	motor desgastate: unNivelDeDesgaste.	
	extractor motor: motor.
	
	^extractor
! !

!ExtractorTest methodsFor: 'extractores' stamp: 'UM 10/20/2022 19:23:22'!
extractorConMotorUniversalConDesgaste: unNivelDeDesgaste
	| extractor motor |
	extractor := Extractor deCarbon.
	
	motor := MotorUniversal new.
	motor desgastate: unNivelDeDesgaste.
	
	extractor motor: motor.
	
	^extractor
! !

!ExtractorTest methodsFor: 'extractores' stamp: 'VDM 10/20/2022 22:07:45'!
extraerMenasCon: unExtractor alimentadoCon: unCombustible

	unExtractor alimentarEnergiaCon: unCombustible.

	^ unExtractor extraer.! !


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


!Extractor methodsFor: 'initialization' stamp: 'UM 10/20/2022 19:28:16'!
initializeWithMaterial: material 
	energiaActual := 0 * joule.	
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

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Extractor class' category: 'AlgoIII-2021-1C-1erParcial'!
Extractor class
	instanceVariableNames: ''!

!Extractor class methodsFor: 'as yet unclassified' stamp: 'UM 10/20/2022 19:14:54'!
deCarbon
	^self new initializeWithMaterial: UnaMenaDeCarbon new.! !


!classDefinition: #Motor category: 'AlgoIII-2021-1C-1erParcial'!
Object subclass: #Motor
	instanceVariableNames: 'tipo nivelDeDesgaste'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AlgoIII-2021-1C-1erParcial'!

!Motor methodsFor: 'private' stamp: 'UM 10/19/2022 17:29:35'!
convertirAUnidadDeCombustible: unaUnidadDeCombustible

	self subclassResponsibility.! !

!Motor methodsFor: 'private' stamp: 'UM 10/20/2022 20:16:36'!
transformarEnEnergiaUnaUnidad: unaUnidadDeCombustible
	self subclassResponsibility.! !


!Motor methodsFor: 'funcionamiento' stamp: 'UM 10/19/2022 17:04:37'!
transformarEnEnergia: unidadesDeCombustible
	
	^unidadesDeCombustible sum: [:unidadDeCombustible | self transformarEnEnergiaUnaUnidad: unidadDeCombustible] ifEmpty: [0*joule].! !


!Motor methodsFor: 'accessing' stamp: 'UM 10/20/2022 19:30:10'!
desgastate

	self subclassResponsibility.! !

!Motor methodsFor: 'accessing' stamp: 'UM 10/20/2022 20:32:22'!
energiaDeUnLitroDeGasoil

	self subclassResponsibility. ! !

!Motor methodsFor: 'accessing' stamp: 'UM 10/20/2022 20:32:39'!
energiaDeUnTrozoDeMadera

	self subclassResponsibility.! !

!Motor methodsFor: 'accessing' stamp: 'UM 10/20/2022 20:32:33'!
energiaDeUnaMenaDeCarbon

	self subclassResponsibility.! !


!classDefinition: #MotorDeSolidos category: 'AlgoIII-2021-1C-1erParcial'!
Motor subclass: #MotorDeSolidos
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AlgoIII-2021-1C-1erParcial'!

!MotorDeSolidos methodsFor: 'private' stamp: 'UM 10/20/2022 20:16:25'!
transformarEnEnergiaUnaUnidad: unaUnidadDeCombustible

	^ (unaUnidadDeCombustible energiaDeUnaUnidadDeCombustibleSoySolido: self) * (1 - nivelDeDesgaste ).! !


!MotorDeSolidos methodsFor: 'inicializacion' stamp: 'UM 10/20/2022 19:39:04'!
initialize
	tipo := #motorDeSolidos.
	nivelDeDesgaste := 0.! !


!MotorDeSolidos methodsFor: 'acceso' stamp: 'UM 10/20/2022 19:21:19'!
desgastate: unNivelDeDesgaste

	nivelDeDesgaste := nivelDeDesgaste + unNivelDeDesgaste.! !

!MotorDeSolidos methodsFor: 'acceso' stamp: 'UM 10/20/2022 20:30:20'!
energiaDeUnLitroDeGasoil

	^ (25 * joule).! !

!MotorDeSolidos methodsFor: 'acceso' stamp: 'UM 10/20/2022 20:30:15'!
energiaDeUnTrozoDeMadera

	^ (26 * joule).! !

!MotorDeSolidos methodsFor: 'acceso' stamp: 'UM 10/20/2022 20:30:09'!
energiaDeUnaMenaDeCarbon

	^ (52 * joule).! !


!classDefinition: #MotorDesconocido category: 'AlgoIII-2021-1C-1erParcial'!
Motor subclass: #MotorDesconocido
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AlgoIII-2021-1C-1erParcial'!

!MotorDesconocido methodsFor: 'inicializacion' stamp: 'UM 10/20/2022 19:39:09'!
initialize
	tipo := #motorDesconocido.
	nivelDeDesgaste := 0.! !


!MotorDesconocido methodsFor: 'acceso' stamp: 'UM 10/20/2022 19:22:22'!
desgastate: unNivelDeDesgaste

	^self.! !

!MotorDesconocido methodsFor: 'acceso' stamp: 'UM 10/20/2022 20:22:50'!
energiaDeUnLitroDeGasoil

	^self.! !

!MotorDesconocido methodsFor: 'acceso' stamp: 'UM 10/20/2022 20:23:38'!
energiaDeUnTrozoDeMadera

	^self.! !

!MotorDesconocido methodsFor: 'acceso' stamp: 'UM 10/20/2022 20:25:19'!
energiaDeUnaMenaDeCarbon

	^self.! !


!classDefinition: #MotorUniversal category: 'AlgoIII-2021-1C-1erParcial'!
Motor subclass: #MotorUniversal
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AlgoIII-2021-1C-1erParcial'!

!MotorUniversal methodsFor: 'inicializacion' stamp: 'UM 10/20/2022 19:39:15'!
initialize
	tipo := #motorUniversal.
	nivelDeDesgaste := 0.! !


!MotorUniversal methodsFor: 'acceso' stamp: 'UM 10/20/2022 19:21:39'!
desgastate: unNivelDeDesgaste

	nivelDeDesgaste := unNivelDeDesgaste.! !

!MotorUniversal methodsFor: 'acceso' stamp: 'UM 10/20/2022 20:31:14'!
energiaDeUnLitroDeGasoil

	^ (100 * joule).! !

!MotorUniversal methodsFor: 'acceso' stamp: 'UM 10/20/2022 20:30:34'!
energiaDeUnTrozoDeMadera

	^ (13 * joule).! !

!MotorUniversal methodsFor: 'acceso' stamp: 'UM 10/20/2022 20:30:38'!
energiaDeUnaMenaDeCarbon

	^ (26 * joule).! !


!MotorUniversal methodsFor: 'privado' stamp: 'UM 10/20/2022 20:16:53'!
transformarEnEnergiaUnaUnidad: unaUnidadDeCombustible

	^ (unaUnidadDeCombustible energiaDeUnaUnidadDeCombustibleSoyUniversal: self) * (1 - nivelDeDesgaste ).! !


!classDefinition: #UnidadDeCombustible category: 'AlgoIII-2021-1C-1erParcial'!
Object subclass: #UnidadDeCombustible
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AlgoIII-2021-1C-1erParcial'!

!UnidadDeCombustible methodsFor: 'acceso' stamp: 'UM 10/20/2022 19:41:56'!
energiaDeUnaUnidadDeCombustibleSoySolido

	self error: 'Tipo de combustible desconocido: ', 	self asString.! !

!UnidadDeCombustible methodsFor: 'acceso' stamp: 'UM 10/20/2022 19:55:33'!
energiaDeUnaUnidadDeCombustibleSoyUniversal

	self error: 'Tipo de combustible desconocido: ', 	self asString.! !


!classDefinition: #UnLitroDeGasoil category: 'AlgoIII-2021-1C-1erParcial'!
UnidadDeCombustible subclass: #UnLitroDeGasoil
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AlgoIII-2021-1C-1erParcial'!

!UnLitroDeGasoil methodsFor: 'acceso' stamp: 'UM 10/20/2022 20:09:55'!
energiaDeUnaUnidadDeCombustibleSoySolido: unMotorDeSolidos

	^unMotorDeSolidos energiaDeUnLitroDeGasoil
	"^(25 * joule)"! !

!UnLitroDeGasoil methodsFor: 'acceso' stamp: 'UM 10/20/2022 20:17:36'!
energiaDeUnaUnidadDeCombustibleSoyUniversal: unMotorUniversal

	^unMotorUniversal energiaDeUnLitroDeGasoil
	"^(100 * joule)"! !


!classDefinition: #UnTrozoDeMadera category: 'AlgoIII-2021-1C-1erParcial'!
UnidadDeCombustible subclass: #UnTrozoDeMadera
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AlgoIII-2021-1C-1erParcial'!

!UnTrozoDeMadera methodsFor: 'acceso' stamp: 'UM 10/20/2022 20:19:12'!
energiaDeUnaUnidadDeCombustibleSoySolido: unMotorDeSolidos

	^unMotorDeSolidos energiaDeUnTrozoDeMadera.
	
	"^(26 * joule)"! !

!UnTrozoDeMadera methodsFor: 'acceso' stamp: 'UM 10/20/2022 20:19:21'!
energiaDeUnaUnidadDeCombustibleSoyUniversal: unMotorUniversal

	^unMotorUniversal energiaDeUnTrozoDeMadera.
	"^(13 * joule)"! !


!classDefinition: #UnaMenaDeCarbon category: 'AlgoIII-2021-1C-1erParcial'!
UnidadDeCombustible subclass: #UnaMenaDeCarbon
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AlgoIII-2021-1C-1erParcial'!

!UnaMenaDeCarbon methodsFor: 'acceso' stamp: 'UM 10/20/2022 20:20:14'!
energiaDeUnaUnidadDeCombustibleSoySolido: unMotorDeSolidos

	^unMotorDeSolidos energiaDeUnaMenaDeCarbon.

	"^(52 * joule)"! !

!UnaMenaDeCarbon methodsFor: 'acceso' stamp: 'UM 10/20/2022 20:19:46'!
energiaDeUnaUnidadDeCombustibleSoyUniversal: unMotorUniversal

	^unMotorUniversal energiaDeUnaMenaDeCarbon.

	"^(26 * joule)"! !
