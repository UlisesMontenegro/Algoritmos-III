!classDefinition: #CantSuspend category: 'CodigoRepetido-Ejercicio'!
Error subclass: #CantSuspend
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!


!classDefinition: #NotFound category: 'CodigoRepetido-Ejercicio'!
Error subclass: #NotFound
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!


!classDefinition: #CustomerBookTest category: 'CodigoRepetido-Ejercicio'!
TestCase subclass: #CustomerBookTest
	instanceVariableNames: 'customerBook'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBookTest methodsFor: 'abstracciones' stamp: 'VDM 9/27/2022 04:48:32'!
asercionEjecucionEstaDentroDeLimiteDeTiempo: unTiempoMedido conLimite: limiteDeTiempo
	
	self assert: unTiempoMedido < limiteDeTiempo.! !

!CustomerBookTest methodsFor: 'abstracciones' stamp: 'VDM 9/27/2022 05:06:11'!
mensajeANombrar: unBloque
	| millisecondsAfterRunning millisecondsBeforeRunning |
	
	millisecondsBeforeRunning := self tiempoEnMilisegundos.
	unBloque value.
	millisecondsAfterRunning := self tiempoEnMilisegundos.
	^ self tiempoTranscurridoEntre: millisecondsAfterRunning y: millisecondsBeforeRunning.! !

!CustomerBookTest methodsFor: 'abstracciones' stamp: 'VDM 9/27/2022 05:05:54'!
tiempoEnMilisegundos
	
	^ Time millisecondClockValue * millisecond.! !

!CustomerBookTest methodsFor: 'abstracciones' stamp: 'VDM 9/27/2022 05:05:06'!
tiempoTranscurridoEntre: tiempoFinal y: tiempoInicial
	^ tiempoFinal - tiempoInicial.! !


!CustomerBookTest methodsFor: 'testing' stamp: 'VDM 9/27/2022 04:49:28'!
test01AddingCustomerShouldNotTakeMoreThan50Milliseconds

	| tiempoQueDemoraAgregarUnCliente |
	
	"customerBook := CustomerBook new."
	
	tiempoQueDemoraAgregarUnCliente := self mensajeANombrar: [customerBook addCustomerNamed: 'John Lennon'].
	
	"millisecondsBeforeRunning := Time millisecondClockValue * millisecond.
	customerBook addCustomerNamed: 'John Lennon'.
	millisecondsAfterRunning := Time millisecondClockValue * millisecond."
	
	self asercionEjecucionEstaDentroDeLimiteDeTiempo: tiempoQueDemoraAgregarUnCliente conLimite: (50 * millisecond).
	
	"self assert: tiempoQueDemoraAgregarUnCliente < (50 * millisecond)"
	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'VDM 9/27/2022 04:50:13'!
test02RemovingCustomerShouldNotTakeMoreThan100Milliseconds

	| paulMcCartney tiempoQueDemoraEliminarUnCliente |
	
	"customerBookViejo := CustomerBook new."
	paulMcCartney := 'Paul McCartney'.
	
	customerBook addCustomerNamed: paulMcCartney.
	  
	tiempoQueDemoraEliminarUnCliente := self mensajeANombrar: [customerBook removeCustomerNamed: paulMcCartney.].
	
	"millisecondsBeforeRunning := Time millisecondClockValue * millisecond.
	customerBook removeCustomerNamed: paulMcCartney.
	millisecondsAfterRunning := Time millisecondClockValue * millisecond."
	
	self asercionEjecucionEstaDentroDeLimiteDeTiempo: tiempoQueDemoraEliminarUnCliente conLimite: (100 * millisecond).
	
	"self assert: tiempoQueDemoraEliminarUnCliente < (100 * millisecond)"
	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'VDM 9/26/2022 15:38:31'!
test03CanNotAddACustomerWithEmptyName 

	"customerBookViejo := CustomerBook new."

	[ customerBook addCustomerNamed: ''.
	self fail ]
		on: Error 
		do: [ :anError | 
			self assert: anError messageText = CustomerBook customerCanNotBeEmptyErrorMessage.
			self assert: customerBook isEmpty ]! !

!CustomerBookTest methodsFor: 'testing' stamp: 'VDM 9/26/2022 15:39:18'!
test04CanNotRemoveAnInvalidCustomer
	
	| johnLennon |
			
	"customerBookViejo := CustomerBook new."
	johnLennon := 'John Lennon'.
	customerBook addCustomerNamed: johnLennon.
	
	[ customerBook removeCustomerNamed: 'Paul McCartney'.
	self fail ]
		on: NotFound 
		do: [ :anError | 
			self assert: customerBook numberOfCustomers = 1.
			self assert: (customerBook includesCustomerNamed: johnLennon) ]
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'VDM 9/26/2022 15:40:10'!
test05SuspendingACustomerShouldNotRemoveItFromCustomerBook

	| paulMcCartney|
	
	"customerBookViejo := CustomerBook new."
	paulMcCartney := 'Paul McCartney'.
	
	customerBook addCustomerNamed: paulMcCartney.
	customerBook suspendCustomerNamed: paulMcCartney.
	
	self assert: 0 equals: customerBook numberOfActiveCustomers.
	self assert: 1 equals: customerBook numberOfSuspendedCustomers.
	self assert: 1 equals: customerBook numberOfCustomers.
	self assert: (customerBook includesCustomerNamed: paulMcCartney).
	

	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'VDM 9/26/2022 15:41:24'!
