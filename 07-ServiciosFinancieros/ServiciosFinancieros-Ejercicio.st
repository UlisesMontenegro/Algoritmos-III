!classDefinition: #AccountTest category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #AccountTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!AccountTest methodsFor: 'tests' stamp: 'VDM 11/9/2022 18:41:52'!
test01AccountHaveZeroAsBalanceWhenCreated 

	| account |
	
	account := ReceptiveAccount new.

	self assert: 0 equals: account balance
! !

!AccountTest methodsFor: 'tests' stamp: 'VDM 11/9/2022 18:41:51'!
test02DepositIncreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount  new.
	Deposit register: 100 * peso on: account.
		
	self assert: 100 * peso equals: account balance
! !

!AccountTest methodsFor: 'tests' stamp: 'VDM 11/9/2022 18:41:51'!
test03WithdrawDecreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount new.
	Deposit register: 100 * peso on: account.
	Withdraw register: 50 * peso on: account.
		
	self assert: 50 * peso equals: account balance
! !

!AccountTest methodsFor: 'tests' stamp: 'VDM 11/9/2022 18:41:52'!
test04WithdrawValueMustBePositive 

	| account withdrawValue |
	
	account := ReceptiveAccount new.
	withdrawValue := 50 * peso.
	
	self assert: withdrawValue equals: (Withdraw register: withdrawValue on: account) value
! !

!AccountTest methodsFor: 'tests' stamp: 'VDM 11/9/2022 18:41:52'!
test05AccountKnowsRegisteredTransactions 

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit := Deposit register: 100 * peso on: account.
	withdraw := Withdraw register: 50 * peso on: account.
		
	self assert: (account hasRegistered: deposit).
	self assert: (account hasRegistered: withdraw).
! !

!AccountTest methodsFor: 'tests' stamp: 'VDM 11/9/2022 18:41:51'!
test06AccountDoNotKnowNotRegisteredTransactions

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit :=  Deposit for: 100 * peso.
	withdraw := Withdraw for: 50 * peso.
		
	self deny: (account hasRegistered: deposit).
	self deny: (account hasRegistered: withdraw).
! !

!AccountTest methodsFor: 'tests' stamp: 'VDM 11/9/2022 18:41:52'!
test07AccountKnowsItsTransactions 

	| account deposit |
	
	account := ReceptiveAccount new.
	
	deposit := Deposit register: 50 * peso on: account.
		
	self assert: 1 equals: account transactions size.
	self assert: (account transactions includes: deposit).
! !

!AccountTest methodsFor: 'tests' stamp: 'VDM 11/9/2022 19:30:12'!
test08ReceptiveAccountCanRegisterATransfer

	| receptiveAccount senderAccount transfer |
	senderAccount := SenderAccount new.
	receptiveAccount := ReceptiveAccount new.
	
	Deposit register: 100*peso on: senderAccount.
	
	transfer := Transfer transfer: 70*peso from: senderAccount to: receptiveAccount.
	
	self assert: (receptiveAccount hasRegistered: transfer).
! !

!AccountTest methodsFor: 'tests' stamp: 'VDM 11/9/2022 20:11:10'!
test09AlHacerUnaTransferenciaQuedaRegistradaEnAmbasPatas 

	| receptiveAccount transfer senderAccount deposit |
	
	receptiveAccount := ReceptiveAccount new.
	senderAccount := SenderAccount new.
	
	deposit := Deposit register: 50 * peso on: senderAccount.
	transfer := Transfer transfer: 1*peso from: senderAccount to: receptiveAccount.
		
	self assert: 1 equals: receptiveAccount transactions size.
	self assert: (receptiveAccount transactions includes: transfer).
	self assert: 2 equals: senderAccount transactions size.

	self assert: ((senderAccount transactions includes: transfer) and: (senderAccount transactions includes: deposit)).

! !

!AccountTest methodsFor: 'tests' stamp: 'VDM 11/9/2022 20:07:43'!
test10AlhacerUnaTransferenciaAumentaBalanceEnReceptiveAccountYDisminuyeEnSenderAccount

	| receptiveAccount senderAccount|
	
	receptiveAccount := ReceptiveAccount new.
	senderAccount := SenderAccount new.
	
	Deposit register: 50 * peso on: senderAccount.
	Transfer transfer: 1*peso from: senderAccount to: receptiveAccount.
		
	self assert: 1*peso equals: receptiveAccount balance.
	
	self assert: 49*peso equals: senderAccount balance.
! !


