!classDefinition: #AccountSummaryTest category: 'ServiciosFinancieros-II'!
TestCase subclass: #AccountSummaryTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-II'!

!AccountSummaryTest methodsFor: 'as yet unclassified' stamp: 'VDM 11/17/2022 08:53:36'!
test01ElResumenSabeSiNoSeRealizaronTransacciones

	| accountSummary cuenta |
	
	cuenta := ReceptiveAccount new.
	
	accountSummary := AccountSummary for: cuenta.
	
	"Character cr -> para salto de linea"
	
	self assert: 'NO SE REGISTRAN TRANSACCIONES.
	Balance = 0 pesos' equals: accountSummary resumenGeneral.
	self assert: (accountSummary transaccionesRealizadas: 0).! !

!AccountSummaryTest methodsFor: 'as yet unclassified' stamp: 'VDM 11/17/2022 08:54:27'!
test02SiSeRealizaUnDepositoSeRegistraEnElResumen

	| accountSummary cuenta |
	
	cuenta := ReceptiveAccount new.
	
	Deposit register: 30 * peso on: cuenta.
	
	accountSummary := AccountSummary for: cuenta.
	
	"Character cr -> para salto de linea -> ahora uso 'String newLineString'"
	
	self assert: ('Depósito por 30 pesos', String newLineString, 'Balance = 30 pesos') equals: accountSummary resumenGeneral.	
	self assert: (accountSummary transaccionesRealizadas: 1).! !

!AccountSummaryTest methodsFor: 'as yet unclassified' stamp: 'VDM 11/17/2022 08:54:54'!
test03UnRetiroSeRegistraEnElResumen

	| accountSummary cuenta |
	
	cuenta := ReceptiveAccount new.
	
	Withdraw register: 100 * peso on: cuenta.
	
	accountSummary := AccountSummary for: cuenta.
	
	"Character cr -> para salto de linea -> ahora uso 'String newLineString'"
	
	self assert: ('Extracción por 100 pesos', String newLineString, 'Balance = -100 pesos') equals: accountSummary resumenGeneral.	
	self assert: (accountSummary transaccionesRealizadas: 1).! !

!AccountSummaryTest methodsFor: 'as yet unclassified' stamp: 'VDM 11/17/2022 08:55:31'!
test04LasTransferenciasQuedanRegistradasEnElResumen

	| accountSummary1 accountSummary2 cuenta1 cuenta2|
	
	cuenta1 := ReceptiveAccount new.
	cuenta2 := ReceptiveAccount new.
	
	Transfer amount: 123 * peso from: cuenta1 to: cuenta2.
	
	accountSummary1 := AccountSummary for: cuenta1.
	accountSummary2 := AccountSummary for: cuenta2.
	
	"Para salto de linea -> 'String newLineString'"
	
	self assert: ('Salida por transferencia de 123 pesos', String newLineString, 'Balance = -123 pesos') equals: accountSummary1 resumenGeneral.	
	self assert: (accountSummary1 transaccionesRealizadas: 1).
	self assert: ('Entrada por transferencia de 123 pesos', String newLineString, 'Balance = 123 pesos') equals: accountSummary2 resumenGeneral.	
	self assert: (accountSummary2 transaccionesRealizadas: 1).! !

!AccountSummaryTest methodsFor: 'as yet unclassified' stamp: 'VDM 11/17/2022 08:56:03'!
test05VariasTransaccionesQuedanRegistradasEnElResumen

	| accountSummary cuenta1 cuenta2|
	
	cuenta1 := ReceptiveAccount new.
	cuenta2 := ReceptiveAccount new.
	
	accountSummary := AccountSummary for: cuenta1.
	
	Deposit register: 100 * peso on: cuenta1.
	
	Withdraw register: 50 * peso on: cuenta1.
	
	Transfer amount: 50 * peso from: cuenta1 to: cuenta2.
	
	Transfer amount: 30 * peso from: cuenta2 to: cuenta1.
	
	"Para salto de linea -> 'String newLineString'"
	
	self assert: ('Depósito por 100 pesos', String newLineString, 'Extracción por 50 pesos', String newLineString, 'Salida por transferencia de 50 pesos', String newLineString, 'Entrada por transferencia de 30 pesos', String newLineString, 'Balance = 30 pesos') equals: accountSummary resumenGeneral.	
	self assert: (accountSummary transaccionesRealizadas: 4).
	self assert: (accountSummary balance: cuenta1 balance).! !


