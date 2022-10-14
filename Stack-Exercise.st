!classDefinition: #ContenedorTest category: 'Stack-Exercise'!
TestCase subclass: #ContenedorTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!ContenedorTest methodsFor: 'as yet unclassified' stamp: 'VDM 10/14/2022 08:30:30'!
test01unContenedorConDatosInicializaSinElementosAlmacenados

	| contenedorConDatos |
	
	contenedorConDatos := ContenedorConDatos new.
	
	self assert: contenedorConDatos isEmpty.
	self assert: contenedorConDatos size equals: 0.! !

!ContenedorTest methodsFor: 'as yet unclassified' stamp: 'VDM 10/14/2022 08:36:59'!
test02unContenedorSinDatosInicializaVacio

	| contenedorVacio |
	
	contenedorVacio := ContenedorVacio new.
	
	self assert: contenedorVacio isEmpty.
	self assert: contenedorVacio size equals: 0.! !

!ContenedorTest methodsFor: 'as yet unclassified' stamp: 'VDM 10/14/2022 08:40:21'!
test03unContenedorSinDatosSiemprEstaVacio

	| contenedorVacio |
	
	contenedorVacio := ContenedorVacio new.
	
	contenedorVacio add: 'Uno'.
	contenedorVacio add: 'Dos'.
	
	self assert: contenedorVacio isEmpty.
	self assert: contenedorVacio size equals: 0.
	
	contenedorVacio add: 'Tres'.
	contenedorVacio add: 'Cuatro'.
	
	self assert: contenedorVacio isEmpty.
	self assert: contenedorVacio size equals: 0.
! !

!ContenedorTest methodsFor: 'as yet unclassified' stamp: 'VDM 10/14/2022 08:49:54'!
test04sePuedenAgregarElementosAUnContenedorConDatos

	| contenedorConDatos |
	
	contenedorConDatos := ContenedorConDatos new.
	
	contenedorConDatos add: 'Uno'.
	contenedorConDatos add: 'Dos'.
	
	self deny: contenedorConDatos isEmpty.
	self assert: contenedorConDatos size equals: 2.
	
	contenedorConDatos add: 'Tres'.
	contenedorConDatos add: 'Cuatro'.
	
	self deny: contenedorConDatos isEmpty.
	self assert: contenedorConDatos size equals: 4.
! !

!ContenedorTest methodsFor: 'as yet unclassified' stamp: 'VDM 10/14/2022 09:07:37'!
test05intentarRemoverElementoDeUnContenedorVacioLanzaUnError

	| contenedorVacio |
	
	contenedorVacio := ContenedorVacio new.
	
	self should: [contenedorVacio removeLast]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [:unError |
			self assert: Contenedor contenedorVacioErrorDescription equals: unError messageText.
			].
		! !

!ContenedorTest methodsFor: 'as yet unclassified' stamp: 'VDM 10/14/2022 09:15:22'!
test06sePuedenEliminarElementosDeUnContenedorConDatos

	| contenedorConDatos |
	
	contenedorConDatos := ContenedorConDatos new.
	
	contenedorConDatos add: 'Uno'.
	contenedorConDatos removeLast.
	
	self assert: contenedorConDatos isEmpty.! !

!ContenedorTest methodsFor: 'as yet unclassified' stamp: 'VDM 10/14/2022 09:19:04'!
test07intentarPedirUltimoElementoDeUnContenedorVacioLanzaUnError

	| contenedorVacio |
	
	contenedorVacio := ContenedorVacio new.
	
	self should: [contenedorVacio last]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [:unError |
			self assert: Contenedor contenedorVacioErrorDescription equals: unError messageText.
			].
		! !

!ContenedorTest methodsFor: 'as yet unclassified' stamp: 'VDM 10/14/2022 09:26:30'!
test08LastDevuelveUltimoElementosDeUnContenedorConDatos

	| contenedorConDatos objetoAgregado |
	
	contenedorConDatos := ContenedorConDatos new.
	
	objetoAgregado := 'Uno'.
	contenedorConDatos add: objetoAgregado.
		
	self assert: objetoAgregado equals: contenedorConDatos last.! !

!ContenedorTest methodsFor: 'as yet unclassified' stamp: 'VDM 10/14/2022 10:18:08'!
test09ContenedorConDatosSeComportaComoLIFO

	| segundoElementoAgregado primerElementoAgregado contenedorConDatos |
	
	contenedorConDatos := ContenedorConDatos new.
	
	primerElementoAgregado := 'Uno'.
	segundoElementoAgregado := 'Dos'.
	
	contenedorConDatos add: primerElementoAgregado.
	contenedorConDatos add: segundoElementoAgregado.
		
	self assert: segundoElementoAgregado equals: contenedorConDatos last.
	contenedorConDatos removeLast.
	self assert: primerElementoAgregado equals: contenedorConDatos last.
	contenedorConDatos removeLast.
	self assert: contenedorConDatos isEmpty.
	! !


