!classDefinition: #AccountSummaryTest category: 'ServiciosFinancieros-II'!
TestCase subclass: #AccountSummaryTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-II'!

!AccountSummaryTest methodsFor: 'as yet unclassified' stamp: 'UM 11/18/2022 13:44:44'!
test01ElResumenSabeSiNoSeRealizaronTransaccionesEnUnaReceptiveAccount
	| accountSummary cuenta |
	cuenta := ReceptiveAccount new.
	accountSummary := AccountSummary for: cuenta.
	self assert: accountSummary textoSiNoHayTransacciones equals: accountSummary resumenGeneral.
	self assert: (accountSummary transaccionesRealizadasVERSILODEJAMOS: 0).! !

!AccountSummaryTest methodsFor: 'as yet unclassified' stamp: 'UM 11/18/2022 13:44:44'!
test02ElResumenSabeSiNoSeRealizaronTransaccionesEnUnPortfolio

	| accountSummary cuenta |
	cuenta := Portfolio new.
	accountSummary := AccountSummary for: cuenta.
	self assert: accountSummary textoSiNoHayTransacciones equals: accountSummary resumenGeneral.
	self assert: (accountSummary transaccionesRealizadasVERSILODEJAMOS: 0).! !

!AccountSummaryTest methodsFor: 'as yet unclassified' stamp: 'UM 11/18/2022 13:44:44'!
test03SiSeRealizaUnDepositoEnUnaReceptiveAccountSeRegistraEnSuResumen
	| accountSummary cuenta |
	cuenta := ReceptiveAccount new.
	Deposit register: 30 * peso on: cuenta.
	accountSummary := AccountSummary for: cuenta.

	self assert: ('Depósito por 30 * pesos', String newLineString, 'Balance = 30 * pesos') equals: accountSummary resumenGeneral.	
	self assert: (accountSummary transaccionesRealizadasVERSILODEJAMOS: 1).! !

!AccountSummaryTest methodsFor: 'as yet unclassified' stamp: 'UM 11/18/2022 13:44:44'!
test03SiSeRealizaUnRetiroEnUnaReceptiveAccountSeRegistraEnSuResumen
	| accountSummary cuenta |
	cuenta := ReceptiveAccount new.
	Withdraw register: 100 * peso on: cuenta.
	accountSummary := AccountSummary for: cuenta.
	
	self assert: ('Extracción por 100 * pesos', String newLineString, 'Balance = -100 * pesos') equals: accountSummary resumenGeneral.	
	self assert: (accountSummary transaccionesRealizadasVERSILODEJAMOS: 1).! !

!AccountSummaryTest methodsFor: 'as yet unclassified' stamp: 'UM 11/18/2022 13:44:44'!
test04LasTransferenciasQuedanRegistradasEnElResumen
	| accountSummary1 accountSummary2 cuenta1 cuenta2|
	cuenta1 := ReceptiveAccount new.
	cuenta2 := ReceptiveAccount new.
	Transfer amount: 123 * peso from: cuenta1 to: cuenta2.
	accountSummary1 := AccountSummary for: cuenta1.
	accountSummary2 := AccountSummary for: cuenta2.
	self assert: ('Salida por transferencia de 123 * pesos', String newLineString, 'Balance = -123 * pesos') equals: accountSummary1 resumenGeneral.	
	self assert: (accountSummary1 transaccionesRealizadasVERSILODEJAMOS: 1).
	self assert: ('Entrada por transferencia de 123 * pesos', String newLineString, 'Balance = 123 * pesos') equals: accountSummary2 resumenGeneral.	
	self assert: (accountSummary2 transaccionesRealizadasVERSILODEJAMOS: 1).! !

!AccountSummaryTest methodsFor: 'as yet unclassified' stamp: 'UM 11/18/2022 13:44:44'!
test05VariasTransaccionesQuedanRegistradasEnElResumen

	| accountSummary cuenta1 cuenta2|
	cuenta1 := ReceptiveAccount new.
	cuenta2 := ReceptiveAccount new.
	accountSummary := AccountSummary for: cuenta1.
	Deposit register: 100 * peso on: cuenta1.
	Withdraw register: 50 * peso on: cuenta1.
	Transfer amount: 50 * peso from: cuenta1 to: cuenta2.
	Transfer amount: 30 * peso from: cuenta2 to: cuenta1.
	
	self assert: ('Depósito por 100 * pesos', String newLineString, 'Extracción por 50 * pesos', String newLineString, 'Salida por transferencia de 50 * pesos', String newLineString, 'Entrada por transferencia de 30 * pesos', String newLineString, 'Balance = 30 * pesos') equals: accountSummary resumenGeneral.	
	self assert: (accountSummary transaccionesRealizadasVERSILODEJAMOS: 4).! !

