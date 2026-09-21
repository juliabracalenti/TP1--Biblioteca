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
	"cdevuelve la cantidad de material que tiene el lector en posesión actualmente"
	^codigosEnPoder size 
]

{ #category : 'accessing' }
FichaDeLector >> codigosEnPoder [
"devuelve una lista de los códigos de los materiales que tiene actualmetne en su poder"
^codigosEnPoder 

	
]

{ #category : 'accessing' }
FichaDeLector >> cuit [
"getter cuit"
	^cuit.
]

{ #category : 'accessing' }
FichaDeLector >> esMoroso [
"getter es moroso"
	^esMoroso.
]

{ #category : 'private - factory' }
FichaDeLector >> initializeFicha: conLector [
"inicialización completa de una Ficha"
	numero := conLector numero.
	cuit := conLector cuit.
	nombreCompleto := conLector nombreCompleto.
	esMoroso := conLector esMoroso.
	puedeLlevar := conLector puedeLlevar.
	motivoDeRechazo := conLector motivoDeRechazo.
]

{ #category : 'private - factory' }
FichaDeLector >> initializeFichaconPrestamos: prestamosVigentes [
	"devuelve una ficha inicializada con un préstamo"
	codigosEnPoder := prestamosVigentes collect: [ :unPrestamo | unPrestamo material identificador ].
]

{ #category : 'accessing' }
FichaDeLector >> motivoDeRechazo [
"getter motivo de rechazo"
	^motivoDeRechazo.
]

{ #category : 'accessing' }
FichaDeLector >> nombreCompleto [
"getter nombre completo"
	^nombreCompleto.
]

{ #category : 'accessing' }
FichaDeLector >> numero [
"getter numero"
	^numero.
]

{ #category : 'accessing' }
FichaDeLector >> puedeLlevar [
"getter puedeLlevar"
	^puedeLlevar.
]