!classDefinition: #OOStackTest category: 'Stack-Exercise'!
TestCase subclass: #OOStackTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackTest methodsFor: 'test' stamp: 'JMB 10/8/2022 18:00:02'!
test01StackShouldBeEmptyWhenCreated

	| stack |
	stack := OOStack new.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'JMB 10/8/2022 17:59:57'!
test02PushAddElementsToTheStack

	| stack |
	stack := OOStack new.
	
	stack push: 'something'.
	
	self deny: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'JMB 10/8/2022 17:59:50'!
test03PopRemovesElementsFromTheStack

	| stack |
	stack := OOStack new.
	stack push: 'something'.
	
	stack pop.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'JMB 10/8/2022 17:59:43'!
test04PopReturnsLastPushedObject

	| stack pushedObject |
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: pushedObject equals: stack pop! !

!OOStackTest methodsFor: 'test' stamp: 'JMB 10/8/2022 17:56:59'!
test05StackBehavesLIFO

	| stack firstPushedObject secondPushedObject |
	
	stack := OOStack new.
	firstPushedObject := 'first'.
	secondPushedObject := 'second'.
	
	stack push: firstPushedObject.
	stack push: secondPushedObject.
	
	self assert: secondPushedObject equals: stack pop.
	self assert: firstPushedObject equals: stack pop.
	self assert: stack isEmpty 
	! !

!OOStackTest methodsFor: 'test' stamp: 'JMB 10/8/2022 18:00:26'!
test06TopReturnsLastPushedObject

	| stack pushedObject |
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: pushedObject equals: stack top.
	! !

!OOStackTest methodsFor: 'test' stamp: 'JMB 10/8/2022 17:58:27'!
test07TopDoesNotRemoveObjectFromStack

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: 1 equals: stack size.
	stack top.
	self assert: 1 equals: stack size.
	! !

!OOStackTest methodsFor: 'test' stamp: 'JMB 10/8/2022 17:58:44'!
test08CanNotPopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: OOStack stackEmptyErrorDescription equals: anError messageText ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'JMB 10/8/2022 17:58:56'!
test09CanNotPopWhenThereAreNoObjectsInTheStackAndTheStackHadObjects

	| stack  |
	
	stack := OOStack new.
	stack push: 'something'.
	stack pop.
	
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: OOStack stackEmptyErrorDescription equals: anError messageText ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'JMB 10/8/2022 17:59:07'!
test10CanNotTopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack top ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: OOStack stackEmptyErrorDescription equals: anError messageText ]
		
! !


!classDefinition: #SentenceFinderByPrefixTest category: 'Stack-Exercise'!
TestCase subclass: #SentenceFinderByPrefixTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!


!classDefinition: #Contenedor category: 'Stack-Exercise'!
Object subclass: #Contenedor
	instanceVariableNames: 'elementosAlmacenados'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!Contenedor methodsFor: 'as yet unclassified' stamp: 'VDM 10/14/2022 08:26:08'!
isEmpty
	
	self subclassResponsibility.! !

!Contenedor methodsFor: 'as yet unclassified' stamp: 'VDM 10/14/2022 08:35:03'!
size

	self subclassResponsibility.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Contenedor class' category: 'Stack-Exercise'!
Contenedor class
	instanceVariableNames: ''!

!Contenedor class methodsFor: 'as yet unclassified' stamp: 'VDM 10/14/2022 09:03:22'!
contenedorVacioErrorDescription
	
	^ 'Stack is empty'! !


!classDefinition: #ContenedorConDatos category: 'Stack-Exercise'!
Contenedor subclass: #ContenedorConDatos
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!ContenedorConDatos methodsFor: 'as yet unclassified' stamp: 'VDM 10/14/2022 08:50:35'!
add: unElementoASerAgregado

	elementosAlmacenados add: unElementoASerAgregado.! !

!ContenedorConDatos methodsFor: 'as yet unclassified' stamp: 'VDM 10/14/2022 08:15:30'!
initialize

	elementosAlmacenados := OrderedCollection new.! !

!ContenedorConDatos methodsFor: 'as yet unclassified' stamp: 'VDM 10/14/2022 08:25:53'!
isEmpty
	
	^elementosAlmacenados isEmpty.! !

!ContenedorConDatos methodsFor: 'as yet unclassified' stamp: 'VDM 10/14/2022 09:27:01'!
last
	
	^elementosAlmacenados last.! !

!ContenedorConDatos methodsFor: 'as yet unclassified' stamp: 'VDM 10/14/2022 10:33:45'!
obtenerUltimoElemento

	^ self last.! !

!ContenedorConDatos methodsFor: 'as yet unclassified' stamp: 'VDM 10/14/2022 09:15:52'!
removeLast
	
	elementosAlmacenados removeLast.! !

!ContenedorConDatos methodsFor: 'as yet unclassified' stamp: 'VDM 10/14/2022 08:32:08'!
size
	
	^elementosAlmacenados size.! !