!AccountSummaryTest methodsFor: 'as yet unclassified' stamp: 'UM 11/18/2022 13:27:06'!
test06ElResumenDeUnPortfolioReflejaLasTransaccionesDeTodasSusCuentas
	| accountSummary portfolio cuenta1 cuenta2 |
	portfolio := Portfolio new.
	cuenta1 := ReceptiveAccount new.
	cuenta2 := ReceptiveAccount new.
	
	portfolio add: cuenta1.
	portfolio add: cuenta2.
	
	Deposit register: 30 * peso on: cuenta1.
	Transfer amount: 10 * peso from: cuenta1 to: cuenta2.
	accountSummary := AccountSummary for: portfolio.
	self assert: ('Depósito por 30 * pesos', String newLineString, 'Salida por transferencia de 10 * pesos', String newLineString, 'Entrada por transferencia de 10 * pesos', String newLineString, 'Balance = 30 * pesos') equals: accountSummary resumenGeneral.	! !


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


!classDefinition: #PortfolioTreePrinterTest category: 'ServiciosFinancieros-II'!
TestCase subclass: #PortfolioTreePrinterTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-II'!

!PortfolioTreePrinterTest methodsFor: 'as yet unclassified' stamp: 'UM 11/18/2022 14:23:57'!
test01SiElPortfolioNoTieneCuentasSuEstructuraEstaVacia

	| portfolioTreePrinter |
	portfolioTreePrinter := PortfolioTreePrinter for: (Portfolio named: 'Portfolio vacio').
	
	self assert: 'Portfolio vacio' equals: portfolioTreePrinter estructura.

	! !

!PortfolioTreePrinterTest methodsFor: 'as yet unclassified' stamp: 'UM 11/18/2022 16:55:33'!
test02ElPortfolioReflejaSusCuentasEnSuEstructura

	| portfolio cuenta1 cuenta2 portfolioTreePrinter |
	
	portfolio := Portfolio named: 	'Portfolio de hijos'.
	cuenta1 := ReceptiveAccount named: 'Cuenta de Juan'.
	cuenta2 := ReceptiveAccount named: 'Cuenta de Angeles'.
	
	portfolio add: cuenta1.
	portfolio add: cuenta2.
	
	portfolioTreePrinter := PortfolioTreePrinter for: portfolio.
	
	self assert: 'Portfolio de hijos
	Cuenta de Juan
	Cuenta de Angeles
' equals: portfolioTreePrinter estructura.

	! !

!PortfolioTreePrinterTest methodsFor: 'as yet unclassified' stamp: 'UM 11/18/2022 14:31:31'!
test03UnPortfolioPadreDevuelveEnSuEstructuraASusCuentasYLaEstructuraDeSusPortfoliosHijos

	| portfolioHijos cuenta1 cuenta2 portfolioTreePrinter portfolioFamilia cuentaMia |
	
	portfolioFamilia := Portfolio named: 'Portfolio de la familia'.
	portfolioHijos := Portfolio named: 	'Portfolio de hijos'.
	cuenta1 := ReceptiveAccount named: 'Cuenta de Juan'.
	cuenta2 := ReceptiveAccount named: 'Cuenta de Angeles'.
	cuentaMia := ReceptiveAccount named: 'Cuenta mia'.
	
	portfolioHijos add: cuenta1.
	portfolioHijos add: cuenta2.
	portfolioFamilia add: portfolioHijos.
	portfolioFamilia add: cuentaMia.
	
	portfolioTreePrinter := PortfolioTreePrinter for: portfolioFamilia.
	
	self assert: 'Portfolio de la familia
	Cuenta mia
	Portfolio de hijos
		Cuenta de Juan
		Cuenta de Angeles' equals: portfolioTreePrinter estructura.

	! !


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


!classDefinition: #TransferNetReportTests category: 'ServiciosFinancieros-II'!
TestCase subclass: #TransferNetReportTests
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-II'!