test06RemovingASuspendedCustomerShouldRemoveItFromCustomerBook

	| paulMcCartney|
	
	"customerBookViejo := CustomerBook new."
	paulMcCartney := 'Paul McCartney'.
	
	customerBook addCustomerNamed: paulMcCartney.
	customerBook suspendCustomerNamed: paulMcCartney.
	customerBook removeCustomerNamed: paulMcCartney.
	
	self assert: 0 equals: customerBook numberOfActiveCustomers.
	self assert: 0 equals: customerBook numberOfSuspendedCustomers.
	self assert: 0 equals: customerBook numberOfCustomers.
	self deny: (customerBook includesCustomerNamed: paulMcCartney).


	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'VDM 9/26/2022 15:42:35'!
test07CanNotSuspendAnInvalidCustomer
	
	| johnLennon |
			
	"customerBook := CustomerBook new."
	johnLennon := 'John Lennon'.
	customerBook addCustomerNamed: johnLennon.
	
	[ customerBook suspendCustomerNamed: 'Ringo Starr'.
	self fail ]
		on: CantSuspend 
		do: [ :anError | 
			self assert: customerBook numberOfCustomers = 1.
			self assert: (customerBook includesCustomerNamed: johnLennon) ]
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'VDM 9/26/2022 15:43:12'!
test08CanNotSuspendAnAlreadySuspendedCustomer
	
	| johnLennon |
			
	"customerBookViejo := CustomerBook new."
	johnLennon := 'John Lennon'.
	customerBook addCustomerNamed: johnLennon.
	customerBook suspendCustomerNamed: johnLennon.
	
	[ customerBook suspendCustomerNamed: johnLennon.
	self fail ]
		on: CantSuspend 
		do: [ :anError | 
			self assert: customerBook numberOfCustomers = 1.
			self assert: (customerBook includesCustomerNamed: johnLennon) ]
! !


!CustomerBookTest methodsFor: 'inicializador' stamp: 'VDM 9/26/2022 15:55:55'!
initialize
	customerBook := CustomerBook new.! !


!classDefinition: #CustomerBook category: 'CodigoRepetido-Ejercicio'!
Object subclass: #CustomerBook
	instanceVariableNames: 'suspended active'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBook methodsFor: 'testing' stamp: 'NR 4/3/2019 10:14:26'!
includesCustomerNamed: aName

	^(active includes: aName) or: [ suspended includes: aName ]! !

!CustomerBook methodsFor: 'testing' stamp: 'NR 4/3/2019 10:14:26'!
isEmpty
	
	^active isEmpty and: [ suspended isEmpty ]! !


!CustomerBook methodsFor: 'initialization' stamp: 'NR 4/3/2019 10:14:26'!
initialize

	super initialize.
	active := OrderedCollection new.
	suspended:= OrderedCollection new.! !


!CustomerBook methodsFor: 'customer management' stamp: 'NR 4/3/2019 10:14:26'!
addCustomerNamed: aName

	aName isEmpty ifTrue: [ self signalCustomerNameCannotBeEmpty ].
	((active includes: aName) or: [suspended includes: aName]) ifTrue: [ self signalCustomerAlreadyExists ].
	
	active add: aName ! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 4/3/2019 10:14:26'!
numberOfActiveCustomers
	
	^active size! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 4/3/2019 10:14:26'!
numberOfCustomers
	
	^active size + suspended size! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 9/19/2018 17:36:09'!
numberOfSuspendedCustomers
	
	^suspended size! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 4/3/2019 10:14:26'!
removeCustomerNamed: aName 
 
	1 to: active size do: 
	[ :index |
		aName = (active at: index)
			ifTrue: [
				active removeAt: index.
				^ aName 
			] 
	].

	1 to: suspended size do: 	
	[ :index |
		aName = (suspended at: index)
			ifTrue: [
				suspended removeAt: index.
				^ aName 
			] 
	].
	
	^ NotFound signal.
! !

!CustomerBook methodsFor: 'customer management' stamp: 'HernanWilkinson 7/6/2011 17:52'!
signalCustomerAlreadyExists 

	self error: self class customerAlreadyExistsErrorMessage! !

!CustomerBook methodsFor: 'customer management' stamp: 'HernanWilkinson 7/6/2011 17:51'!
signalCustomerNameCannotBeEmpty 

	self error: self class customerCanNotBeEmptyErrorMessage ! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 4/3/2019 10:14:26'!
suspendCustomerNamed: aName 
	
	(active includes: aName) ifFalse: [^CantSuspend signal].
	
	active remove: aName.
	
	suspended add: aName
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CustomerBook class' category: 'CodigoRepetido-Ejercicio'!
CustomerBook class
	instanceVariableNames: ''!

!CustomerBook class methodsFor: 'error messages' stamp: 'NR 4/30/2020 09:05:18'!
customerAlreadyExistsErrorMessage

	^'Customer Already Exists'! !

!CustomerBook class methodsFor: 'error messages' stamp: 'NR 4/30/2020 09:05:25'!
customerCanNotBeEmptyErrorMessage

	^'Customer Name Cannot Be Empty'! !