!ContenedorConDatos methodsFor: 'as yet unclassified' stamp: 'VDM 10/14/2022 10:29:05'!
teQuiteUnElemento

	(self isEmpty) ifTrue: [^ContenedorVacio new].
	
	^self.! !

!ContenedorConDatos methodsFor: 'as yet unclassified' stamp: 'VDM 10/14/2022 10:23:07'!
voyAAgregarUnElemento
	
	^self.! !


!classDefinition: #ContenedorVacio category: 'Stack-Exercise'!
Contenedor subclass: #ContenedorVacio
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!ContenedorVacio methodsFor: 'as yet unclassified' stamp: 'VDM 10/14/2022 08:43:19'!
add: unElementoASerIngresado
	
	^self.! !

!ContenedorVacio methodsFor: 'as yet unclassified' stamp: 'VDM 10/14/2022 08:28:20'!
isEmpty
	
	^true.! !

!ContenedorVacio methodsFor: 'as yet unclassified' stamp: 'VDM 10/14/2022 09:20:23'!
last

	^self obtenerUltimoElemento.

	
	
	! !

!ContenedorVacio methodsFor: 'as yet unclassified' stamp: 'VDM 10/14/2022 07:49:02'!
obtenerUltimoElemento
	
	^ self error: OOStack stackEmptyErrorDescription.! !

!ContenedorVacio methodsFor: 'as yet unclassified' stamp: 'VDM 10/14/2022 09:10:21'!
removeLast
	
	^ self error: Contenedor contenedorVacioErrorDescription.! !

!ContenedorVacio methodsFor: 'as yet unclassified' stamp: 'VDM 10/14/2022 08:32:25'!
size
	
	^0.! !

!ContenedorVacio methodsFor: 'as yet unclassified' stamp: 'VDM 10/14/2022 10:27:09'!
teQuiteUnElemento

	^self.! !

!ContenedorVacio methodsFor: 'as yet unclassified' stamp: 'VDM 10/14/2022 10:22:47'!
voyAAgregarUnElemento
	
	^ContenedorConDatos new.! !


!classDefinition: #OOStack category: 'Stack-Exercise'!
Object subclass: #OOStack
	instanceVariableNames: 'elementosAlmacenados'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStack methodsFor: 'inicializacion' stamp: 'VDM 10/14/2022 10:30:29'!
initialize
	
	elementosAlmacenados := ContenedorVacio new.! !


!OOStack methodsFor: 'acceso' stamp: 'VDM 10/11/2022 09:11:47'!
isEmpty
	
	^self stackEstaVacio.! !

!OOStack methodsFor: 'acceso' stamp: 'VDM 10/11/2022 09:20:42'!
size
	
	^self cantidadDeElementosAlmacenados.! !

!OOStack methodsFor: 'acceso' stamp: 'VDM 10/14/2022 10:31:03'!
top
	
	^elementosAlmacenados obtenerUltimoElemento.
	"self isEmpty ifTrue: [^ self error: OOStack stackEmptyErrorDescription.].
	^ self obtenerUltimoElemento."! !


!OOStack methodsFor: 'borrado' stamp: 'VDM 10/11/2022 09:12:58'!
pop
	
	| ultimo |
	ultimo := self top.
	self removerElemento.
	^ultimo.! !


!OOStack methodsFor: 'agregado' stamp: 'VDM 10/11/2022 09:13:18'!
push: unElementoASerAgregado 
	
	self agregarUnElemento: unElementoASerAgregado.! !


!OOStack methodsFor: 'acceso - privado' stamp: 'VDM 10/14/2022 10:31:39'!
agregarUnElemento: unElementoASerAgregado 
	
	elementosAlmacenados := elementosAlmacenados voyAAgregarUnElemento.
	elementosAlmacenados add: unElementoASerAgregado.! !

!OOStack methodsFor: 'acceso - privado' stamp: 'VDM 10/11/2022 09:20:09'!
cantidadDeElementosAlmacenados
	
	^elementosAlmacenados size.! !

!OOStack methodsFor: 'acceso - privado' stamp: 'VDM 10/11/2022 09:26:00'!
obtenerUltimoElemento

	^elementosAlmacenados last! !

!OOStack methodsFor: 'acceso - privado' stamp: 'VDM 10/14/2022 10:31:54'!
removerElemento

	elementosAlmacenados removeLast.
	
	elementosAlmacenados := elementosAlmacenados teQuiteUnElemento.! !

!OOStack methodsFor: 'acceso - privado' stamp: 'VDM 10/11/2022 09:11:39'!
stackEstaVacio
	
	^elementosAlmacenados isEmpty.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStack class' category: 'Stack-Exercise'!
OOStack class
	instanceVariableNames: ''!

!OOStack class methodsFor: 'error descriptions' stamp: 'HernanWilkinson 5/7/2012 11:51'!
stackEmptyErrorDescription
	
	^ 'Stack is empty'! !


!classDefinition: #SentenceFinderByPrefix category: 'Stack-Exercise'!
Object subclass: #SentenceFinderByPrefix
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!
