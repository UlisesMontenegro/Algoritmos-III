!classDefinition: #ContenedorTest category: 'Stack-Exercise'!
TestCase subclass: #ContenedorTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!ContenedorTest methodsFor: 'as yet unclassified'!
test01unContenedorConDatosInicializaSinElementosAlmacenados

	| contenedorConDatos |
	
	contenedorConDatos := ContenedorConDatos new.
	
	self assert: contenedorConDatos isEmpty.
	self assert: contenedorConDatos size equals: 0.! !

!ContenedorTest methodsFor: 'as yet unclassified'!
test02unContenedorSinDatosInicializaVacio

	| contenedorVacio |
	
	contenedorVacio := ContenedorVacio new.
	
	self assert: contenedorVacio isEmpty.
	self assert: contenedorVacio size equals: 0.! !

!ContenedorTest methodsFor: 'as yet unclassified'!
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

!ContenedorTest methodsFor: 'as yet unclassified'!
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

!ContenedorTest methodsFor: 'as yet unclassified'!
test05intentarRemoverElementoDeUnContenedorVacioLanzaUnError

	| contenedorVacio |
	
	contenedorVacio := ContenedorVacio new.
	
	self should: [contenedorVacio removeLast]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [:unError |
			self assert: Contenedor contenedorVacioErrorDescription equals: unError messageText.
			].
		! !

!ContenedorTest methodsFor: 'as yet unclassified'!
test06sePuedenEliminarElementosDeUnContenedorConDatos

	| contenedorConDatos |
	
	contenedorConDatos := ContenedorConDatos new.
	
	contenedorConDatos add: 'Uno'.
	contenedorConDatos removeLast.
	
	self assert: contenedorConDatos isEmpty.! !

!ContenedorTest methodsFor: 'as yet unclassified'!
test07intentarPedirUltimoElementoDeUnContenedorVacioLanzaUnError

	| contenedorVacio |
	
	contenedorVacio := ContenedorVacio new.
	
	self should: [contenedorVacio last]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [:unError |
			self assert: Contenedor contenedorVacioErrorDescription equals: unError messageText.
			].
		! !

!ContenedorTest methodsFor: 'as yet unclassified'!
test08LastDevuelveUltimoElementosDeUnContenedorConDatos

	| contenedorConDatos objetoAgregado |
	
	contenedorConDatos := ContenedorConDatos new.
	
	objetoAgregado := 'Uno'.
	contenedorConDatos add: objetoAgregado.
		
	self assert: objetoAgregado equals: contenedorConDatos last.! !

!ContenedorTest methodsFor: 'as yet unclassified'!
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

!OOStackTest methodsFor: 'test'!
test01StackShouldBeEmptyWhenCreated

	| stack |
	stack := OOStack new.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test'!
test02PushAddElementsToTheStack

	| stack |
	stack := OOStack new.
	
	stack push: 'something'.
	
	self deny: stack isEmpty! !

!OOStackTest methodsFor: 'test'!
test03PopRemovesElementsFromTheStack

	| stack |
	stack := OOStack new.
	stack push: 'something'.
	
	stack pop.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test'!
test04PopReturnsLastPushedObject

	| stack pushedObject |
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: pushedObject equals: stack pop! !

!OOStackTest methodsFor: 'test'!
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

!OOStackTest methodsFor: 'test'!
test06TopReturnsLastPushedObject

	| stack pushedObject |
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: pushedObject equals: stack top.
	! !

!OOStackTest methodsFor: 'test'!
test07TopDoesNotRemoveObjectFromStack

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: 1 equals: stack size.
	stack top.
	self assert: 1 equals: stack size.
	! !

!OOStackTest methodsFor: 'test'!
test08CanNotPopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: OOStack stackEmptyErrorDescription equals: anError messageText ]
		
! !

!OOStackTest methodsFor: 'test'!
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

