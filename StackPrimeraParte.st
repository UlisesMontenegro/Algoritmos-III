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

!StackTest methodsFor: 'as yet unclassified' stamp: 'VDM 10/6/2022 21:32:45'!
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

!StackTest methodsFor: 'as yet unclassified' stamp: 'VDM 10/7/2022 22:33:02'!
test06esPosibleObtenerElUltimoElementoSinRetirarloDelStack

	| stack primerElemento ultimoElemento segundoElemento elementoRetirado |
	
	stack := Stack new.
	
	primerElemento := 1.
	
	segundoElemento := 'Hola'.
	
	stack push: primerElemento.
	
	stack push: segundoElemento.
	
	ultimoElemento := stack top.
	
	elementoRetirado := stack pop.
	
	self assert: segundoElemento equals: ultimoElemento.
	self assert: segundoElemento equals: elementoRetirado.! !


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


!Stack methodsFor: 'accessing' stamp: 'VDM 10/7/2022 22:16:28'!
isEmpty
	
	^self stackEstaVacio.! !

!Stack methodsFor: 'accessing' stamp: 'VDM 10/7/2022 22:42:12'!
top
	
	self isEmpty ifTrue: [^nil.].
	^ self obtenerUltimoElemento.
	! !


!Stack methodsFor: 'removing' stamp: 'VDM 10/7/2022 22:43:57'!
pop
	
	| ultimo |
	ultimo := self top.
	ultimo isNil ifFalse: [self removerElemento].
	^ultimo.! !


!Stack methodsFor: '**PRIVADO' stamp: 'VDM 10/7/2022 22:16:10'!
agregarUnElemento: unElementoASerAgregado 
	
	elementosAlmacenados add: unElementoASerAgregado.! !

!Stack methodsFor: '**PRIVADO' stamp: 'VDM 10/7/2022 22:20:07'!
obtenerUltimoElemento

	^ elementosAlmacenados last! !

!Stack methodsFor: '**PRIVADO' stamp: 'VDM 10/7/2022 22:40:13'!
removerElemento

	elementosAlmacenados removeLast.! !

!Stack methodsFor: '**PRIVADO' stamp: 'VDM 10/7/2022 22:35:38'!
stackEstaVacio
	
	^elementosAlmacenados isEmpty.! !


!Stack methodsFor: 'adding' stamp: 'VDM 10/7/2022 20:57:53'!
push: unElementoASerAgregado 
	
	self agregarUnElemento: unElementoASerAgregado.! !
