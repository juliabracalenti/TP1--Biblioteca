"
Es lo que la biblioteca contesta cuando alguien se identifica en el mostrador: un Data Transfer
Object (DTO). Contiene solo valores -números, strings, símbolos y booleanos-. No tiene ninguna
referencia a un Lector, a un Prestamo ni a un material, la arma la Biblioteca y no se modifica
una vez creada. Ningún atributo lleva método de escritura.

"
Class {
	#name : 'FichaDeLector',
	#superclass : 'Object',
	#instVars : [
		'numero',
		'cuit',
		'nombreCompleto',
		'esMoroso',
		'puedeLlevar',
		'motivoDeRechazo',
		'codigosEnPoder'
	],
	#category : 'TP1-Biblioteca',
	#package : 'TP1-Biblioteca'
}

{ #category : 'instance creation' }
FichaDeLector class >> deLector: unLector conPrestamosVigentes: unaColeccionDePrestamos [
	|instancia|
	instancia := self new.
	(unLector isKindOf: Lector)
		ifFalse: [ self error: 'El argumento debe ser de tipo Lector' ].
	instancia initializeFicha: unLector.
	instancia initializeFichaconPrestamos: unaColeccionDePrestamos .
	^instancia.
]

{ #category : 'accessing' }
FichaDeLector >> cantidadEnPoder [
	"comment stating purpose of instance-side method"
	^codigosEnPoder size 
]

{ #category : 'accessing' }
FichaDeLector >> codigosEnPoder [
"getter de codigosEnPoder"
^codigosEnPoder 

	
]

{ #category : 'accessing' }
FichaDeLector >> cuit [
	^cuit.
]

{ #category : 'accessing' }
FichaDeLector >> esMoroso [
	^esMoroso.
]

{ #category : 'private - factory' }
FichaDeLector >> initializeFicha: conLector [
	numero := conLector numero.
	cuit := conLector cuit.
	nombreCompleto := conLector nombreCompleto.
	esMoroso := conLector esMoroso.
	puedeLlevar := conLector puedeLlevar.
	motivoDeRechazo := conLector motivoDeRechazo.
]

{ #category : 'private - factory' }
FichaDeLector >> initializeFichaconPrestamos: prestamosVigentes [
	"comment stating purpose of instance-side method"
	codigosEnPoder := prestamosVigentes collect: [ :unPrestamo | unPrestamo material identificador ].
]

{ #category : 'accessing' }
FichaDeLector >> motivoDeRechazo [
	^motivoDeRechazo.
]

{ #category : 'accessing' }
FichaDeLector >> nombreCompleto [
	^nombreCompleto.
]

{ #category : 'accessing' }
FichaDeLector >> numero [
	^numero.
]

{ #category : 'accessing' }
FichaDeLector >> puedeLlevar [
	^puedeLlevar.
]
