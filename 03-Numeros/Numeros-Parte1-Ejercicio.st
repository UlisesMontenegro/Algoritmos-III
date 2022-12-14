!classDefinition: #NumeroTest category: 'Numeros-Parte1-Ejercicio'!
TestCase subclass: #NumeroTest
	instanceVariableNames: 'zero one two four oneFifth oneHalf five twoFifth twoTwentyfifth fiveHalfs three eight negativeOne negativeTwo'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte1-Ejercicio'!

!NumeroTest methodsFor: 'tests' stamp: 'LL 9/13/2020 15:15:40'!
test01isZeroReturnsTrueWhenAskToZero

	self assert: zero isZero! !

!NumeroTest methodsFor: 'tests' stamp: 'LL 9/13/2020 15:15:53'!
test02isZeroReturnsFalseWhenAskToOthersButZero

	self deny: one isZero! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/8/2019 21:09:55'!
test03isOneReturnsTrueWhenAskToOne

	self assert: one isOne! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/8/2019 21:10:04'!
test04isOneReturnsFalseWhenAskToOtherThanOne

	self deny: zero isOne! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/1/2022 18:00:14'!
test05EnteroAddsWithEnteroCorrectly

	self assert: two equals: one + one! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/1/2022 18:00:32'!
test06EnteroMultipliesWithEnteroCorrectly

	self assert: four equals: two * two! !

!NumeroTest methodsFor: 'tests' stamp: 'VDM 9/29/2022 18:41:19'!
test07FraccionAddsWithFraccionCorrectly
"
    La suma de fracciones es:
	 
	a/b + c/d = (a.d + c.b) / (b.d)
	 
	SI ESTAN PENSANDO EN LA REDUCCION DE FRACCIONES NO SE PREOCUPEN!!
	TODAVIA NO SE ESTA TESTEANDO ESE CASO
"
	| sevenTenths |

	sevenTenths := Fraccion with: (Entero with: 7) over: (Entero with: 10).

	self assert: sevenTenths equals: oneFifth + oneHalf! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/1/2022 18:01:43'!
test08FraccionMultipliesWithFraccionCorrectly
"
    La multiplicacion de fracciones es:
	 
	(a/b) * (c/d) = (a.c) / (b.d)
"

	self assert: twoTwentyfifth equals: oneFifth * twoFifth! !

!NumeroTest methodsFor: 'tests' stamp: 'VDM 9/29/2022 18:42:05'!
test09AparentFraccionesAreEqual

	self assert: oneHalf equals: (Fraccion with: two over: four)! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/1/2022 18:03:28'!
test10AddingFraccionesCanReturnAnEntero

	self assert: one equals: oneHalf + oneHalf! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/1/2022 18:03:42'!
test11MultiplyingFraccionesCanReturnAnEntero

	self assert: one equals: (twoFifth) * (fiveHalfs) ! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/8/2019 21:13:21'!
test12AFraccionCanNotBeZero

	self deny: oneHalf isZero! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/8/2019 21:13:30'!
test13AFraccionCanNotBeOne

	self deny: oneHalf isOne! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/1/2022 18:04:04'!
test14NegationOfEnteroIsCorrect

	self assert: negativeTwo equals: two negated! !

!NumeroTest methodsFor: 'tests' stamp: 'VDM 9/29/2022 18:43:05'!
test15NegationOfFraccionIsCorrect

	self assert: (Fraccion with: negativeOne over: two) equals: oneHalf negated! !

!NumeroTest methodsFor: 'tests' stamp: 'VDM 9/29/2022 18:46:42'!
test16SignIsCorrectlyAssignedToFractionWithTwoNegatives

	self assert: oneHalf equals: (Fraccion with: negativeOne over: negativeTwo)! !

!NumeroTest methodsFor: 'tests' stamp: 'VDM 9/29/2022 18:47:29'!
test17SignIsCorrectlyAssignedToFractionWithNegativeDivisor

	self assert: oneHalf negated equals: (Fraccion with: one over: negativeTwo)! !