!TransferNetReportTests methodsFor: 'as yet unclassified' stamp: 'UM 11/18/2022 13:28:14'!
test01SiNoHayTransferenciasElReporteNetoDeTransferenciasDaCero

	| netReport cuenta |
	
	cuenta := ReceptiveAccount new.
	netReport := TransferNetReport for: cuenta.
	
	Deposit register: 50*peso on: cuenta.
	
	self assert: 0 * peso equals: (netReport reporte).! !

!TransferNetReportTests methodsFor: 'as yet unclassified' stamp: 'VDM 11/17/2022 22:43:05'!
test02AlRealizarUnaTransferenciaSeVeReflejadaEnElRporteNetoDeTransferenciasDeCadaPata

	| netReport1 cuenta1 cuenta2 netReport2 |
	cuenta1 := ReceptiveAccount new.
	cuenta2 := ReceptiveAccount new.

	netReport1 := TransferNetReport for: cuenta1.
	netReport2 := TransferNetReport for: cuenta2.
	
	Transfer amount: 100 * peso from: cuenta1 to: cuenta2.
	
	self assert: -100 * peso equals: (netReport1 reporte).

	self assert: 100 * peso equals: (netReport2 reporte).! !

!TransferNetReportTests methodsFor: 'as yet unclassified' stamp: 'UM 11/18/2022 13:36:34'!
test03VariasTransferenciasSeVenReflejadasEnElReporteNeto

	| netReport cuenta1 cuenta2|
	
	cuenta1 := ReceptiveAccount new.
	cuenta2 := ReceptiveAccount new.
	netReport := TransferNetReport for: cuenta1.
	
	Deposit register: 100 * peso on: cuenta1.
	Withdraw register: 50 * peso on: cuenta1.
	Transfer amount: 20 * peso from: cuenta1 to: cuenta2.
	Transfer amount: 30 * peso from: cuenta2 to: cuenta1.
	
	self assert: 10 * peso equals: (netReport reporte).	! !

!TransferNetReportTests methodsFor: 'as yet unclassified' stamp: 'UM 11/18/2022 13:37:18'!
test04LasTranferenciasSeVenReflejadasEnElReporteNetoDelPortfolio

	| netReport portfolio cuenta1 cuenta2|
	
	portfolio := Portfolio new.
	cuenta1 := ReceptiveAccount new.
	cuenta2 := ReceptiveAccount new.
	netReport := TransferNetReport for: portfolio.
	
	portfolio add: cuenta1.
	
	Deposit register: 100 * peso on: cuenta1.
	Withdraw register: 50 * peso on: cuenta1.
	Transfer amount: 20 * peso from: cuenta1 to: cuenta2.
	Transfer amount: 30 * peso from: cuenta2 to: cuenta1.
	
	
	self assert: 10 * peso equals: (netReport reporte).	! !


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
	instanceVariableNames: 'Tabulacion'
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
	instanceVariableNames: 'accounts portfolioName'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-II'!

!Portfolio methodsFor: 'initialization' stamp: 'LL 7/1/2021 03:21:03'!
initialize

	accounts := OrderedCollection new.! !

!Portfolio methodsFor: 'initialization' stamp: 'UM 11/18/2022 13:57:34'!
initializeNamed: aPortfolioName 
	
	portfolioName := aPortfolioName.! !


!Portfolio methodsFor: 'main protocol' stamp: 'UM 11/18/2022 16:13:47'!
accountsAmount

	^accounts size.! !

!Portfolio methodsFor: 'main protocol' stamp: 'UM 11/18/2022 17:19:00'!
afectarEstructura: unaEstructura 

	unaEstructura add: (portfolioName).
	accounts  do: [:anAccount |	anAccount afectarEstructura: unaEstructura.].! !

!Portfolio methodsFor: 'main protocol' stamp: 'UM 11/17/2022 18:45:42'!
balance
	
	^accounts sum: [ :anAccount | anAccount balance ] ifEmpty: [ 0*peso ]! !

!Portfolio methodsFor: 'main protocol' stamp: 'UM 11/18/2022 13:32:52'!
deposoits
	
	^self transactions select: [:transaction | transaction isKindOf: Deposit].! !

!Portfolio methodsFor: 'main protocol' stamp: 'HAW 5/25/2019 11:28:29'!
hasRegistered: aTransaction

	^accounts anySatisfy: [ :anAccount | anAccount hasRegistered: aTransaction ]! !

!Portfolio methodsFor: 'main protocol' stamp: 'UM 11/18/2022 16:14:31'!
name

	^portfolioName copy.! !

