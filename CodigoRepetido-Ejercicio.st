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

!CustomerBookTest methodsFor: 'testing' stamp: 'UM 9/27/2022 12:43:17'!
test01AddingCustomerShouldNotTakeMoreThan50Milliseconds

	| addingCustomerDuration |
	addingCustomerDuration := self blockExecuteDuration: [customerBook addCustomerNamed: 'John Lennon'].

	self assertBlockExecuteDuration: addingCustomerDuration isLessThan: (50 * millisecond).! !

!CustomerBookTest methodsFor: 'testing' stamp: 'UM 9/27/2022 12:43:47'!
test02RemovingCustomerShouldNotTakeMoreThan100Milliseconds

	| paulMcCartney removingCustomerDuration |
	paulMcCartney := 'Paul McCartney'.
	customerBook addCustomerNamed: paulMcCartney.
	removingCustomerDuration := self blockExecuteDuration: [customerBook removeCustomerNamed: paulMcCartney.].
	
	self assertBlockExecuteDuration: removingCustomerDuration isLessThan: (100 * millisecond).! !

!CustomerBookTest methodsFor: 'testing' stamp: 'UM 9/27/2022 12:44:36'!
test03CanNotAddACustomerWithEmptyName 
	| blockToBeEvaluated assertionA assertionB |
	
	blockToBeEvaluated := [ customerBook addCustomerNamed: ''. self fail ].	
	assertionA := [:elError | elError messageText = CustomerBook customerCanNotBeEmptyErrorMessage].
	assertionB := (customerBook isEmpty).
	
	self verifyErrorInBlock: blockToBeEvaluated underVerification1: assertionA andVerification2: assertionB.! !

!CustomerBookTest methodsFor: 'testing' stamp: 'UM 9/27/2022 12:45:07'!
test04CanNotRemoveAnInvalidCustomer
	| johnLennon assertionA assertionB blockToBeEvaluated |
	johnLennon := 'John Lennon'.	customerBook addCustomerNamed: johnLennon.	blockToBeEvaluated := [ customerBook removeCustomerNamed: 'Paul McCartney'. 	self fail ].
	assertionA := (customerBook numberOfCustomers = 1).
	assertionB := (customerBook includesCustomerNamed: johnLennon).
	
	self verifyErrorInBlock:  blockToBeEvaluated underVerification1: assertionA andVerification2: assertionB.! !

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

!CustomerBookTest methodsFor: 'testing' stamp: 'UM 9/27/2022 12:45:53'!
test07CanNotSuspendAnInvalidCustomer
	| johnLennon assertionA assertionB blockToBeEvaluated |
	johnLennon := 'John Lennon'.	customerBook addCustomerNamed: johnLennon.	blockToBeEvaluated := [ customerBook suspendCustomerNamed: 'Ringo Starr'. 	self fail ].
	assertionA := (customerBook numberOfCustomers = 1).
	assertionB := (customerBook includesCustomerNamed: johnLennon).
	
	self verifyErrorInBlock: blockToBeEvaluated underVerification1: assertionA andVerification2: assertionB. ! !

!CustomerBookTest methodsFor: 'testing' stamp: 'UM 9/27/2022 12:46:17'!
test08CanNotSuspendAnAlreadySuspendedCustomer
	| johnLennon assertionA assertionB blockToBeEvaluated |
	johnLennon := 'John Lennon'.	customerBook addCustomerNamed: johnLennon.	customerBook suspendCustomerNamed: johnLennon.	blockToBeEvaluated := [ customerBook suspendCustomerNamed: johnLennon. 	self fail ].
	assertionA := (customerBook numberOfCustomers = 1).
	assertionB := (customerBook includesCustomerNamed: johnLennon).
	
	self verifyErrorInBlock: blockToBeEvaluated underVerification1: assertionA andVerification2: assertionB. ! !


!CustomerBookTest methodsFor: 'customer testing management' stamp: 'UM 9/27/2022 12:17:29'!
assertBlockExecuteDuration: aMeasuredTime isLessThan: timeLimit
	
	aMeasuredTime < timeLimit value.! !

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

!CustomerBookTest methodsFor: 'customer testing management' stamp: 'UM 9/27/2022 12:35:56'!
verifyErrorInBlock: aBlock underVerification1: verification1 andVerification2: verification2
	
	[ aBlock ] value
		on: Error
		do: [ :anError | 
			anError class = EmptyName ifTrue:[
				self assert: (verification1 value: anError).
				self assert: verification2.
				^ self.
				].
			anError class = NotFound ifTrue:[
				self assert: verification1.
				self assert: verification2.
				^ self.
				].
			anError class = CantSuspend ifTrue:[
				self assert: verification1.
				self assert: verification2.
				^ self.
				].
			].
	self fail.
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
