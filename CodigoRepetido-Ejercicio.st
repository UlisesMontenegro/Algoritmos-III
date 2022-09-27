!classDefinition: #CantSuspend category: 'CodigoRepetido-Ejercicio'!
Error subclass: #CantSuspend
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!


!classDefinition: #EmptyName category: 'CodigoRepetido-Ejercicio'!
Error subclass: #EmptyName
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

!CustomerBookTest methodsFor: 'testing' stamp: 'UM 9/27/2022 14:31:13'!
test01AddingCustomerShouldNotTakeMoreThan50Milliseconds

	| addingCustomerDuration maxDuration|
	maxDuration := 50*millisecond.
	addingCustomerDuration := self blockExecuteDuration: [customerBook addCustomerNamed: 'John Lennon'].

	self assertBlockExecuteDuration: addingCustomerDuration isLessThan: (maxDuration).! !

!CustomerBookTest methodsFor: 'testing' stamp: 'UM 9/27/2022 14:32:01'!
test02RemovingCustomerShouldNotTakeMoreThan100Milliseconds

	| paulMcCartney removingCustomerDuration maxDuration|
	maxDuration := 100 * millisecond.
	paulMcCartney := 'Paul McCartney'.
	customerBook addCustomerNamed: paulMcCartney.
	removingCustomerDuration := self blockExecuteDuration: [customerBook removeCustomerNamed: paulMcCartney.].
	
	self assertBlockExecuteDuration: removingCustomerDuration isLessThan: (maxDuration).! !

!CustomerBookTest methodsFor: 'testing' stamp: 'UM 9/27/2022 15:10:55'!
test03CanNotAddACustomerWithEmptyName 
	| assertionA assertionB |
	
	assertionA := [:anError | anError messageText = CustomerBook customerCanNotBeEmptyErrorMessage].
	assertionB := (customerBook isEmpty).
	[ customerBook addCustomerNamed: ''. self fail ]
	on: Error
	do: [self verifyErrorUnderVerification1: assertionA andVerification2: assertionB].! !

!CustomerBookTest methodsFor: 'testing' stamp: 'UM 9/27/2022 15:12:04'!
test04CanNotRemoveAnInvalidCustomer
	| johnLennon assertionA assertionB numberOfCustomersExpected|
	numberOfCustomersExpected := 1.
	johnLennon := 'John Lennon'.	customerBook addCustomerNamed: johnLennon.
	assertionA := (customerBook numberOfCustomers = numberOfCustomersExpected).
	assertionB := (customerBook includesCustomerNamed: johnLennon).
	[ customerBook removeCustomerNamed: 'Paul McCartney'. 	self fail ]
	on: Error
	do: [self verifyErrorUnderVerification1:  assertionA andVerification2: assertionB].
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'UM 9/27/2022 14:28:18'!
test05SuspendingACustomerShouldNotRemoveItFromCustomerBook
	| paulMcCartney numberOfCustomersExpected numberOfSuspendedCustomersExpected numberOfActiveCustomersExpected expectedStatus|
	numberOfCustomersExpected := 1.
	numberOfSuspendedCustomersExpected := 1.
	numberOfActiveCustomersExpected := 0.
	expectedStatus := OrderedCollection with: numberOfActiveCustomersExpected with: numberOfSuspendedCustomersExpected with: numberOfCustomersExpected.
	
	paulMcCartney := 'Paul McCartney'.	customerBook addCustomerNamed: paulMcCartney.	customerBook suspendCustomerNamed: paulMcCartney.
	self assertCustomerBookStatusIsEqualTo: expectedStatus.
	self assert: (customerBook includesCustomerNamed: paulMcCartney).! !

!CustomerBookTest methodsFor: 'testing' stamp: 'UM 9/27/2022 14:30:17'!
test06RemovingASuspendedCustomerShouldRemoveItFromCustomerBook
	| paulMcCartney numberOfCustomersExpected numberOfSuspendedCustomersExpected numberOfActiveCustomersExpected expectedStatus|
	
	numberOfCustomersExpected := 0.
	numberOfSuspendedCustomersExpected := 0.
	numberOfActiveCustomersExpected := 0.
	expectedStatus := OrderedCollection with: numberOfActiveCustomersExpected with: numberOfSuspendedCustomersExpected with: numberOfCustomersExpected.
	
	paulMcCartney := 'Paul McCartney'.	customerBook addCustomerNamed: paulMcCartney.	customerBook suspendCustomerNamed: paulMcCartney.	customerBook removeCustomerNamed: paulMcCartney.
	self assertCustomerBookStatusIsEqualTo: expectedStatus.
	self deny: (customerBook includesCustomerNamed: paulMcCartney).! !

!CustomerBookTest methodsFor: 'testing' stamp: 'UM 9/27/2022 15:13:31'!
test07CanNotSuspendAnInvalidCustomer
	| johnLennon assertionA assertionB numberOfCustomersExpected|
	numberOfCustomersExpected := 1.
	johnLennon := 'John Lennon'.	customerBook addCustomerNamed: johnLennon.	assertionA := (customerBook numberOfCustomers = numberOfCustomersExpected).
	assertionB := (customerBook includesCustomerNamed: johnLennon).
	[ customerBook suspendCustomerNamed: 'Ringo Starr'. 	self fail ]
	on: Error
	do: [self verifyErrorUnderVerification1: assertionA andVerification2: assertionB].! !

