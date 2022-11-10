!classDefinition: #AccountTest category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #AccountTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!AccountTest methodsFor: 'tests' stamp: 'UM 11/10/2022 18:30:31'!
test01AnAccountHaveZeroAsBalanceWhenCreated 

	| account |
	
	account := ReceptiveAccount new.

	self assert: 0 equals: account balance
! !

!AccountTest methodsFor: 'tests' stamp: 'VDM 11/9/2022 22:02:30'!
test02DepositIncreasesBalanceOnTransactionValue 

	| account |
	
	account := SenderAccount  new.
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

!AccountTest methodsFor: 'tests' stamp: 'UM 11/10/2022 18:33:47'!
test05AnAccountKnowsRegisteredTransactions 

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit := Deposit register: 100 * peso on: account.
	withdraw := Withdraw register: 50 * peso on: account.
		
	self assert: (account hasRegistered: deposit).
	self assert: (account hasRegistered: withdraw).
! !

!AccountTest methodsFor: 'tests' stamp: 'UM 11/10/2022 18:33:53'!
test06AnAccountDoNotKnowNotRegisteredTransactions

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit :=  Deposit for: 100 * peso.
	withdraw := Withdraw for: 50 * peso.
		
	self deny: (account hasRegistered: deposit).
	self deny: (account hasRegistered: withdraw).
! !

!AccountTest methodsFor: 'tests' stamp: 'UM 11/10/2022 18:33:59'!
test07AnAccountKnowsItsTransactions 

	| account deposit |
	
	account := ReceptiveAccount new.
	
	deposit := Deposit register: 50 * peso on: account.
		
	self assert: 1 equals: account transactions size.
	self assert: (account transactions includes: deposit).
! !

!AccountTest methodsFor: 'tests' stamp: 'UM 11/10/2022 18:33:27'!
test08AnAccountCanRegisterATransfer

	| receptiveAccount senderAccount transfer |
	
	senderAccount := SenderAccount new.
	receptiveAccount := ReceptiveAccount new.
	
	Deposit register: 100*peso on: senderAccount.
	
	transfer := Transfer transfer: 70*peso from: senderAccount to: receptiveAccount.
	
	self assert: (receptiveAccount hasRegistered: transfer).
! !


!classDefinition: #PortfolioTest category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #PortfolioTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!PortfolioTest methodsFor: 'testing' stamp: 'UM 11/10/2022 17:53:45'!
test01WhenAPortfolioIsCreatedItHasNoAccounts

	| portfolio |
	
	portfolio := Portfolio new.
	
	self assert: 0 equals: portfolio amountOfAccounts.! !

!PortfolioTest methodsFor: 'testing' stamp: 'UM 11/10/2022 17:53:56'!
test02WhenAPortfolioIsCreatedItHasNoPortfolios

	| portfolio |
	
	portfolio := Portfolio new.
	
	self assert: 0 equals: portfolio amountOfPortfolios.! !

!PortfolioTest methodsFor: 'testing' stamp: 'UM 11/10/2022 17:36:42'!
test03WhenAPortfolioIsCreatedItsBalnaceIsZero

	| portfolio |
	
	portfolio := Portfolio new.
	
	self assert: 0 equals: portfolio balance.! !

!PortfolioTest methodsFor: 'testing' stamp: 'UM 11/10/2022 17:54:49'!
test04WhenMoreThanOneAccountIsAddedToThePortfolioTheAmountOfAccountsIsIncreasedAndTheAmountOfPortfoliosIsZero

	| portfolio account account2 account3 |
	
	portfolio := Portfolio new.
	
	account := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	account3 := ReceptiveAccount new.
	
	portfolio add: account.
	portfolio add: account2.
	portfolio add: account3.
	
	self assert: 3 equals: portfolio amountOfAccounts.
	self assert: 0 equals: portfolio amountOfPortfolios.! !