!classDefinition: #TransferTest category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #TransferTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!TransferTest methodsFor: 'as yet unclassified' stamp: 'VDM 11/9/2022 19:50:14'!
test01TransferCannotBePerformedTransferValueIsGreaterThanSenderAccountBalance

	| receptiveAccount senderAccount |
	senderAccount := SenderAccount new.
	receptiveAccount := ReceptiveAccount new.
	
	Deposit register: 50*peso on: senderAccount.
	Transfer transfer: 100*peso from: senderAccount to: receptiveAccount.
	
	self assert: 50*peso equals: senderAccount balance.! !

!TransferTest methodsFor: 'as yet unclassified' stamp: 'VDM 11/9/2022 19:56:22'!
test02SenderAccountBalanceDecreasesOnTransferValueAfterTransferIsPerformed

	| receptiveAccount senderAccount |
	senderAccount := SenderAccount new.
	receptiveAccount := ReceptiveAccount new.
	
	Deposit register: 100*peso on: senderAccount.
	Transfer transfer: 50*peso from: senderAccount to: receptiveAccount.
	
	self assert: 50*peso equals: senderAccount balance.! !

!TransferTest methodsFor: 'as yet unclassified' stamp: 'VDM 11/9/2022 18:41:52'!
test03ReceptiveAccountBalanceIncreasesOnTransferValueAfterTransferIsPerformed

	| receptiveAccount senderAccount |
	senderAccount := ReceptiveAccount new.
	receptiveAccount := ReceptiveAccount new.
	
	Deposit register: 100*peso on: senderAccount.
	Transfer transfer: 50*peso from: senderAccount to: receptiveAccount.
	
	self assert: 50*peso equals: receptiveAccount balance.! !

!TransferTest methodsFor: 'as yet unclassified' stamp: 'VDM 11/9/2022 18:41:52'!
test04TransferKnowsItsOwnValue

	| receptiveAccount senderAccount transfer |
	senderAccount := ReceptiveAccount new.
	receptiveAccount := ReceptiveAccount new.
	
	Deposit register: 100*peso on: senderAccount.
	transfer := Transfer transfer: 50*peso from: senderAccount to: receptiveAccount.
	
	self assert: 50*peso equals: transfer value.! !

!TransferTest methodsFor: 'as yet unclassified' stamp: 'VDM 11/9/2022 18:50:51'!
test05CadaPataDeLaTransferenciaConoceSuContraparte

	| receptiveAccount senderAccount transfer |
	senderAccount := SenderAccount new.
	receptiveAccount := ReceptiveAccount new.
	
	Deposit register: 100*peso on: senderAccount.
	transfer := Transfer transfer: 50*peso from: senderAccount to: receptiveAccount.		self assert: (transfer senderAccount counterPartOfTransfer: transfer ) equals: receptiveAccount.
	self assert: (transfer receptiveAccount counterPartOfTransfer: transfer ) equals: senderAccount.! !


!classDefinition: #Account category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #Account
	instanceVariableNames: 'transactions'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Account methodsFor: 'main protocol' stamp: 'VDM 11/9/2022 20:03:46'!
balance

	self subclassResponsibility.! !

!Account methodsFor: 'main protocol' stamp: 'VDM 11/9/2022 20:04:13'!
counterPartOfTransfer: aTransfer 

	self subclassResponsibility.! !

!Account methodsFor: 'main protocol' stamp: 'VDM 11/9/2022 20:01:51'!
hasRegistered: aTransaction

	^ transactions includes: aTransaction 
! !

!Account methodsFor: 'main protocol' stamp: 'VDM 11/9/2022 20:02:56'!
register: aTransaction

	transactions add: aTransaction 
! !

!Account methodsFor: 'main protocol' stamp: 'VDM 11/9/2022 20:03:15'!
transactions 

	^ transactions copy! !


!Account methodsFor: 'initialization' stamp: 'VDM 11/9/2022 20:02:29'!
initialize

	transactions := OrderedCollection new.! !


!classDefinition: #ReceptiveAccount category: 'ServiciosFinancieros-Ejercicio'!
Account subclass: #ReceptiveAccount
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!


!ReceptiveAccount methodsFor: 'main protocol' stamp: 'VDM 11/9/2022 19:48:40'!
balance

	^transactions sum: [ :aTransaction | (aTransaction isKindOf: Withdraw) ifTrue: [aTransaction value * (-1) ] ifFalse: [aTransaction value] ] ifEmpty: [ 0 ]! !


