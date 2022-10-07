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


!classDefinition: #Stack category: 'StackPrimeraParte'!
Object subclass: #Stack
	instanceVariableNames: 'empty'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'StackPrimeraParte'!

!Stack methodsFor: 'SIN CATEGORIZAR' stamp: 'VDM 10/6/2022 21:30:11'!
initialize
	empty := true.
	! !

!Stack methodsFor: 'SIN CATEGORIZAR' stamp: 'VDM 10/6/2022 21:29:19'!
isEmpty
	^empty.! !

!Stack methodsFor: 'SIN CATEGORIZAR' stamp: 'VDM 10/6/2022 21:39:30'!
pop
	empty := true.! !

!Stack methodsFor: 'SIN CATEGORIZAR' stamp: 'VDM 10/6/2022 21:30:37'!
push: unElementoASerAgregado 
	
	empty := false.! !