!PortfolioTest methodsFor: 'testing' stamp: 'UM 11/10/2022 17:53:56'!
test05WhenMoreThanOnePortfolioIsAddedToThePortfolioTheAmountOfPortfoliosIsIncreasedAndTheAmountOfAccountsIsZero

	| portfolio portfolioA portfolioB portfolioC |
	
	portfolio := Portfolio new.
	portfolioA := Portfolio new.
	portfolioB := Portfolio new.
	portfolioC := Portfolio new.
	
	portfolio add: portfolioA.	
	portfolio add: portfolioB.	
	portfolio add: portfolioC.
	
	self assert: 3 equals: portfolio amountOfPortfolios.
	self assert: 0 equals: portfolio amountOfAccounts.! !

!PortfolioTest methodsFor: 'testing' stamp: 'UM 11/10/2022 17:54:28'!
test06TheBalanceOfAPortfolioCanBeObtained

	| portfolio account1 account2 account3 |
	
	portfolio := Portfolio new.
	
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	account3 := ReceptiveAccount new.
	
	Deposit register: 100*peso on: account1.
	Deposit register: 500*peso on: account2.
	Deposit register: 10*peso on: account3.
	
	portfolio add: account1.
	portfolio add: account2.
	portfolio add: account3.
	
	self assert: 610*peso equals: portfolio balance.! !

!PortfolioTest methodsFor: 'testing' stamp: 'UM 11/10/2022 17:53:29'!
test07WhenAPortfolioWithAccountsIsAddedToAnotherPortfolioWithAccountsTheTotalBalanceCanBeObtained

	| portfolio account1 account2 account3 portfolio2 account4 account5 |
	
	portfolio := Portfolio new.
	portfolio2 := Portfolio new.
	
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	account3 := ReceptiveAccount new.
	account4 := ReceptiveAccount new.
	account5 := ReceptiveAccount new.
	
	Deposit register: 100*peso on: account1.
	Deposit register: 500*peso on: account2.
	Deposit register: 10*peso on: account3.
	Deposit register: 312*peso on: account4.
	Deposit register: 315*peso on: account5.
	
	portfolio2 add: account1.
	portfolio2 add: account2.
	portfolio2 add: account3.
	portfolio add: account4.
	portfolio add: account5.
	portfolio add: portfolio2.
	
	self assert: 1237*peso equals: portfolio balance.! !

!PortfolioTest methodsFor: 'testing' stamp: 'UM 11/10/2022 18:12:50'!
test08AnyAccountHasRegisteredAnSpecificTransaction

	| account1 account2 deposit portfolio |
	
	portfolio := Portfolio new.
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	
	deposit := Deposit register: 100*peso on: account1.
	Deposit register: 50*peso on: account2.
	
	portfolio add: account1.
	portfolio add: account2.
	
	self assert: (portfolio anyAccountRegistered: deposit).	! !

!PortfolioTest methodsFor: 'testing' stamp: 'UM 11/10/2022 18:19:37'!
test09AllTransactionsOfAnAccountCanBeKnown

	| account1 account2 deposit portfolio transfer |
	
	portfolio := Portfolio new.
	account1 := SenderAccount new.
	account2 := ReceptiveAccount new.
	
	deposit := Deposit register: 100*peso on: account1.
	transfer := Transfer transfer: 50*peso from: account1 to: account2.
	
	portfolio add: account1.
	portfolio add: account2.
	
	self assert: 2 equals: (portfolio allTransactionsOf: account1) size.
	self assert: (((portfolio allTransactionsOf: account1) includes: deposit) and: ((portfolio allTransactionsOf: account1) includes: transfer)).	! !


!classDefinition: #TransferTest category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #TransferTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!TransferTest methodsFor: 'testing' stamp: 'UM 11/10/2022 18:38:56'!
test01TransferCannotBePerformedIfTransferValueIsGreaterThanSenderAccountBalance

	| receptiveAccount senderAccount |
	senderAccount := SenderAccount new.
	receptiveAccount := ReceptiveAccount new.
	
	Deposit register: 50*peso on: senderAccount.
	Transfer transfer: 100*peso from: senderAccount to: receptiveAccount.
	
	self assert: 50*peso equals: senderAccount balance.! !