!classDefinition: #PortfolioTest category: 'ServiciosFinancieros-II'!
TestCase subclass: #PortfolioTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-II'!

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:16:26'!
test01BalanceOfPortfolioWithoutAccountsIsZero

	self assert: 0 equals: Portfolio new balance! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:27:00'!
test02BalanceOfPortfolioWithOneAccountIsAccountBalance

	| account portfolio |
	
	account := ReceptiveAccount new.
	Deposit register: 100 * peso on: account.
	portfolio := Portfolio with: account.
	
	self assert: account balance equals: portfolio balance! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:27:06'!
test03BalanceOfPortfolioIsCalculatedRecursivelyOnPortfolios

	| simplePortfolioAccount simplePortfolio composedPortfolioAccount composedPortofolio |
	
	simplePortfolioAccount := ReceptiveAccount new.
	Deposit register: 100 * peso on: simplePortfolioAccount.
	simplePortfolio := Portfolio with: simplePortfolioAccount.
	
	composedPortfolioAccount := ReceptiveAccount new.
	Withdraw register: 50 * peso on: composedPortfolioAccount.
	composedPortofolio := Portfolio with: simplePortfolio with: composedPortfolioAccount.
	
	self assert: (composedPortfolioAccount balance + simplePortfolio balance) equals: composedPortofolio balance! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:27:12'!
test04PortfolioWithoutAccountsHasNoRegisteredTransaction

	self deny: (Portfolio new hasRegistered: (Deposit for: 100 * peso))! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:27:18'!
test05PortfolioHasRegisteredItsAccountsTransactions

	| account portfolio deposit |
	
	account := ReceptiveAccount new.
	deposit := Deposit register: 100 * peso on: account.
	portfolio := Portfolio with: account.
	
	self assert: (portfolio hasRegistered: deposit)! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:27:26'!
test06PortfolioLooksForRegisteredTransactionsRecursively

	| simplePortfolioAccount simplePortfolio composedPortfolioAccount composedPortfolio composedPortfolioAccountWithdraw simplePortfolioAccountDeposit |
	
	simplePortfolioAccount := ReceptiveAccount new.
	simplePortfolioAccountDeposit := Deposit register: 100 * peso on: simplePortfolioAccount.
	simplePortfolio := Portfolio with: simplePortfolioAccount.
	
	composedPortfolioAccount := ReceptiveAccount new.
	composedPortfolioAccountWithdraw := Withdraw register: 50 * peso on: composedPortfolioAccount.
	composedPortfolio := Portfolio with: simplePortfolio with: composedPortfolioAccount.
	
	self assert: (composedPortfolio hasRegistered: simplePortfolioAccountDeposit).
	self assert: (composedPortfolio hasRegistered: composedPortfolioAccountWithdraw)! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:58:10'!
test07PortfolioHasNoTransactionWhenHasNoAccounts

	self assert: Portfolio new transactions isEmpty! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:28:08'!
test08PortfolioTransactionsIncludesAllItsAccountsTransactions

	| account portfolio accountDeposit portfolioTransactions anotherAccountWithdraw |
	
	account := ReceptiveAccount new.
	accountDeposit := Deposit register: 100 * peso on: account.
	anotherAccountWithdraw := Withdraw register: 100 * peso on: account.
	portfolio := Portfolio with: account.
	
	portfolioTransactions := portfolio transactions.
	
	self assert: 2 equals: portfolioTransactions size.
	self assert: (portfolioTransactions includes: accountDeposit).
	self assert: (portfolioTransactions includes: anotherAccountWithdraw)! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:28:20'!
test09PortfolioTransactionsAreCalculatedRecursively

	| simplePortfolioAccount simplePortfolio composedPortfolioAccount composedPortfolio composedPortfolioAccountWithdraw simplePortfolioAccountDeposit composedPortfolioTransactions |
	
	simplePortfolioAccount := ReceptiveAccount new.
	simplePortfolioAccountDeposit := Deposit register: 100 * peso on: simplePortfolioAccount.
	simplePortfolio := Portfolio with: simplePortfolioAccount.
	
	composedPortfolioAccount := ReceptiveAccount new.
	composedPortfolioAccountWithdraw := Withdraw register: 50 * peso on: composedPortfolioAccount.
	composedPortfolio := Portfolio with: simplePortfolio with: composedPortfolioAccount.
	
	composedPortfolioTransactions := composedPortfolio transactions.
	self assert: 2 equals: composedPortfolioTransactions size.
	self assert: (composedPortfolioTransactions includes: simplePortfolioAccountDeposit).
	self assert: (composedPortfolioTransactions includes: composedPortfolioAccountWithdraw)! !


