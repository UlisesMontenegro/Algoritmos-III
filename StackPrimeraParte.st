!classDefinition: #StackTest category: 'StackPrimeraParte'!
TestCase subclass: #StackTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'StackPrimeraParte'!

!StackTest methodsFor: 'as yet unclassified' stamp: 'IL 10/1/2022 19:24:17'!
test01StackShouldBeEmptyWhenCreated

	| stack |
	
	stack := Stack new.
	
	self assert: stack isEmpty! !

!StackTest methodsFor: 'as yet unclassified' stamp: 'UM 10/8/2022 18:38:03'!
test02SiAgregoUnElementoElStackNoEstaVacio

	| stack unElemento |
	
	stack := Stack new.
	
	unElemento := 1.
	
	stack push: unElemento.
	
	self deny: stack isEmpty.! !

!StackTest methodsFor: 'as yet unclassified' stamp: 'VDM 10/6/2022 21:39:45'!
test03SiAgregoUnElementoYLuegoLoRetiroElStackQuedaVacio

	| stack unElemento |
	
	stack := Stack new.
	
	unElemento := 1.
	
	stack push: unElemento.
	
	stack pop.
	
	self assert: stack isEmpty.! !

!StackTest methodsFor: 'as yet unclassified' stamp: 'VDM 10/7/2022 20:49:52'!
test04PopDevuelveElUltimoElementoAgregado

	| stack unElemento ultimoElemento|
	
	stack := Stack new.
	
	unElemento := 1.
	
	stack push: unElemento.
	
	ultimoElemento := stack pop.
	
	self assert: unElemento equals: ultimoElemento.! !

!StackTest methodsFor: 'as yet unclassified' stamp: 'VDM 10/7/2022 22:26:39'!
test05ultimoElementoAgregadoEsElPrimeroEnSerRetirado

	| stack primerElemento ultimoElemento segundoElemento |
	
	stack := Stack new.
	
	primerElemento := 1.
	
	segundoElemento := 'Hola'.
	
	stack push: primerElemento.
	
	stack push: segundoElemento.
	
	ultimoElemento := stack pop.
	
	self assert: segundoElemento equals: ultimoElemento.! !

!StackTest methodsFor: 'as yet unclassified' stamp: 'UM 10/8/2022 19:35:22'!
test06esPosibleObtenerElUltimoElementoSinRetirarloDelStack

	| stack primerElemento segundoElemento primerTop segundoTop |
	
	stack := Stack new.
	
	primerElemento := 1.
	
	segundoElemento := 'Hola'.
	
	stack push: primerElemento.
	
	stack push: segundoElemento.
	primerTop := stack top.
	segundoTop := stack top.
	

	"self assert: stack top doesNotChange: stack top."
	self assert: primerTop equals: segundoTop.
	! !

!StackTest methodsFor: 'as yet unclassified' stamp: 'UM 10/8/2022 18:52:42'!
test07intentarHacerPopEnStackVacioLanzaError

	| stack |
	
	stack := Stack new.
	
	self should: [stack pop] 
		raise: Error
		withExceptionDo:[:unError | self assert: Stack elStackEstaVacioErrorDescription equals: unError messageText].! !


!classDefinition: #Stack category: 'StackPrimeraParte'!
Object subclass: #Stack
	instanceVariableNames: 'elementosAlmacenados'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'StackPrimeraParte'!

!Stack methodsFor: 'inicializacion' stamp: 'VDM 10/7/2022 22:16:19'!
initialize
	
	elementosAlmacenados := OrderedCollection new.
	! !


!Stack methodsFor: 'acceso' stamp: 'VDM 10/7/2022 22:16:28'!
isEmpty
	
	^self stackEstaVacio.! !

!Stack methodsFor: 'acceso' stamp: 'VDM 10/8/2022 10:40:15'!
top
	
	self isEmpty ifTrue: [self error: Stack elStackEstaVacioErrorDescription.].
	^ self obtenerUltimoElemento.
	! !


!Stack methodsFor: 'borrado' stamp: 'VDM 10/8/2022 10:45:49'!
pop
	
	| ultimo |
	ultimo := self top.
	self removerElemento.
	^ultimo.! !


!Stack methodsFor: 'acceso - privado' stamp: 'VDM 10/7/2022 22:16:10'!
agregarUnElemento: unElementoASerAgregado 
	
	elementosAlmacenados add: unElementoASerAgregado.! !

!Stack methodsFor: 'acceso - privado' stamp: 'VDM 10/7/2022 22:20:07'!
obtenerUltimoElemento

	^ elementosAlmacenados last! !

!Stack methodsFor: 'acceso - privado' stamp: 'VDM 10/7/2022 22:40:13'!
removerElemento

	elementosAlmacenados removeLast.! !

!Stack methodsFor: 'acceso - privado' stamp: 'VDM 10/7/2022 22:35:38'!
stackEstaVacio
	
	^elementosAlmacenados isEmpty.! !


!Stack methodsFor: 'agregado' stamp: 'VDM 10/7/2022 20:57:53'!
push: unElementoASerAgregado 
	
	self agregarUnElemento: unElementoASerAgregado.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Stack class' category: 'StackPrimeraParte'!
Stack class
	instanceVariableNames: ''!

!Stack class methodsFor: 'error descriptions' stamp: 'VDM 10/8/2022 10:28:51'!
elStackEstaVacioErrorDescription
	^'No hay elementos en el stack.'! !