!NumeroTest methodsFor: 'setup' stamp: 'VDM 9/29/2022 17:40:08'!
setUp
	zero := Entero with: 0.
	one := Entero with: 1.
	two := Entero with: 2.
	three:= Entero with: 3.
	four := Entero with: 4.
	five := Entero with: 5.
	eight := Entero with: 8.
	negativeOne := Entero with: -1.
	negativeTwo := Entero with: -2.
	
	oneHalf := Fraccion with: one over: two.
	oneFifth := Fraccion with: one over: five.
	twoFifth := Fraccion with: two over: five.
	twoTwentyfifth := Fraccion with: two over: (Entero with: 25).
	fiveHalfs := Fraccion with: five over: two.
	
	
	"zero := Numero with: 0.
	one := Numero with: 1.
	two := Numero with: 2.
	three:= Numero with: 3.
	four := Numero with: 4.
	five := Numero with: 5.
	eight := Numero with: 8.
	negativeOne := Numero with: -1.
	negativeTwo := Numero with: -2.
	
	oneHalf := Numero with: one over: two.
	oneFifth := Numero with: one over: five.
	twoFifth := Numero with: two over: five.
	twoTwentyfifth := Numero with: two over: (Numero with: 25).
	fiveHalfs := Numero with: five over: two."
	! !


!classDefinition: #Numero category: 'Numeros-Parte1-Ejercicio'!
Object subclass: #Numero
	instanceVariableNames: 'type value numerator denominator'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte1-Ejercicio'!

!Numero methodsFor: 'arithmetic operations' stamp: 'VDM 9/29/2022 18:15:36'!
* aMultiplier 
	self subclassResponsibility.

	"(type = #Entero and: [aMultiplier type = #Entero]) ifTrue:	
		[ ^self class with: value * aMultiplier integerValue ]."
		
	"(type = #Fraccion and: [aMultiplier type = #Fraccion]) ifTrue:
		[ ^self class with: (numerator * aMultiplier numerator) over: (denominator * aMultiplier denominator) ].
		
	self error: 'Tipo de n?mero no soportado'
	"! !

!Numero methodsFor: 'arithmetic operations' stamp: 'VDM 9/29/2022 18:27:49'!
+ anAdder 
	self subclassResponsibility.
