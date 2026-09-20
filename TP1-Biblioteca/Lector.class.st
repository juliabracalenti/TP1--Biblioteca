"
Representa a una persona que particularmente es socio de la biblioteca

*numero: numero de socio (único para cada lector)
*moroso: booleano que representa si el lector está penalizado actualmente (de ser true no se puede llevar libros)
"
Class {
	#name : 'Lector',
	#superclass : 'Object',
	#instVars : [
		'numero',
		'cuit',
		'nombre',
		'apellido',
		'moroso'
	],
	#category : 'TP1-Biblioteca',
	#package : 'TP1-Biblioteca'
}

{ #category : 'instance creation' }
Lector class >> numero: unNumero cuit: unCuit nombre: unNombre apellido: unApellido [
	|instancia|
	instancia := self new.
	instancia
		numero: unNumero;
		cuit: unCuit;
		nombre: unNombre;
		apellido: unApellido;
		rehabilitar.
	^instancia.
]

{ #category : 'accessing' }
Lector >> apellido [
	"getter apellido"
	^apellido 
]

{ #category : 'accessing' }
Lector >> apellido: unApellido [
	unApellido isString
		ifFalse: [ self error: 'El apellido debe ser de tipo String' ].
	apellido := unApellido.
]

{ #category : 'comparing' }
Lector >> apellidoContiene: unTexto [
	unTexto isString
		ifFalse: [ self error: 'El argumento debe ser de tipo String' ].
	^apellido includesSubstring: unTexto.
]

{ #category : 'accessing' }
Lector >> cuit [
	"getter cuit"
	^cuit
]

{ #category : 'accessing' }
Lector >> cuit: unCuit [
	"setter cuit"
	unCuit isInteger
		ifFalse: [ self error: 'El cuit debe ser de tipo Integer' ].
	cuit := unCuit.
]

{ #category : 'accessing' }
Lector >> esMoroso [
	^moroso.
]

{ #category : 'updating' }
Lector >> marcarMoroso [
	moroso := true.
	^self yourself.
]

{ #category : 'accessing' }
Lector >> motivoDeRechazo [
	^moroso
		ifTrue: [ #enMora ]
		ifFalse: [ ].
]

{ #category : 'accessing' }
Lector >> nombre [
	"getter nombre"
	^nombre 
]

{ #category : 'accessing' }
Lector >> nombre: unNombre [
	"setter nombre"
	unNombre isString
		ifFalse: [ self error: 'El nombre debe ser de tipo String' ].
	nombre := unNombre.
]

{ #category : 'printing' }
Lector >> nombreCompleto [
	^nombre, ' ', apellido.
]

{ #category : 'accessing' }
Lector >> numero [
	"getter numero de socio"
	^numero 
	
]

{ #category : 'accessing' }
Lector >> numero: unNumeroDeSocio [
	"setter numero de socio"
	unNumeroDeSocio isInteger
		ifFalse: [ self error: 'El número de socio debe ser de tipo Integer' ].
	numero := unNumeroDeSocio.
]

{ #category : 'accessing' }
Lector >> puedeLlevar [
	^moroso ifTrue: [ false ] ifFalse: [ true ].
]

{ #category : 'updating' }
Lector >> rehabilitar [
	moroso := false.
	^self yourself.
]