!OOStackTest methodsFor: 'test'!
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

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'VDM 10/14/2022 16:13:26'!
test01SiElPrefijoTieneEspaciosDevuelveColeccionVacia
	
	| stack buscadorPorPrefijo  resultado objetoPusheado |
	
	stack := OOStack new.
	buscadorPorPrefijo := SentenceFinderByPrefix new.
	buscadorPorPrefijo setearColaboradorInterno: stack.
	
	objetoPusheado := 'Hola amigo'.
	
	stack push: objetoPusheado.
	
	resultado := buscadorPorPrefijo find: 'Hol a'.
	
	self assert: resultado isEmpty.! !

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'VDM 10/14/2022 17:06:49'!
test02SiElPrefijoEsUnStringVacioDevuelveColeccionVacia
	
	| stack buscadorPorPrefijo  resultado objetoPusheado |
	
	stack := OOStack new.
	buscadorPorPrefijo := SentenceFinderByPrefix new.
	buscadorPorPrefijo setearColaboradorInterno: stack.
	
	objetoPusheado := 'Hola amigo'.
	
	stack push: objetoPusheado.
	
	resultado := buscadorPorPrefijo find: ''.
	
	self assert: resultado isEmpty.! !

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'VDM 10/14/2022 17:06:55'!
test03SiElPrefijoEsUnNumeroDevuelveColeccionVacia
	
	| stack buscadorPorPrefijo  resultado objetoPusheado |
	
	stack := OOStack new.
	buscadorPorPrefijo := SentenceFinderByPrefix new.
	buscadorPorPrefijo setearColaboradorInterno: stack.
	
	objetoPusheado := 'Hola amigo'.
	
	stack push: objetoPusheado.
	
	resultado := buscadorPorPrefijo find: 1.
	
	self assert: resultado isEmpty.! !

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'VDM 10/14/2022 17:20:27'!
test04SiNoEncuentraLoBuscadoDevuelveUnColeccionVacia
	
	| objetoPusheado stack buscadorPorPrefijo  |
	
	stack := OOStack new.
	buscadorPorPrefijo := SentenceFinderByPrefix new.
	buscadorPorPrefijo setearColaboradorInterno: stack.
	
	objetoPusheado := 'Hola'.
		
	stack push: objetoPusheado .
	
	"buscadorPorPrefijo find: 'Ch'."
	
	self assert: [(buscadorPorPrefijo find: 'Ch') isEmpty].! !

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'VDM 10/14/2022 17:21:44'!
test05DevuelveTodasLasAparicionesDeLasOracionesConElPrefijoBuscado
	
	| stack buscadorPorPrefijo  primerObjetoPusheado segundoObjetoPusheado tercerObjetoPusheado resultado resultadoEsperado |
	
	stack := OOStack new.
	buscadorPorPrefijo := SentenceFinderByPrefix new.
	buscadorPorPrefijo setearColaboradorInterno: stack.
	
	primerObjetoPusheado := 'Hola amigo'.
	segundoObjetoPusheado := 'Bye enemigo'.
	tercerObjetoPusheado := 'Holanda lindo pais'.
	
	resultadoEsperado := OrderedCollection with: tercerObjetoPusheado with: primerObjetoPusheado.
	stack push: primerObjetoPusheado.
	stack push: segundoObjetoPusheado.
	stack push: tercerObjetoPusheado.
	
	resultado := buscadorPorPrefijo find: 'Hol'.
	
	self assert: resultado equals: resultadoEsperado.! !

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'VDM 10/14/2022 17:07:14'!
test06DevuelveTodasLasAparicionesDeLasOracionesRepetidasConElPrefijoBuscado
	
	| stack buscadorPorPrefijo  primerObjetoPusheado segundoObjetoPusheado tercerObjetoPusheado resultado resultadoEsperado |
	
	stack := OOStack new.
	buscadorPorPrefijo := SentenceFinderByPrefix new.
	buscadorPorPrefijo setearColaboradorInterno: stack.
	
	primerObjetoPusheado := 'Hola amigo'.
	segundoObjetoPusheado := 'Bye enemigo'.
	tercerObjetoPusheado := 'Hola amigo'.
	
	resultadoEsperado := OrderedCollection with: primerObjetoPusheado with: tercerObjetoPusheado.
	
	stack push: primerObjetoPusheado.
	stack push: segundoObjetoPusheado.
	stack push: tercerObjetoPusheado.
	
	resultado := buscadorPorPrefijo find: 'Hol'.
	
	self assert: resultado equals: resultadoEsperado.! !

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'VDM 10/14/2022 17:07:22'!
test07AlDevolverLoEncontradoElStackMantieneElOrden
	
	| stack buscadorPorPrefijo primerObjetoPusheado segundoObjetoPusheado |
	stack := OOStack new.
	buscadorPorPrefijo := SentenceFinderByPrefix new.
	buscadorPorPrefijo setearColaboradorInterno: stack.
	
	
	
	primerObjetoPusheado := 'Hola'.
	segundoObjetoPusheado := 'Chau'.
	
	stack push: primerObjetoPusheado .
	stack push: segundoObjetoPusheado .
	
	buscadorPorPrefijo find: 'Ho'.
	
	self assert: segundoObjetoPusheado equals: stack pop.
	self assert: primerObjetoPusheado equals: stack pop.
	self assert: stack isEmpty 
	
	
	! !


