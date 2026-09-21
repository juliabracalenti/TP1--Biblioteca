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

{ #category : 'instance creation' }
Prestamo class >> material: unMaterial lector: unLector instante: unInstante [
	"Crea el préstamo abierto y le calcula el vencimiento. Retorna: instancia de Prestamo"
	| nuevoPrestamo |
	nuevoPrestamo := self new.
	nuevoPrestamo material: unMaterial .
	nuevoPrestamo lector: unLector .
	nuevoPrestamo inicioYvencimiento: unInstante .
	
^nuevoPrestamo 
]

{ #category : 'accessing' }
Prestamo >> descripcion [
	"Una linea legible del prestamo"
	^ 'Se presto ' , material titulo , ' al lector ' , lector nombreCompleto , ' desde ' , inicio , ' hasta ', 'vencimiento'
]

{ #category : 'getter' }
Prestamo >> devolucion [
	"getter de fecha de devolucion"
^devolucion 
]

{ #category : 'updating' }
Prestamo >> devolucion: unaFecha [
	"setter de fecha de devolución"
devolucion:= unaFecha .
^self
]

{ #category : 'accessing' }
Prestamo >> dias [
	"Cuantos dias duro, o nil si todavia no volvio."
	^
	(self estaVigente)
	ifTrue: [ nil ] ifFalse: [ (devolucion - inicio )days ]
	
]

{ #category : 'support' }
Prestamo >> diasTranscurridosHasta: unInstante [
	"Dias entre el inicio del prestamo y un instante"
	^(unInstante - inicio)days
]

{ #category : 'accessing' }
Prestamo >> estaCerrado [
	"Retorna 'true' si el prestamo esta cerrado. De lo contrario retorna 'false'."
	^ devolucion isNotNil 
]

{ #category : 'accessing' }
Prestamo >> estaVencidoA: unInstante [
	"Verdadero si sigue abierto y ese instante es posterior a su vencimiento."
	^ self estaVigente and: [unInstante > vencimiento ]
]

{ #category : 'accessing' }
Prestamo >> estaVigente [
	"Retorna 'true' si el prestamo sigue abierto (es decir, si su devolucion es nil). De lo contrario retorna 'false'."
	^ devolucion isNil 
]

{ #category : 'accessing' }
Prestamo >> excedioPlazo [
	"Verdadero si ya volvió y volvió después del vencimiento."
	^ self estaCerrado and:[devolucion > vencimiento]
]

{ #category : 'getter' }
Prestamo >> inicio [

"getter inicio"
^inicio 
]

{ #category : 'setter' }
Prestamo >> inicioYvencimiento: unInstante [
	"setter de inicio y vencimiento"
	inicio := unInstante .
	vencimiento := unInstante + material plazoVencimiento
	
]

{ #category : 'getter' }
Prestamo >> lector [
	"getter lector"
^lector
]

{ #category : 'setter' }
Prestamo >> lector: unLector [
"setter lector"
lector:= unLector.
]

{ #category : 'getter' }
Prestamo >> material [
	"getter material"
^material
]

{ #category : 'setter' }
Prestamo >> material: unMaterial [
"setter material"
material:= unMaterial
]

{ #category : 'accessing' }
Prestamo >> plazoEnDias [
	"Los días que se le dieron, congelados al prestar. Retorna: Integer"
	^(vencimiento - inicio )days
]

{ #category : 'updating' }
Prestamo >> registrarDevolucion: unInstante [
	"Le anota la fecha de devolución y lo deja cerrado. Es su único cambio de estado. Si ya estaba cerrado informa por el Transcript y no lo cambia. Retorna el receptor."
	(self estaVigente)
	ifTrue: [ devolucion := unInstante ] ifFalse: [ Transcript show: 'El prestamo se encuentra cerrado.'; cr. ].
	^self
]

{ #category : 'getter' }
Prestamo >> vencimiento [

"getter vencimiento"
^vencimiento 
]