"
	
	(type = #Entero and: [anAdder type = #Entero]) ifTrue:
		[ ^self class with: value + anAdder integerValue ].
	
	(type = #Fraccion and: [anAdder type = #Fraccion]) ifTrue:
		[ | newNumerator newDenominator |
		
		newNumerator := (numerator * anAdder denominator) + (denominator * anAdder numerator).
		newDenominator := denominator * anAdder denominator.
		
		^ self class with: newNumerator over: newDenominator ].
	
	self error: 'Tipo de n?mero no soportado'
"	! !

!Numero methodsFor: 'arithmetic operations' stamp: 'VDM 9/29/2022 18:39:26'!
negated	
	self subclassResponsibility.
"
	
	type = #Entero ifTrue:
		[ ^self * (self class with: -1) ].
	type = #Fraccion ifTrue:
		[ ^self class with: numerator * (self class with: -1) over: denominator ].
		"! !


!Numero methodsFor: 'testing' stamp: 'VDM 9/29/2022 17:28:21'!
isNegative
	self subclassResponsibility.
	
"	
	type = #Entero ifTrue:
		[ ^value < 0 ].
	type = #Fraccion ifTrue:
		[ ^denominator < 0 ]."! !

!Numero methodsFor: 'testing' stamp: 'VDM 9/29/2022 17:52:17'!
isOne
		self subclassResponsibility.! !

!Numero methodsFor: 'testing' stamp: 'VDM 9/29/2022 17:52:23'!
isZero
		self subclassResponsibility.! !


!Numero methodsFor: 'initialization' stamp: 'VDM 9/29/2022 17:25:02'!
initializeWith: aValue
	
	type := #Entero.
	value := aValue! !

!Numero methodsFor: 'initialization' stamp: 'VDM 9/29/2022 17:24:37'!
initializeWith: aNumerator over: aDenominator

	"Estas precondiciones estan por si se comenten errores en la implementacion - Hernan"
	aNumerator isZero ifTrue: [ self error: 'una fraccion no puede ser cero' ].
	aDenominator isOne ifTrue: [ self error: 'una fraccion no puede tener denominador 1 porque sino es un entero' ].
	
	type:=#Fraccion.
	numerator := aNumerator.
	denominator := aDenominator ! !


!Numero methodsFor: 'accessing' stamp: 'NR 9/8/2019 20:59:46'!
denominator

	^denominator! !

!Numero methodsFor: 'accessing' stamp: 'NR 9/8/2019 20:33:53'!
integerValue

	"Usamos integerValue en vez de value para que no haya problemas con el mensaje value implementado en Object - Hernan"
	
	^value! !

!Numero methodsFor: 'accessing' stamp: 'NR 9/8/2019 20:59:52'!
numerator

	^numerator! !

!Numero methodsFor: 'accessing' stamp: 'NR 9/8/2019 21:55:04'!
type
	
	^type! !


!Numero methodsFor: 'printing' stamp: 'VDM 9/29/2022 17:25:02'!
printOn: aStream
	
	type = #Entero ifTrue:
		[ aStream print: value ].
	
	type = #Fraccion ifTrue:
		[ aStream 
			print: numerator;
			nextPut: $/;
			print: denominator ].! !


!Numero methodsFor: 'comparing' stamp: 'VDM 9/29/2022 17:25:02'!
= anObject

	^(anObject isKindOf: self class) and: [ type = anObject type and: 
		[ type = #Entero ifTrue: [ value = anObject integerValue] 
		ifFalse: [ type = #Fraccion ifTrue:
			[ (numerator * anObject denominator) = (denominator * anObject numerator) ]]]]! !

!Numero methodsFor: 'comparing' stamp: 'VDM 9/29/2022 17:25:02'!
hash
	type = #Entero ifTrue:
		[ ^value hash ].
	type = #Fraccion ifTrue:
		[ ^(numerator hash / denominator hash) hash ].! !


!Numero methodsFor: 'arithmetic operations - private' stamp: 'VDM 9/29/2022 17:25:02'!
// aDivisor 
	
	type = #Entero ifTrue:
		[ ^self class with: value // aDivisor integerValue ].
		
	self error: 'Tipo de n?mero no soportado'! !

!Numero methodsFor: 'arithmetic operations - private' stamp: 'VDM 9/29/2022 17:25:02'!
greatestCommonDivisorWith: anEntero 
	
	type = #Entero ifTrue:
		[^self class with: (value gcd: anEntero integerValue)].
		
	self error: 'Tipo de n?mero no soportado'! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Numero class' category: 'Numeros-Parte1-Ejercicio'!
Numero class
	instanceVariableNames: ''!

!Numero class methodsFor: 'error descriptions' stamp: 'HernanWilkinson 5/7/2016 22:45'!
canNotDivideByZeroErrorDescription

	^'No se puede dividir por cero'! !


!Numero class methodsFor: 'instance creation' stamp: 'NR 9/8/2019 20:46:40'!
with: aValue 
	
	"Esta verificacion esta puesta por si se equivocan y quieren crear un Entero pasando otra cosa que un Integer - Hernan"
	aValue isInteger ifFalse: [  self error: 'aValue debe ser anInteger' ].
	
	^self new initializeWith: aValue! !

!Numero class methodsFor: 'instance creation' stamp: 'NR 9/8/2019 23:20:40'!
with: aDividend over: aDivisor

	| greatestCommonDivisor numerator denominator |
	
	aDivisor isZero ifTrue: [ self error: self canNotDivideByZeroErrorDescription ].
	aDividend isZero ifTrue: [ ^aDividend ].
	
	aDivisor isNegative ifTrue: [ ^self with: aDividend negated over: aDivisor negated].
	
	greatestCommonDivisor := aDividend greatestCommonDivisorWith: aDivisor. 
	numerator := aDividend // greatestCommonDivisor.
	denominator := aDivisor // greatestCommonDivisor.
	
	denominator isOne ifTrue: [ ^numerator ].

	^self new initializeWith: numerator over: denominator! !


!classDefinition: #Entero category: 'Numeros-Parte1-Ejercicio'!
Numero subclass: #Entero
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte1-Ejercicio'!

!Entero methodsFor: 'as yet unclassified' stamp: 'VDM 9/29/2022 18:09:41'!
* aMultiplier 
	
	(aMultiplier class = Entero) ifTrue:[
		^ self class with: value * aMultiplier integerValue.
		].
	
	"(type = #Entero and: [aMultiplier type = #Entero]) ifTrue:	
	[ ^self class with: value * aMultiplier integerValue ]."
	
	self error: 'Tipo de n?mero no soportado'! !

!Entero methodsFor: 'as yet unclassified' stamp: 'VDM 9/29/2022 18:24:52'!
+ anAdder 
	
	(anAdder class = Entero) ifTrue:[
		^ self class with: value + anAdder integerValue. 
		].
	
	self error: 'Tipo de n?mero no soportado'
	! !

!Entero methodsFor: 'as yet unclassified' stamp: 'VDM 9/29/2022 17:52:33'!
isNegative	
	
	^ value < 0! !

!Entero methodsFor: 'as yet unclassified' stamp: 'VDM 9/29/2022 17:52:38'!
isOne
	
	^ value = 1.
! !

!Entero methodsFor: 'as yet unclassified' stamp: 'VDM 9/29/2022 17:52:50'!
isZero

	^ value = 0.
! !

!Entero methodsFor: 'as yet unclassified' stamp: 'VDM 9/29/2022 18:38:20'!
negated
	
	^self * (self class with: -1).! !


!classDefinition: #Fraccion category: 'Numeros-Parte1-Ejercicio'!
Numero subclass: #Fraccion
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte1-Ejercicio'!

!Fraccion methodsFor: 'as yet unclassified' stamp: 'VDM 9/29/2022 18:15:55'!
* aMultiplier 
	
	(aMultiplier class = Fraccion) ifTrue:[
		^self class with: (numerator * aMultiplier numerator) over: (denominator * aMultiplier denominator).
		].
	self error: 'Tipo de n?mero no soportado'! !

!Fraccion methodsFor: 'as yet unclassified' stamp: 'VDM 9/29/2022 18:27:22'!
+ anAdder 
	
	(anAdder class = Fraccion) ifTrue:
		[ | newNumerator newDenominator |
		
		newNumerator := (numerator * anAdder denominator) + (denominator * anAdder numerator).
		newDenominator := denominator * anAdder denominator.
		
		^ self class with: newNumerator over: newDenominator ].
	
	self error: 'Tipo de n?mero no soportado'
	! !

!Fraccion methodsFor: 'as yet unclassified' stamp: 'VDM 9/29/2022 17:53:02'!
isNegative
	
	^ denominator < 0.! !

!Fraccion methodsFor: 'as yet unclassified' stamp: 'VDM 9/29/2022 17:53:06'!
isOne
	
	^ false.! !

!Fraccion methodsFor: 'as yet unclassified' stamp: 'VDM 9/29/2022 17:53:11'!
isZero
	
	^ false.! !

!Fraccion methodsFor: 'as yet unclassified' stamp: 'VDM 9/29/2022 18:46:15'!
negated
	
	^ self class with: numerator * (Entero with: -1) over: denominator.! !