!classDefinition: #Contenedor category: 'Stack-Exercise'!
Object subclass: #Contenedor
	instanceVariableNames: 'elementosAlmacenados'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!Contenedor methodsFor: 'as yet unclassified'!
isEmpty
	
	self subclassResponsibility.! !

!Contenedor methodsFor: 'as yet unclassified'!
size

	self subclassResponsibility.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Contenedor class' category: 'Stack-Exercise'!
Contenedor class
	instanceVariableNames: ''!

!Contenedor class methodsFor: 'as yet unclassified'!
con: unaColeccionOrdenada

	Contenedor subclasses
		detect: [:unaSubclase | unaSubclase puedeInstanciarseCon: unaColeccionOrdenada]
		ifFound: [:subclaseSeleccionada | ^subclaseSeleccionada new inicializarCon: unaColeccionOrdenada]
		ifNone: [self error: 'unaColeccionOrdenada debe ser una OrderedCollection'].! !

!Contenedor class methodsFor: 'as yet unclassified'!
contenedorVacioErrorDescription
	
	^ 'Stack is empty'! !


!classDefinition: #ContenedorConDatos category: 'Stack-Exercise'!
Contenedor subclass: #ContenedorConDatos
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!ContenedorConDatos methodsFor: 'as yet unclassified'!
add: unElementoASerAgregado

	elementosAlmacenados add: unElementoASerAgregado.! !

!ContenedorConDatos methodsFor: 'as yet unclassified' stamp: 'VDM 10/14/2022 13:00:24'!
inicializarCon: unaColeccionOrdenada

	elementosAlmacenados := unaColeccionOrdenada.

	! !

!ContenedorConDatos methodsFor: 'as yet unclassified'!
initialize

	elementosAlmacenados := OrderedCollection new.! !

!ContenedorConDatos methodsFor: 'as yet unclassified'!
isEmpty
	
	^elementosAlmacenados isEmpty.! !

!ContenedorConDatos methodsFor: 'as yet unclassified'!
last
	
	^elementosAlmacenados last.! !

!ContenedorConDatos methodsFor: 'as yet unclassified'!
obtenerUltimoElemento

	^ self last.! !

!ContenedorConDatos methodsFor: 'as yet unclassified'!
removeLast
	
	elementosAlmacenados removeLast.! !

!ContenedorConDatos methodsFor: 'as yet unclassified'!
size
	
	^elementosAlmacenados size.! !

!ContenedorConDatos methodsFor: 'as yet unclassified'!
teQuiteUnElemento

	(self isEmpty) ifTrue: [^ContenedorVacio new].
	
	^self.! !

!ContenedorConDatos methodsFor: 'as yet unclassified'!
voyAAgregarUnElemento
	
	^self.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'ContenedorConDatos class' category: 'Stack-Exercise'!
ContenedorConDatos class
	instanceVariableNames: ''!

!ContenedorConDatos class methodsFor: 'as yet unclassified'!
puedeInstanciarseCon: unaColeccionOrdenada

	^unaColeccionOrdenada isEmpty not.

	! !


!classDefinition: #ContenedorVacio category: 'Stack-Exercise'!
Contenedor subclass: #ContenedorVacio
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!ContenedorVacio methodsFor: 'as yet unclassified'!
add: unElementoASerIngresado
	
	^self.! !

!ContenedorVacio methodsFor: 'as yet unclassified' stamp: 'VDM 10/14/2022 15:09:10'!
inicializarCon: unaColeccionOrdenada

	! !

!ContenedorVacio methodsFor: 'as yet unclassified'!
isEmpty
	
	^true.! !

!ContenedorVacio methodsFor: 'as yet unclassified'!
last

	^self obtenerUltimoElemento.

	
	
	! !

!ContenedorVacio methodsFor: 'as yet unclassified'!
obtenerUltimoElemento
	
	^ self error: OOStack stackEmptyErrorDescription.! !

!ContenedorVacio methodsFor: 'as yet unclassified'!
removeLast
	
	^ self error: Contenedor contenedorVacioErrorDescription.! !

!ContenedorVacio methodsFor: 'as yet unclassified'!
size
	
	^0.! !

!ContenedorVacio methodsFor: 'as yet unclassified'!
teQuiteUnElemento

	^self.! !