!CustomerBookTest methodsFor: 'testing' stamp: 'UM 9/27/2022 15:14:17'!
test08CanNotSuspendAnAlreadySuspendedCustomer
	| johnLennon assertionA assertionB numberOfCustomersExpected|
	numberOfCustomersExpected := 1.
	johnLennon := 'John Lennon'.	customerBook addCustomerNamed: johnLennon.	customerBook suspendCustomerNamed: johnLennon.
	assertionA := (customerBook numberOfCustomers = numberOfCustomersExpected).
	assertionB := (customerBook includesCustomerNamed: johnLennon).
	[ customerBook suspendCustomerNamed: johnLennon. 	self fail ]
	on: Error
	do: [self verifyErrorUnderVerification1: assertionA andVerification2: assertionB].! !


!CustomerBookTest methodsFor: 'customer testing management' stamp: 'UM 9/27/2022 12:17:29'!
assertBlockExecuteDuration: aMeasuredTime isLessThan: timeLimit
	
	aMeasuredTime < timeLimit value.! !

!CustomerBookTest methodsFor: 'customer testing management' stamp: 'UM 9/27/2022 14:26:52'!
assertCustomerBookStatusIsEqualTo: aCollection

	|currentCustomerBookStatus|
	
	currentCustomerBookStatus := OrderedCollection with: customerBook numberOfActiveCustomers with: customerBook numberOfSuspendedCustomers with: customerBook numberOfCustomers.
	
	self assert: currentCustomerBookStatus equals: aCollection! !

!CustomerBookTest methodsFor: 'customer testing management' stamp: 'UM 9/27/2022 12:23:14'!
blockExecuteDuration: aBlock

	|millisecondsBeforeRunning millisecondsAfterRunning|

	millisecondsBeforeRunning := self timeInMilliseconds.
	aBlock value.
	millisecondsAfterRunning := self timeInMilliseconds.

	^self timeElapsedBetween: millisecondsBeforeRunning and: millisecondsAfterRunning.! !

!CustomerBookTest methodsFor: 'customer testing management' stamp: 'UM 9/27/2022 12:10:08'!
timeElapsedBetween: finalTime and: initialTime
	^ finalTime - initialTime.! !

!CustomerBookTest methodsFor: 'customer testing management' stamp: 'UM 9/27/2022 12:22:07'!
timeInMilliseconds
	
	^ Time millisecondClockValue * millisecond.! !

!CustomerBookTest methodsFor: 'customer testing management' stamp: 'UM 9/27/2022 15:15:09'!
verifyErrorUnderVerification1: verification1 andVerification2: verification2

	[:anError | anError class = EmptyName ifTrue: [self assert: (verification1 value: anError). self assert: verification2. ^self].
			((anError class = NotFound) or: (anError class = CantSuspend)) ifFalse: [^self fail].
			self assert: verification1.
			self assert: verification2.
			^self.]! !


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


!CustomerBook methodsFor: 'customer management' stamp: 'VDM 9/27/2022 08:49:26'!
addCustomerNamed: aName

	aName isEmpty ifTrue: [ ^ (self signalCustomerNameCannotBeEmpty) signal ].
	((active includes: aName) or: [suspended includes: aName]) ifTrue: [ ^(self signalCustomerAlreadyExists) signal].
	
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

!CustomerBook methodsFor: 'customer management' stamp: 'UM 9/27/2022 15:36:26'!
removeCustomer: aName fromInstanceVariable: anInstanceVariable

	1 to: anInstanceVariable size do: 
	[ :index |
		aName = (anInstanceVariable at: index)
			ifTrue: [
				anInstanceVariable removeAt: index.
				^ aName 
			] 
	].

	^NotFound signal.! !

!CustomerBook methodsFor: 'customer management' stamp: 'VDM 9/27/2022 17:09:27'!
removeCustomerNamed: aName 
	|result|
	
	[result := self removeCustomer: aName fromInstanceVariable: active. ^result.]
	on: NotFound do: [^ self removeCustomer: aName fromInstanceVariable: suspended].
	
	
	"result := self removeCustomer: aName fromInstanceVariable: active.
	result = NotFound ifTrue: [^	self removeCustomer: aName fromInstanceVariable: suspended].
	^result. "
	
	"1 to: active size do: 
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

	^ NotFound signal."
! !

!CustomerBook methodsFor: 'customer management' stamp: 'HernanWilkinson 7/6/2011 17:52'!
signalCustomerAlreadyExists 

	self error: self class customerAlreadyExistsErrorMessage! !

!CustomerBook methodsFor: 'customer management' stamp: 'VDM 9/27/2022 08:42:52'!
signalCustomerNameCannotBeEmpty 

	^ (EmptyName new) messageText: self class customerCanNotBeEmptyErrorMessage.
	"self error: self class customerCanNotBeEmptyErrorMessage "! !

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
