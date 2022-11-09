!classDefinition: #AccountTest category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #AccountTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!AccountTest methodsFor: 'tests' stamp: 'UM 11/8/2022 19:49:21'!
test01AccountHaveZeroAsBalanceWhenCreated 

	| account |
	
	account := Account new.

	self assert: 0 equals: account balance
! !

!AccountTest methodsFor: 'tests' stamp: 'UM 11/8/2022 19:47:34'!
test02DepositIncreasesBalanceOnTransactionValue 

	| account |
	
	account := Account  new.
	Deposit register: 100 * peso on: account.
		
	self assert: 100 * peso equals: account balance
! !

!AccountTest methodsFor: 'tests' stamp: 'UM 11/8/2022 19:47:34'!
test03WithdrawDecreasesBalanceOnTransactionValue 

	| account |
	
	account := Account new.
	Deposit register: 100 * peso on: account.
	Withdraw register: 50 * peso on: account.
		
	self assert: 50 * peso equals: account balance
! !

!AccountTest methodsFor: 'tests' stamp: 'UM 11/8/2022 19:47:34'!
test04WithdrawValueMustBePositive 

	| account withdrawValue |
	
	account := Account new.
	withdrawValue := 50 * peso.
	
	self assert: withdrawValue equals: (Withdraw register: withdrawValue on: account) value
! !

!AccountTest methodsFor: 'tests' stamp: 'UM 11/8/2022 19:49:25'!
test05AccountKnowsRegisteredTransactions 

	| account deposit withdraw |
	
	account := Account new.
	deposit := Deposit register: 100 * peso on: account.
	withdraw := Withdraw register: 50 * peso on: account.
		
	self assert: (account hasRegistered: deposit).
	self assert: (account hasRegistered: withdraw).
! !

!AccountTest methodsFor: 'tests' stamp: 'UM 11/8/2022 19:49:29'!
test06AccountDoNotKnowNotRegisteredTransactions

	| account deposit withdraw |
	
	account := Account new.
	deposit :=  Deposit for: 100 * peso.
	withdraw := Withdraw for: 50 * peso.
		
	self deny: (account hasRegistered: deposit).
	self deny: (account hasRegistered: withdraw).
! !

!AccountTest methodsFor: 'tests' stamp: 'UM 11/8/2022 19:49:33'!
test07AccountKnowsItsTransactions 

	| account deposit |
	
	account := Account new.
	
	deposit := Deposit register: 50 * peso on: account.
		
	self assert: 1 equals: account transactions size.
	self assert: (account transactions includes: deposit).
! !


!classDefinition: #TransferTest category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #TransferTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!TransferTest methodsFor: 'as yet unclassified' stamp: 'UM 11/8/2022 20:37:32'!
test01TransferCannotBePerformedTransferValueIsGreaterThanSenderAccountBalance

	| receptiveAccount senderAccount |
	senderAccount := Account new.
	receptiveAccount := Account new.
	
	Deposit register: 50*peso on: senderAccount.
	Transfer transfer: 100*peso from: senderAccount to: receptiveAccount.
	
	self assert: 50*peso equals: senderAccount balance.! !

!TransferTest methodsFor: 'as yet unclassified' stamp: 'UM 11/8/2022 20:38:26'!
test02SenderAccountBalanceDecreasesOnTransferValueAfterTransferIsPerformed

	| receptiveAccount senderAccount |
	senderAccount := Account new.
	receptiveAccount := Account new.
	
	Deposit register: 100*peso on: senderAccount.
	Transfer transfer: 50*peso from: senderAccount to: receptiveAccount.
	
	self assert: 50*peso equals: senderAccount balance.! !

!TransferTest methodsFor: 'as yet unclassified' stamp: 'UM 11/8/2022 20:39:52'!
test03ReceptiveAccountBalanceIncreasesOnTransferValueAfterTransferIsPerformed

	| receptiveAccount senderAccount |
	senderAccount := Account new.
	receptiveAccount := Account new.
	
	Deposit register: 100*peso on: senderAccount.
	Transfer transfer: 50*peso from: senderAccount to: receptiveAccount.
	
	self assert: 50*peso equals: receptiveAccount balance.! !

!TransferTest methodsFor: 'as yet unclassified' stamp: 'UM 11/8/2022 20:47:35'!
test04TransferKnowsItsOwnValue

	| receptiveAccount senderAccount transfer |
	senderAccount := Account new.
	receptiveAccount := Account new.
	
	Deposit register: 100*peso on: senderAccount.
	transfer := Transfer transfer: 50*peso from: senderAccount to: receptiveAccount.
	
	self assert: 50*peso equals: transfer value.! !

!TransferTest methodsFor: 'as yet unclassified' stamp: 'UM 11/8/2022 20:59:54'!
test05

	| receptiveAccount senderAccount transfer |
	senderAccount := Account new.
	receptiveAccount := Account new.
	
	Deposit register: 100*peso on: senderAccount.
	transfer := Transfer transfer: 50*peso from: senderAccount to: receptiveAccount.
	
	self assert: transfer senderAccount counterpart equals: transfer receptiveAccount.! !


!classDefinition: #Account category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #Account
	instanceVariableNames: 'transactions'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Account methodsFor: 'initialization' stamp: 'NR 10/17/2019 15:06:56'!
initialize

	transactions := OrderedCollection new.! !


!Account methodsFor: 'main protocol' stamp: 'UM 11/8/2022 19:44:09'!
balance

	^transactions sum: [ :aTransaction | (aTransaction isKindOf: Deposit) ifTrue: [aTransaction value] ifFalse: [aTransaction value * (-1)] ] ifEmpty: [ 0 ]! !

!Account methodsFor: 'main protocol' stamp: 'NR 10/17/2019 03:28:43'!
hasRegistered: aTransaction

	^ transactions includes: aTransaction 
! !

!Account methodsFor: 'main protocol' stamp: 'HernanWilkinson 7/13/2011 18:37'!
register: aTransaction

	transactions add: aTransaction 
! !

!Account methodsFor: 'main protocol' stamp: 'HernanWilkinson 7/13/2011 18:37'!
transactions 

	^ transactions copy! !


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

!Transfer methodsFor: 'as yet unclassified' stamp: 'UM 11/8/2022 21:02:46'!
initializeFor: aValue aSender: aSenderAccount andAReceptive: aReceptiveAccount.

	value := aValue.
	senderAccount := aSenderAccount.
	receptiveAccount := aReceptiveAccount.! !

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

!Transfer class methodsFor: 'category-name' stamp: 'UM 11/8/2022 21:04:53'!
transfer: aValue from: aSenderAccount to: aReceptiveAccount

	| transaction |
	transaction := self for: aValue aSender: aSenderAccount andAReceptive: aReceptiveAccount.
	Withdraw register: aValue on: aSenderAccount.
	Deposit register: aValue on: aReceptiveAccount.
	^transaction.! !


!Transfer class methodsFor: 'as yet unclassified' stamp: 'UM 11/8/2022 21:06:38'!
for: aValue aSender: aSenderAccount andAReceptive: aReceptiveAccount

	^ self new initializeFor: aValue aSender: aSenderAccount andAReceptive: aReceptiveAccount.! !