!ReceptiveAccount methodsFor: 'as yet unclassified' stamp: 'VDM 11/9/2022 18:47:37'!
counterPartOfTransfer: aTransfer 
	
	^ aTransfer senderAccount.! !


!classDefinition: #SenderAccount category: 'ServiciosFinancieros-Ejercicio'!
Account subclass: #SenderAccount
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!


!SenderAccount methodsFor: 'main protocol' stamp: 'VDM 11/9/2022 18:42:32'!
balance

	^transactions sum: [ :aTransaction | (aTransaction isKindOf: Deposit) ifTrue: [aTransaction value] ifFalse: [aTransaction value * (-1)] ] ifEmpty: [ 0 ]! !


!SenderAccount methodsFor: 'as yet unclassified' stamp: 'VDM 11/9/2022 18:46:58'!
counterPartOfTransfer: aTransfer 
	
	^ aTransfer receptiveAccount.! !


!classDefinition: #AccountTransaction category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #AccountTransaction
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!AccountTransaction methodsFor: 'value' stamp: 'HernanWilkinson 9/12/2011 12:25'!
value 

	self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountTransaction class' category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction class
	instanceVariableNames: ''!

!AccountTransaction class methodsFor: 'instance creation' stamp: 'UM 11/8/2022 20:36:59'!
register: aValue on: account

	| transaction |
	
	transaction := self for: aValue.
	
	((transaction isKindOf: Withdraw) and: (aValue > account balance)) ifFalse: [
	account register: transaction].
		
	^ transaction! !


!classDefinition: #Deposit category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #Deposit
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Deposit methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:45'!
initializeFor: aValue

	value := aValue ! !


!Deposit methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:38'!
value

	^ value! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Deposit class' category: 'ServiciosFinancieros-Ejercicio'!
Deposit class
	instanceVariableNames: ''!

!Deposit class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:38'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #Withdraw category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #Withdraw
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Withdraw methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:46'!
initializeFor: aValue

	value := aValue ! !


!Withdraw methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:33'!
value

	^ value! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Withdraw class' category: 'ServiciosFinancieros-Ejercicio'!
Withdraw class
	instanceVariableNames: ''!

!Withdraw class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:33'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #Transfer category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #Transfer
	instanceVariableNames: 'value senderAccount receptiveAccount'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Transfer methodsFor: 'as yet unclassified' stamp: 'VDM 11/9/2022 17:59:56'!
counterpartOf: anAccount 
	
	anAccount = senderAccount ifTrue: [^ receptiveAccount].
	^senderAccount.! !

!Transfer methodsFor: 'as yet unclassified' stamp: 'UM 11/8/2022 21:02:46'!
initializeFor: aValue aSender: aSenderAccount andAReceptive: aReceptiveAccount.

	value := aValue.
	senderAccount := aSenderAccount.
	receptiveAccount := aReceptiveAccount.! !

!Transfer methodsFor: 'as yet unclassified' stamp: 'VDM 11/9/2022 18:35:06'!
receptiveAccount
	
	^receptiveAccount! !

!Transfer methodsFor: 'as yet unclassified' stamp: 'UM 11/8/2022 20:55:34'!
value

	^value.! !


!Transfer methodsFor: 'category-name' stamp: 'UM 11/8/2022 21:00:51'!
senderAccount
	
	^senderAccount.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Transfer class' category: 'ServiciosFinancieros-Ejercicio'!
Transfer class
	instanceVariableNames: ''!

!Transfer class methodsFor: 'category-name' stamp: 'VDM 11/9/2022 19:55:43'!
transfer: aValue from: aSenderAccount to: aReceptiveAccount

	| transaction |
	transaction := self for: aValue aSender: aSenderAccount andAReceptive: aReceptiveAccount.
	aValue < aSenderAccount balance ifTrue: [
		aSenderAccount register: transaction.
		aReceptiveAccount register: transaction.
		].

	^transaction.! !


!Transfer class methodsFor: 'as yet unclassified' stamp: 'VDM 11/9/2022 19:24:06'!
for: aValue

	^ self new initializeFor: aValue aSender: (self senderAccount) andAReceptive: (self receptiveAccount) .! !

!Transfer class methodsFor: 'as yet unclassified' stamp: 'UM 11/8/2022 21:06:38'!
for: aValue aSender: aSenderAccount andAReceptive: aReceptiveAccount

	^ self new initializeFor: aValue aSender: aSenderAccount andAReceptive: aReceptiveAccount.! !