!TransferTest methodsFor: 'testing' stamp: 'VDM 11/9/2022 19:56:22'!
test02SenderAccountBalanceDecreasesOnTransferValueAfterTransferIsPerformed

	| receptiveAccount senderAccount |
	senderAccount := SenderAccount new.
	receptiveAccount := ReceptiveAccount new.
	
	Deposit register: 100*peso on: senderAccount.
	Transfer transfer: 50*peso from: senderAccount to: receptiveAccount.
	
	self assert: 50*peso equals: senderAccount balance.! !

!TransferTest methodsFor: 'testing' stamp: 'VDM 11/9/2022 18:41:52'!
test03ReceptiveAccountBalanceIncreasesOnTransferValueAfterTransferIsPerformed

	| receptiveAccount senderAccount |
	senderAccount := ReceptiveAccount new.
	receptiveAccount := ReceptiveAccount new.
	
	Deposit register: 100*peso on: senderAccount.
	Transfer transfer: 50*peso from: senderAccount to: receptiveAccount.
	
	self assert: 50*peso equals: receptiveAccount balance.! !

!TransferTest methodsFor: 'testing' stamp: 'VDM 11/9/2022 18:41:52'!
test04TransferKnowsItsOwnValue

	| receptiveAccount senderAccount transfer |
	senderAccount := ReceptiveAccount new.
	receptiveAccount := ReceptiveAccount new.
	
	Deposit register: 100*peso on: senderAccount.
	transfer := Transfer transfer: 50*peso from: senderAccount to: receptiveAccount.
	
	self assert: 50*peso equals: transfer value.! !

!TransferTest methodsFor: 'testing' stamp: 'UM 11/10/2022 18:40:32'!
test05EachSideOfTheTransferKnowsItsCounterpart

	| receptiveAccount senderAccount transfer |
	senderAccount := SenderAccount new.
	receptiveAccount := ReceptiveAccount new.
	
	Deposit register: 100*peso on: senderAccount.
	transfer := Transfer transfer: 50*peso from: senderAccount to: receptiveAccount.		self assert: (transfer senderAccount counterPartOfTransfer: transfer ) equals: receptiveAccount.
	self assert: (transfer receptiveAccount counterPartOfTransfer: transfer ) equals: senderAccount.! !

!TransferTest methodsFor: 'testing' stamp: 'UM 11/10/2022 18:44:51'!
test06WhenATransferIsPerformedItIsRegisteredInBothSides 

	| receptiveAccount transfer senderAccount deposit |
	
	receptiveAccount := ReceptiveAccount new.
	senderAccount := SenderAccount new.
	
	deposit := Deposit register: 50 * peso on: senderAccount.
	transfer := Transfer transfer: 1*peso from: senderAccount to: receptiveAccount.
		
	self assert: 1 equals: receptiveAccount amountOfTransactions.
	self assert: (receptiveAccount hasRegistered: transfer).
	
	self assert: 2 equals: senderAccount amountOfTransactions.
	self assert: ((senderAccount hasRegistered: transfer) and: (senderAccount hasRegistered: deposit)).! !


!classDefinition: #Account category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #Account
	instanceVariableNames: 'transactions'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Account methodsFor: 'initialization' stamp: 'VDM 11/9/2022 20:02:29'!
initialize

	transactions := OrderedCollection new.! !


!Account methodsFor: 'main protocol' stamp: 'UM 11/10/2022 18:45:17'!
amountOfTransactions

	^transactions size.! !

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


!classDefinition: #ReceptiveAccount category: 'ServiciosFinancieros-Ejercicio'!
Account subclass: #ReceptiveAccount
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'UM 11/10/2022 18:27:28'!
balance
	^transactions sum: [ :aTransaction | (aTransaction isKindOf: Withdraw) ifTrue: [aTransaction value * (-1) ] ifFalse: [aTransaction value] ] ifEmpty: [ 0 ].! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'VDM 11/9/2022 18:47:37'!
counterPartOfTransfer: aTransfer 
	
	^ aTransfer senderAccount.! !


