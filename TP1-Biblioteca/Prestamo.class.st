"
Representa el prestamo de un libro a un lector.
Un préstamo nace abierto y se cierra cuando el material vuelve: ahí se le anota la fecha de
devolución. Esa fecha es lo único que cambia después de creado. Un préstamo cerrado no se vuelve a abrir ni se borra: queda en el registro, y por eso se puede saber después qué material se llevó cada socio a lo largo del tiempo

*material: el material por el cual se inició el préstamo.
*inicio: fecha en que se retira el material.
*vencimiento: fecha de vencimiento de un material.
devolucion: fecha en la que efectivamente se ha devuelto el libro
"
Class {
	#name : 'Prestamo',
	#superclass : 'Object',
	#instVars : [
		'material',
		'lector',
		'inicio',
		'vencimiento',
		'devolucion'
	],
	#category : 'TP1-Biblioteca',
	#package : 'TP1-Biblioteca'
}

{ #category : 'accessing' }
Prestamo >> devolucion [
	"getter de fecha de devolucion"
^devolucion 
]

{ #category : 'accessing' }
Prestamo >> devolucion: unaFecha [
	"setter de fecha de devolución"
devolucion:= unaFecha .
^self
]

{ #category : 'accessing' }
Prestamo >> inicio [

"getter inicio"
^inicio 
]

{ #category : 'initialization' }
Prestamo >> initialize [ 
	"agrega automáticamente la fecha de inicio cuando se crea una nueva instancia de préstamo con la fecha actual y la fecha de vencimiento según el tipo de material"

	| fechaActual fechaVencimiento |
	
fechaActual := Time now. "esto va a haber que modificarlo con la libreria del tp de tiempo"
fechaVencimiento := fechaActual + material plazoVencimiento.

inicio:= fechaActual.
vencimiento := fechaVencimiento .
^self

]

{ #category : 'accessing' }
Prestamo >> lector [
	"getter lector"
^lector
]

{ #category : 'accessing' }
Prestamo >> lector: unLector [
"setter lector"
lector:= unLector.
]

{ #category : 'accessing' }
Prestamo >> material [
	"getter material"
^material
]

{ #category : 'accessing' }
Prestamo >> material: unMaterial [
"setter material"
material:= unMaterial
]

{ #category : 'accessing' }
Prestamo >> vencimiento [

"getter vencimiento"
^vencimiento 
]