!classDefinition: #ReceptiveAccountTest category: 'ServiciosFinancieros-II'!
TestCase subclass: #ReceptiveAccountTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-II'!

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:10:43'!
test01ReceptiveAccountHaveZeroAsBalanceWhenCreated 

	| account |
	
	account := ReceptiveAccount new.

	self assert: 0 equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:14:20'!
test02DepositIncreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount  new.
	Deposit register: 100 * peso on: account.
		
	self assert: 100 * peso equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:14:24'!
test03WithdrawDecreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount new.
	Deposit register: 100 * peso on: account.
	Withdraw register: 50 * peso on: account.
		
	self assert: 50 * peso equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:10:14'!
test04WithdrawValueMustBePositive 

	| account withdrawValue |
	
	account := ReceptiveAccount new.
	withdrawValue := 50 * peso.
	
	self assert: withdrawValue equals: (Withdraw register: withdrawValue on: account) value
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:10:22'!
test05ReceptiveAccountKnowsRegisteredTransactions 

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit := Deposit register: 100 * peso on: account.
	withdraw := Withdraw register: 50 * peso on: account.
		
	self assert: (account hasRegistered: deposit).
	self assert: (account hasRegistered: withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:12:14'!
test06ReceptiveAccountDoNotKnowNotRegisteredTransactions

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit :=  Deposit for: 100 * peso.
	withdraw := Withdraw for: 50 * peso.
		
	self deny: (account hasRegistered: deposit).
	self deny: (account hasRegistered: withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:12:23'!
test07AccountKnowsItsTransactions 

	| account deposit |
	
	account := ReceptiveAccount new.
	
	deposit := Deposit register: 50 * peso on: account.
		
	self assert: 1 equals: account transactions size.
	self assert: (account transactions includes: deposit).
! !


!classDefinition: #TransferTest category: 'ServiciosFinancieros-II'!
TestCase subclass: #TransferTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-II'!

!TransferTest methodsFor: 'as yet unclassified' stamp: 'LL 9/20/2020 21:07:03'!
test01ATransferDecreasesBalanceFromOriginAccountAndIncreasesItForDestinationAccount

	| destinationAccount originAccount |
	
	originAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: originAccount.
	
	destinationAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: destinationAccount.
	
	Transfer amount: 2 * peso from: originAccount to: destinationAccount.
	
	self assert: 8 * peso equals: originAccount balance.
	self assert: 12 * peso equals: destinationAccount balance.! !

!TransferTest methodsFor: 'as yet unclassified' stamp: 'LL 9/20/2020 21:12:28'!
test02ATransferKnowsItsValue

	| destinationAccount originAccount transfer |
	
	originAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: originAccount.
	
	destinationAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: destinationAccount.
	
	transfer := Transfer amount: 2 * peso from: originAccount to: destinationAccount.
	
	self assert: 2 * peso equals: transfer value.! !

!TransferTest methodsFor: 'as yet unclassified' stamp: 'LL 9/20/2020 23:01:44'!
test03DepositLegKnowsItsWithdrawCounterpart

	| destinationAccount originAccount transfer |
	
	originAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: originAccount.
	
	destinationAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: destinationAccount.
	
	transfer := Transfer amount: 2 * peso from: originAccount to: destinationAccount.
	
	self assert: transfer withdrawLeg equals: transfer depositLeg withdrawLeg! !

!TransferTest methodsFor: 'as yet unclassified' stamp: 'LL 9/20/2020 23:01:51'!
test04WithdrawLegKnowsItsDepositCounterpart

	| destinationAccount originAccount transfer |
	
	originAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: originAccount.
	
	destinationAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: destinationAccount.
	
	transfer := Transfer amount: 2 * peso from: originAccount to: destinationAccount.
	
	self assert: transfer depositLeg equals: transfer withdrawLeg depositLeg! !

!TransferTest methodsFor: 'as yet unclassified' stamp: 'LL 9/20/2020 23:02:36'!
test05OriginAndDestinationAccountsCannotBeTheSame

	| originAccount |
	
	originAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: originAccount.
	
	self should: [ Transfer amount: 2 * peso from: originAccount to: originAccount ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Transfer cannotTransferToOriginErrorDescription equals: anError messageText.
			self assert: 10 * peso equals: originAccount balance.
		]
! !

!TransferTest methodsFor: 'as yet unclassified' stamp: 'VDM 11/16/2022 07:26:30'!
test06CannotTransferAZeroAmount

	| originAccount destinationAccount |
	
	originAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: originAccount.
	
	destinationAccount := ReceptiveAccount new.
	Deposit register: 5 * peso on: destinationAccount.
	
	self should: [ Transfer amount: 0 from: originAccount to: destinationAccount ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Transfer cannotTransferZeroErrorDescription equals: anError messageText.
			self assert: 10 * peso equals: originAccount balance.
		]
! !


!classDefinition: #Account category: 'ServiciosFinancieros-II'!
Object subclass: #Account
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-II'!

!Account methodsFor: 'main protocol' stamp: 'HAW 5/25/2019 12:23:40'!
balance

	self subclassResponsibility ! !

!Account methodsFor: 'main protocol' stamp: 'HAW 5/25/2019 12:23:47'!
hasRegistered: aTransaction

	self subclassResponsibility ! !

!Account methodsFor: 'main protocol' stamp: 'HAW 5/25/2019 12:23:15'!
transactions

	self subclassResponsibility ! !


!Account methodsFor: 'private' stamp: 'HAW 5/25/2019 12:23:27'!
addTransactionsTo: aCollectionOfTransactions

	self subclassResponsibility ! !


!classDefinition: #Portfolio category: 'ServiciosFinancieros-II'!
Account subclass: #Portfolio
	instanceVariableNames: 'accounts'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-II'!

!Portfolio methodsFor: 'initialization' stamp: 'LL 7/1/2021 03:21:03'!
initialize

	accounts := OrderedCollection new.! !


!Portfolio methodsFor: 'main protocol' stamp: 'HAW 5/25/2019 11:19:36'!
balance
	
	^accounts sum: [ :anAccount | anAccount balance ] ifEmpty: [ 0 ]! !

!Portfolio methodsFor: 'main protocol' stamp: 'HAW 5/25/2019 11:28:29'!
hasRegistered: aTransaction

	^accounts anySatisfy: [ :anAccount | anAccount hasRegistered: aTransaction ]! !

!Portfolio methodsFor: 'main protocol' stamp: 'HAW 5/25/2019 11:38:32'!
transactions
	
	| transactions |
	
	transactions := OrderedCollection new.
	accounts do: [ :anAccount | anAccount addTransactionsTo: transactions ].
	
	^transactions ! !


!Portfolio methodsFor: 'accounts management' stamp: 'LL 7/1/2021 03:21:12'!
add: accountToAdd
	
	accounts add: accountToAdd.
	! !


!Portfolio methodsFor: 'private' stamp: 'HAW 5/25/2019 11:42:55'!
addTransactionsTo: aCollectionOfTransactions

	accounts do: [ :anAccount | anAccount addTransactionsTo: aCollectionOfTransactions ]! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Portfolio class' category: 'ServiciosFinancieros-II'!
Portfolio class
	instanceVariableNames: ''!

!Portfolio class methodsFor: 'as yet unclassified' stamp: 'HAW 5/25/2019 11:18:21'!
with: anAccount

	^self new 
		add: anAccount;
		yourself! !

!Portfolio class methodsFor: 'as yet unclassified' stamp: 'HAW 5/25/2019 11:23:59'!
with: anAccount with: anotherAccount

	^self new 
		add: anAccount;
		add: anotherAccount;
		yourself! !


!classDefinition: #ReceptiveAccount category: 'ServiciosFinancieros-II'!
Account subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-II'!

!ReceptiveAccount methodsFor: 'initialization' stamp: 'VDM 11/15/2022 18:45:53'!
initialize

	super initialize.
	transactions := OrderedCollection new.! !


!ReceptiveAccount methodsFor: 'main protocol' stamp: 'HAW 5/25/2019 11:24:46'!
balance

	^transactions 
		inject: 0
		into: [ :currentBalance :transaction | transaction affectBalance: currentBalance ]! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'NR 10/21/2019 18:55:56'!
hasRegistered: aTransaction

	^ transactions includes: aTransaction 
! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'HernanWilkinson 7/13/2011 18:37'!
register: aTransaction

	transactions add: aTransaction 
! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'HernanWilkinson 7/13/2011 18:37'!
transactions 

	^ transactions copy! !


!ReceptiveAccount methodsFor: 'private' stamp: 'HAW 5/25/2019 11:38:52'!
addTransactionsTo: aCollectionOfTransactions

	aCollectionOfTransactions addAll: transactions ! !


!classDefinition: #AccountSummary category: 'ServiciosFinancieros-II'!
Object subclass: #AccountSummary
	instanceVariableNames: 'cuentaAsociada'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-II'!

!AccountSummary methodsFor: 'as yet unclassified' stamp: 'VDM 11/17/2022 08:45:47'!
balance: aSimpleMeasure 
	
	| balance |
	balance := 0.
	cuentaAsociada transactions do: [:transaction| 
		balance := transaction affectBalance: balance.
		].
	
	^ aSimpleMeasure = balance.! !

!AccountSummary methodsFor: 'as yet unclassified' stamp: 'VDM 11/16/2022 09:28:23'!
inicializeFor: aReceptiveAccount 

	cuentaAsociada := aReceptiveAccount.
	! !

!AccountSummary methodsFor: 'as yet unclassified' stamp: 'VDM 11/17/2022 08:51:14'!
resumenGeneral
	
	| nombreTransaccion valorDeLaTransaccion moneda textoADevolver lineaFinal lineas nuevaLinea balance|
	
	lineas := OrderedCollection new.
	balance := 0.
	textoADevolver := ''.
	
	(cuentaAsociada transactions size) isZero ifTrue: [^ 'NO SE REGISTRAN TRANSACCIONES.
	Balance = 0 pesos'].
	
	cuentaAsociada transactions do: [:transaction |
		(transaction isKindOf: Deposit) ifTrue: [
			nombreTransaccion := 'Depósito por '.
			].
		(transaction isKindOf: Withdraw) ifTrue: [
			nombreTransaccion := 'Extracción por '.
			].
		(transaction isKindOf: TransferWithdrawLeg) ifTrue: [
			nombreTransaccion := 'Salida por transferencia de '.
			].
		(transaction isKindOf: TransferDepositLeg) ifTrue: [
			nombreTransaccion := 'Entrada por transferencia de '.
			].
	
		valorDeLaTransaccion := transaction value amount asString.
		moneda := transaction value unit nameForMany.
		balance := transaction affectBalance: balance.	
		
		nuevaLinea := (nombreTransaccion, valorDeLaTransaccion, ' ', moneda).
		lineas add: nuevaLinea.
		
		].
		
	lineas do: [:linea |
		textoADevolver := textoADevolver, linea, String newLineString.
		].
	
	"Esto es por si el balance da negativo"
	(balance isKindOf: CompoundMeasure) ifTrue: [ 
		balance := balance measures at: 1.
		].
	
	lineaFinal := 'Balance = ', balance amount asString, ' ', moneda.
	
	textoADevolver := textoADevolver, lineaFinal.
	
	^ textoADevolver.
	
	"((cuentaAsociada transactions at: 1) isKindOf: Deposit) ifTrue: [
				
		nombreTransaccion := 'Depósito por '.
		
		valorDeLaTransaccion := (cuentaAsociada transactions at: 1) value amount asString.
		
		valorDeLaTransaccionParaBalance := valorDeLaTransaccion.
		
		moneda := (cuentaAsociada transactions at: 1) value unit nameForMany.
		
		lineaFinal := 'Balance = ', valorDeLaTransaccionParaBalance, ' ', moneda.
		
		].
	((cuentaAsociada transactions at: 1) isKindOf: Withdraw ) ifTrue: [
				
		nombreTransaccion := 'Retiro por '.
		
		valorDeLaTransaccion := (cuentaAsociada transactions at: 1) value amount asString.
		
		valorDeLaTransaccionParaBalance := (((cuentaAsociada transactions at: 1) value amount) * -1 )asString.
		
		moneda := (cuentaAsociada transactions at: 1) value unit nameForMany.
		
		lineaFinal := 'Balance = ', valorDeLaTransaccionParaBalance, ' ', moneda.
		
		].
	
	((cuentaAsociada transactions at: 1) isKindOf: TransferWithdrawLeg ) ifTrue: [
				
		nombreTransaccion := 'Salida por transferencia de '.
		
		valorDeLaTransaccion := (cuentaAsociada transactions at: 1) value amount asString.
		
		valorDeLaTransaccionParaBalance := (((cuentaAsociada transactions at: 1) value amount) * -1 )asString.
		
		moneda := (cuentaAsociada transactions at: 1) value unit nameForMany.
		
		lineaFinal := 'Balance = ', valorDeLaTransaccionParaBalance, ' ', moneda.
		
		].
	
	((cuentaAsociada transactions at: 1) isKindOf: TransferDepositLeg ) ifTrue: [
				
		nombreTransaccion := 'Entrada por transferencia de '.
		
		valorDeLaTransaccion := (cuentaAsociada transactions at: 1) value amount asString.
		
		valorDeLaTransaccionParaBalance := valorDeLaTransaccion.
		
		moneda := (cuentaAsociada transactions at: 1) value unit nameForMany.
		
		lineaFinal := 'Balance = ', valorDeLaTransaccionParaBalance, ' ', moneda.
		
		].
	
	textoADevolver := nombreTransaccion, valorDeLaTransaccion, ' ', moneda, String newLineString , lineaFinal.
	
	^ textoADevolver."! !

!AccountSummary methodsFor: 'as yet unclassified' stamp: 'VDM 11/16/2022 19:38:49'!
transaccionesRealizadas: aSmallInteger 
	^ (cuentaAsociada transactions size) = aSmallInteger.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountSummary class' category: 'ServiciosFinancieros-II'!
AccountSummary class
	instanceVariableNames: ''!

!AccountSummary class methodsFor: 'as yet unclassified' stamp: 'VDM 11/16/2022 09:11:14'!
for: aReceptiveAccount 
	^ self new
		inicializeFor: aReceptiveAccount.! !


!classDefinition: #AccountTransaction category: 'ServiciosFinancieros-II'!
Object subclass: #AccountTransaction
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-II'!

!AccountTransaction methodsFor: 'value' stamp: 'HernanWilkinson 9/12/2011 12:25'!
value 

	self subclassResponsibility ! !


!AccountTransaction methodsFor: 'balance' stamp: 'HAW 5/25/2019 11:25:39'!
affectBalance: aBalance

	self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountTransaction class' category: 'ServiciosFinancieros-II'!
AccountTransaction class
	instanceVariableNames: ''!

!AccountTransaction class methodsFor: 'instance creation' stamp: 'NR 10/21/2019 18:54:27'!
register: aValue on: account

	| transaction |
	
	transaction := self for: aValue.
	account register: transaction.
		
	^ transaction! !


!classDefinition: #Deposit category: 'ServiciosFinancieros-II'!
AccountTransaction subclass: #Deposit
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-II'!

!Deposit methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:45'!
initializeFor: aValue

	value := aValue ! !


!Deposit methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:38'!
value

	^ value! !


!Deposit methodsFor: 'balance' stamp: 'HAW 5/25/2019 11:25:02'!
affectBalance: aBalance

	^aBalance + value ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Deposit class' category: 'ServiciosFinancieros-II'!
Deposit class
	instanceVariableNames: ''!

!Deposit class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:38'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #TransferLeg category: 'ServiciosFinancieros-II'!
AccountTransaction subclass: #TransferLeg
	instanceVariableNames: 'transfer'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-II'!

!TransferLeg methodsFor: 'value' stamp: 'LL 9/20/2020 22:27:32'!
value

	^transfer value! !


!TransferLeg methodsFor: 'initialization' stamp: 'LL 9/20/2020 22:28:14'!
initializeWith: aTransfer

	transfer := aTransfer! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TransferLeg class' category: 'ServiciosFinancieros-II'!
TransferLeg class
	instanceVariableNames: ''!

!TransferLeg class methodsFor: 'as yet unclassified' stamp: 'LL 9/20/2020 22:45:01'!
of: aTransfer on: anAccount

	| transaction |
	
	transaction := self new initializeWith: 	aTransfer.
	anAccount register: transaction.	
	
	^transaction! !


!classDefinition: #TransferDepositLeg category: 'ServiciosFinancieros-II'!
TransferLeg subclass: #TransferDepositLeg
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-II'!

!TransferDepositLeg methodsFor: 'accessing' stamp: 'LL 9/20/2020 22:26:10'!
withdrawLeg

	^transfer withdrawLeg! !


!TransferDepositLeg methodsFor: 'balance' stamp: 'LL 9/20/2020 22:27:49'!
affectBalance: aBalance

	^aBalance + self value! !


!classDefinition: #TransferWithdrawLeg category: 'ServiciosFinancieros-II'!
TransferLeg subclass: #TransferWithdrawLeg
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-II'!

!TransferWithdrawLeg methodsFor: 'accessing' stamp: 'LL 9/20/2020 22:25:47'!
depositLeg

	^transfer depositLeg! !


!TransferWithdrawLeg methodsFor: 'balance' stamp: 'LL 9/20/2020 22:27:55'!
affectBalance: aBalance

	^aBalance - self value! !


!classDefinition: #Withdraw category: 'ServiciosFinancieros-II'!
AccountTransaction subclass: #Withdraw
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-II'!

!Withdraw methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:46'!
initializeFor: aValue

	value := aValue ! !


!Withdraw methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:33'!
value

	^ value! !


!Withdraw methodsFor: 'balance' stamp: 'HAW 5/25/2019 11:25:15'!
affectBalance: aBalance

	^aBalance - value! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Withdraw class' category: 'ServiciosFinancieros-II'!
Withdraw class
	instanceVariableNames: ''!

!Withdraw class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:33'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #Transfer category: 'ServiciosFinancieros-II'!
Object subclass: #Transfer
	instanceVariableNames: 'value withdrawLeg depositLeg'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-II'!

!Transfer methodsFor: 'value' stamp: 'LL 9/20/2020 21:13:00'!
value

	^value! !


!Transfer methodsFor: 'accessing' stamp: 'LL 9/20/2020 22:39:46'!
depositLeg

	^depositLeg! !

!Transfer methodsFor: 'accessing' stamp: 'LL 9/20/2020 21:25:56'!
withdrawLeg
	
	^withdrawLeg! !


!Transfer methodsFor: 'initialization' stamp: 'LL 9/20/2020 21:25:21'!
initializeWith: aValue withdrawLeg: aWithdraw depositLeg: aDeposit

	value := aValue.
	withdrawLeg := aWithdraw.
	depositLeg := aDeposit! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Transfer class' category: 'ServiciosFinancieros-II'!
Transfer class
	instanceVariableNames: ''!

!Transfer class methodsFor: 'errors' stamp: 'LL 9/20/2020 22:57:30'!
cannotTransferToOriginErrorDescription
	
	^'Transfer destionation cannot be the origin account'! !

!Transfer class methodsFor: 'errors' stamp: 'LL 9/20/2020 23:00:53'!
cannotTransferZeroErrorDescription

	^'Transfer amount should be positive'! !

!Transfer class methodsFor: 'errors' stamp: 'LL 9/20/2020 22:56:35'!
signalCannotTransferToOrigin
	
	self error: self cannotTransferToOriginErrorDescription! !

!Transfer class methodsFor: 'errors' stamp: 'LL 9/20/2020 23:06:17'!
signalCannotTransferZero

	self error: self cannotTransferZeroErrorDescription! !


!Transfer class methodsFor: 'assertions' stamp: 'LL 9/20/2020 23:05:22'!
assert: anAmountOfMoney canBeTransferedTo: destinationAccount from: originAccount

	self assertCanTransferTo: destinationAccount from: originAccount.
	self assertCanTransfer: anAmountOfMoney! !

!Transfer class methodsFor: 'assertions' stamp: 'VDM 11/16/2022 07:26:19'!
assertCanTransfer: anAmountOfMoney

	^ anAmountOfMoney isZero ifTrue: [ self signalCannotTransferZero ]! !

!Transfer class methodsFor: 'assertions' stamp: 'LL 9/20/2020 23:04:58'!
assertCanTransferTo: destinationAccount from: originAccount

	^ originAccount = destinationAccount ifTrue: [ self signalCannotTransferToOrigin ]! !


!Transfer class methodsFor: 'instance creation' stamp: 'LL 9/20/2020 23:11:34'!
amount: anAmountOfMoney from: originAccount to: destinationAccount 
	
	| transfer depositLeg withdrawLeg |
	
	self assert: anAmountOfMoney canBeTransferedTo: destinationAccount from: originAccount.
	
	transfer := self new.
	
	withdrawLeg := TransferWithdrawLeg of: transfer on: originAccount.
	depositLeg := TransferDepositLeg of: transfer on: destinationAccount.
	
	^transfer initializeWith: anAmountOfMoney withdrawLeg: withdrawLeg depositLeg: depositLeg
	
	
	! !