!classDefinition: #SenderAccount category: 'ServiciosFinancieros-Ejercicio'!
Account subclass: #SenderAccount
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!SenderAccount methodsFor: 'main protocol' stamp: 'UM 11/10/2022 18:27:44'!
balance
	^transactions sum: [ :aTransaction | (aTransaction isKindOf: Deposit) ifTrue: [aTransaction value] ifFalse: [aTransaction value * (-1)] ] ifEmpty: [ 0 ].! !

!SenderAccount methodsFor: 'main protocol' stamp: 'VDM 11/9/2022 18:46:58'!
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


!classDefinition: #Portfolio category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #Portfolio
	instanceVariableNames: 'accounts portfolios'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Portfolio methodsFor: 'initialization' stamp: 'UM 11/10/2022 18:11:07'!
initialize

	accounts := OrderedCollection new.
	portfolios := OrderedCollection new.! !


!Portfolio methodsFor: 'accesing' stamp: 'UM 11/10/2022 18:18:30'!
allTransactionsOf: anAccount 
	
	^anAccount transactions.! !

!Portfolio methodsFor: 'accesing' stamp: 'UM 11/10/2022 18:11:07'!
amountOfAccounts
	
	^accounts size.! !

!Portfolio methodsFor: 'accesing' stamp: 'UM 11/10/2022 17:53:56'!
amountOfPortfolios
	
	^portfolios size.! !

!Portfolio methodsFor: 'accesing' stamp: 'UM 11/10/2022 18:11:07'!
anyAccountRegistered: aTransaction 
	
	^(accounts anySatisfy: [:anAccount | anAccount hasRegistered: aTransaction]) or: [portfolios anySatisfy: [:aPortfolio | aPortfolio anyAccountRegistered: aTransaction]].! !

!Portfolio methodsFor: 'accesing' stamp: 'UM 11/10/2022 18:29:25'!
balance
	
	| accountsBalance portfoliosBalance |
	accountsBalance := accounts sum: [:anAccount | anAccount balance] ifEmpty: [0].
	portfoliosBalance := portfolios sum: [:aPortfolio | aPortfolio balance] ifEmpty: [0].
	
	^ accountsBalance + portfoliosBalance.
	
	! !


!Portfolio methodsFor: 'adding' stamp: 'UM 11/10/2022 18:11:07'!
add: anAccountOrAPortfolio 
	
	(anAccountOrAPortfolio isKindOf: Portfolio) ifTrue:[ portfolios add: anAccountOrAPortfolio ] 
		ifFalse: [ 	accounts add: anAccountOrAPortfolio ].! !


!classDefinition: #Transfer category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #Transfer
	instanceVariableNames: 'value senderAccount receptiveAccount'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Transfer methodsFor: 'initialization' stamp: 'UM 11/8/2022 21:02:46'!
initializeFor: aValue aSender: aSenderAccount andAReceptive: aReceptiveAccount.

	value := aValue.
	senderAccount := aSenderAccount.
	receptiveAccount := aReceptiveAccount.! !


!Transfer methodsFor: 'accesing' stamp: 'VDM 11/9/2022 18:35:06'!
receptiveAccount
	
	^receptiveAccount! !

!Transfer methodsFor: 'accesing' stamp: 'UM 11/8/2022 21:00:51'!
senderAccount
	
	^senderAccount.! !

!Transfer methodsFor: 'accesing' stamp: 'UM 11/8/2022 20:55:34'!
value

	^value.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Transfer class' category: 'ServiciosFinancieros-Ejercicio'!
Transfer class
	instanceVariableNames: ''!

!Transfer class methodsFor: 'instance creation' stamp: 'UM 11/8/2022 21:06:38'!
for: aValue aSender: aSenderAccount andAReceptive: aReceptiveAccount

	^ self new initializeFor: aValue aSender: aSenderAccount andAReceptive: aReceptiveAccount.! !

!Transfer class methodsFor: 'instance creation' stamp: 'VDM 11/9/2022 19:55:43'!
transfer: aValue from: aSenderAccount to: aReceptiveAccount

	| transaction |
	transaction := self for: aValue aSender: aSenderAccount andAReceptive: aReceptiveAccount.
	aValue < aSenderAccount balance ifTrue: [
		aSenderAccount register: transaction.
		aReceptiveAccount register: transaction.
		].

	^transaction.! !