!Portfolio methodsFor: 'main protocol' stamp: 'HAW 5/25/2019 11:38:32'!
transactions
	
	| transactions |
	
	transactions := OrderedCollection new.
	accounts do: [ :anAccount | anAccount addTransactionsTo: transactions ].
	
	^transactions ! !

!Portfolio methodsFor: 'main protocol' stamp: 'UM 11/18/2022 13:31:52'!
transfers
	
	^self transactions select: [:transaction | transaction isKindOf: TransferLeg].! !

!Portfolio methodsFor: 'main protocol' stamp: 'UM 11/18/2022 13:33:05'!
withdraws
	
	^self transactions select: [:transaction | transaction isKindOf: Withdraw].! !


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


!Portfolio class methodsFor: 'instance creation' stamp: 'UM 11/18/2022 13:57:22'!
named: aPortfolioName 
	
	^self new initializeNamed: aPortfolioName ! !


!classDefinition: #ReceptiveAccount category: 'ServiciosFinancieros-II'!
Account subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions receptiveAccountName'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-II'!

!ReceptiveAccount methodsFor: 'initialization' stamp: 'VDM 11/15/2022 18:45:53'!
initialize

	super initialize.
	transactions := OrderedCollection new.! !

!ReceptiveAccount methodsFor: 'initialization' stamp: 'UM 11/18/2022 13:58:14'!
initializeNamed: aReceptiveAccountName 
	
	receptiveAccountName := aReceptiveAccountName.! !


!ReceptiveAccount methodsFor: 'main protocol' stamp: 'UM 11/18/2022 16:43:36'!
afectarEstructura: unaEstructura 
	
	unaEstructura add: ('	', receptiveAccountName).! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'UM 11/17/2022 18:45:36'!
balance

	^transactions 
		inject: 0*peso
		into: [ :currentBalance :transaction | transaction affectBalance: currentBalance ]! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'UM 11/17/2022 21:18:54'!
deposits
	
	^transactions select: [:transaction | transaction isKindOf: Deposit].! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'NR 10/21/2019 18:55:56'!
hasRegistered: aTransaction

	^ transactions includes: aTransaction 
! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'UM 11/18/2022 17:22:11'!
name

	^receptiveAccountName  copy.! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'HernanWilkinson 7/13/2011 18:37'!
register: aTransaction

	transactions add: aTransaction 
! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'HernanWilkinson 7/13/2011 18:37'!
transactions 

	^ transactions copy! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'UM 11/17/2022 19:46:37'!
transfers
	
	^transactions select: [:transaction | transaction isKindOf: TransferLeg].! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'UM 11/17/2022 21:20:26'!
withdraws
	
	^transactions select: [:aTransaction | aTransaction isKindOf: Withdraw].! !


!ReceptiveAccount methodsFor: 'private' stamp: 'HAW 5/25/2019 11:38:52'!
addTransactionsTo: aCollectionOfTransactions

	aCollectionOfTransactions addAll: transactions ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'ReceptiveAccount class' category: 'ServiciosFinancieros-II'!
ReceptiveAccount class
	instanceVariableNames: ''!

!ReceptiveAccount class methodsFor: 'instance creation' stamp: 'UM 11/18/2022 13:58:06'!
named: aReceptiveAccountName 
	
	^self new initializeNamed: aReceptiveAccountName ! !


!classDefinition: #AccountSummary category: 'ServiciosFinancieros-II'!
Object subclass: #AccountSummary
	instanceVariableNames: 'cuentaAsociada'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-II'!

!AccountSummary methodsFor: 'as yet unclassified' stamp: 'UM 11/18/2022 13:44:44'!
transaccionesRealizadasVERSILODEJAMOS: aSmallInteger 
	^ (cuentaAsociada transactions size) = aSmallInteger.! !


!AccountSummary methodsFor: 'initialization' stamp: 'UM 11/17/2022 18:41:05'!
inicializeFor: aReceptiveAccount 

	cuentaAsociada := aReceptiveAccount.
	! !


!AccountSummary methodsFor: 'reporting' stamp: 'UM 11/18/2022 13:12:19'!
resumenGeneral
	| nombreTransaccion textoADevolver lineaFinal lineas balance|
	lineas := OrderedCollection new.
	balance := 0*peso.
	textoADevolver := ''.
	
	
	(cuentaAsociada transactions size) isZero ifTrue: [^ self textoSiNoHayTransacciones].
	cuentaAsociada transactions do: [:transaction |
		nombreTransaccion := transaction nombreDeLaTransaccion.
		balance := transaction affectBalance: balance.		
		lineas add: (nombreTransaccion).		].
	lineas do: [:linea |		textoADevolver := textoADevolver, linea, String newLineString.		].
		lineaFinal := 'Balance = ', balance asString.	textoADevolver := textoADevolver, lineaFinal.
	^ textoADevolver.! !