!ContenedorVacio methodsFor: 'as yet unclassified'!
voyAAgregarUnElemento
	
	^ContenedorConDatos new.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'ContenedorVacio class' category: 'Stack-Exercise'!
ContenedorVacio class
	instanceVariableNames: ''!

!ContenedorVacio class methodsFor: 'as yet unclassified'!
puedeInstanciarseCon: unaColeccionOrdenada

	^ unaColeccionOrdenada isEmpty.! !


!classDefinition: #OOStack category: 'Stack-Exercise'!
Object subclass: #OOStack
	instanceVariableNames: 'elementosAlmacenados'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStack methodsFor: 'inicializacion' stamp: 'VDM 10/14/2022 13:04:11'!
initialize
	
	elementosAlmacenados := OrderedCollection new.! !


!OOStack methodsFor: 'acceso'!
isEmpty
	
	^self stackEstaVacio.! !

!OOStack methodsFor: 'acceso'!
size
	
	^self cantidadDeElementosAlmacenados.! !

!OOStack methodsFor: 'acceso' stamp: 'VDM 10/14/2022 13:02:27'!
top
	
	"^elementosAlmacenados obtenerUltimoElemento."	
	| administradorDeStack |
	
	administradorDeStack := Contenedor con: elementosAlmacenados.
	^administradorDeStack obtenerUltimoElemento
	
	"|coleccionAuxiliar|
	
	coleccionAuxiliar := Contenedor con: elementosAlmacenados.
	^coleccionAuxiliar dameTuUltimoElemento."

	"self isEmpty ifTrue: [^ self error: OOStack stackEmptyErrorDescription.]
	ifFalse: [^ self obtenerUltimoElemento]."! !


!OOStack methodsFor: 'borrado'!
pop
	
	| ultimo |
	ultimo := self top.
	self removerElemento.
	^ultimo.! !


!OOStack methodsFor: 'agregado'!
push: unElementoASerAgregado 
	
	self agregarUnElemento: unElementoASerAgregado.! !


!OOStack methodsFor: 'acceso - privado'!
agregarUnElemento: unElementoASerAgregado 
	
	"elementosAlmacenados := elementosAlmacenados voyAAgregarUnElemento."
	elementosAlmacenados add: unElementoASerAgregado.! !

!OOStack methodsFor: 'acceso - privado'!
cantidadDeElementosAlmacenados
	
	^elementosAlmacenados size.! !

!OOStack methodsFor: 'acceso - privado'!
obtenerUltimoElemento

	^elementosAlmacenados last! !

!OOStack methodsFor: 'acceso - privado'!
removerElemento

	elementosAlmacenados removeLast.
	
	"elementosAlmacenados := elementosAlmacenados teQuiteUnElemento."! !

!OOStack methodsFor: 'acceso - privado'!
stackEstaVacio
	
	^elementosAlmacenados isEmpty.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStack class' category: 'Stack-Exercise'!
OOStack class
	instanceVariableNames: ''!

!OOStack class methodsFor: 'error descriptions'!
stackEmptyErrorDescription
	
	^ 'Stack is empty'! !


!classDefinition: #SentenceFinderByPrefix category: 'Stack-Exercise'!
Object subclass: #SentenceFinderByPrefix
	instanceVariableNames: 'stack'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefix methodsFor: 'as yet unclassified' stamp: 'VDM 10/14/2022 17:16:56'!
find: unPrefijo
	
	| resultado stackAuxiliar elemento |
	
	
	
	resultado := OrderedCollection new.
	stackAuxiliar := OOStack new.
	
	(unPrefijo isString) ifFalse: [^resultado].
	
	[stack isEmpty not] whileTrue: [
		elemento := stack pop.
		stackAuxiliar push: elemento.
		((elemento findString: unPrefijo startingAt: 0) = 1) ifTrue: [resultado add: elemento].
		].
	[stackAuxiliar isEmpty not] whileTrue: [
		elemento := stackAuxiliar pop.
		stack push: elemento.
		].
	
	^ resultado.! !

!SentenceFinderByPrefix methodsFor: 'as yet unclassified' stamp: 'VDM 10/14/2022 17:16:14'!
prefijoValido: unPrefijo

	^unPrefijo isString.! !

!SentenceFinderByPrefix methodsFor: 'as yet unclassified' stamp: 'VDM 10/14/2022 16:14:29'!
setearColaboradorInterno: unStack

	stack := unStack.! !