!AccountSummary methodsFor: 'private' stamp: 'VDM 11/17/2022 22:20:48'!
textoSiNoHayTransacciones
	^ ('NO SE REGISTRAN TRANSACCIONES
	Balance = 0 * pesos')! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountSummary class' category: 'ServiciosFinancieros-II'!
AccountSummary class
	instanceVariableNames: ''!

!AccountSummary class methodsFor: 'as yet unclassified' stamp: 'UM 11/17/2022 18:40:52'!
for: aReceptiveAccount 
	^ self new
		inicializeFor: aReceptiveAccount.! !


!classDefinition: #AccountTransaction category: 'ServiciosFinancieros-II'!
Object subclass: #AccountTransaction
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-II'!

!AccountTransaction methodsFor: 'value' stamp: 'VDM 11/17/2022 22:14:27'!
nombreDeLaTransaccion

	self subclassResponsibility.! !

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


!Deposit methodsFor: 'value' stamp: 'VDM 11/17/2022 22:13:26'!
nombreDeLaTransaccion

	^ ('Depósito por ', value asString).! !

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

!TransferDepositLeg methodsFor: 'accessing' stamp: 'VDM 11/17/2022 22:13:26'!
nombreDeLaTransaccion

	^ ('Entrada por transferencia de ', self value asString).! !

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

!TransferWithdrawLeg methodsFor: 'accessing' stamp: 'VDM 11/17/2022 22:13:26'!
nombreDeLaTransaccion

	^ ('Salida por transferencia de ', self value asString).! !


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


!Withdraw methodsFor: 'value' stamp: 'VDM 11/17/2022 22:13:26'!
nombreDeLaTransaccion

	^ ('Extracción por ', value asString).! !

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


!classDefinition: #PortfolioTreePrinter category: 'ServiciosFinancieros-II'!
Object subclass: #PortfolioTreePrinter
	instanceVariableNames: 'portfolio portfolioAsociado'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-II'!

!PortfolioTreePrinter methodsFor: 'initialization' stamp: 'UM 11/18/2022 13:51:45'!
initializeFor: aPortfolio 
	
	portfolioAsociado := aPortfolio.! !


!PortfolioTreePrinter methodsFor: 'reporting' stamp: 'UM 11/18/2022 17:22:44'!
estructura
	
	| textoADevolver lineas |
	
	lineas := OrderedCollection new.
	
	textoADevolver := ''.
	
	(portfolioAsociado accountsAmount isZero) ifTrue: [^ portfolioAsociado name].
	
	portfolioAsociado afectarEstructura: lineas.
	
	lineas do: [:linea |
		textoADevolver := textoADevolver, linea, String newLineString.
		].
		
	
	^ textoADevolver.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PortfolioTreePrinter class' category: 'ServiciosFinancieros-II'!
PortfolioTreePrinter class
	instanceVariableNames: ''!

!PortfolioTreePrinter class methodsFor: 'instance creation' stamp: 'UM 11/18/2022 13:51:24'!
for: aPortfolio 
	
	^self new initializeFor: aPortfolio ! !


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


!classDefinition: #TransferNetReport category: 'ServiciosFinancieros-II'!
Object subclass: #TransferNetReport
	instanceVariableNames: 'receptiveAccount cuentaAsociada'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-II'!

!TransferNetReport methodsFor: 'initialization' stamp: 'VDM 11/17/2022 22:38:06'!
initializeFor: aReceptiveAccount 
	
	cuentaAsociada := aReceptiveAccount.! !


!TransferNetReport methodsFor: 'reporting' stamp: 'VDM 11/17/2022 22:40:40'!
reporte
	
	|balance|
	
	balance := 0 * peso.
	cuentaAsociada transfers do: [:aTransaction | balance := aTransaction affectBalance: balance].
	^ balance.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TransferNetReport class' category: 'ServiciosFinancieros-II'!
TransferNetReport class
	instanceVariableNames: ''!

!TransferNetReport class methodsFor: 'as yet unclassified' stamp: 'VDM 11/17/2022 22:37:22'!
for: aReceptiveAccount 
	^ self new
		initializeFor: aReceptiveAccount.! !
