"
Es la clase que representa el dominio completo, por lo cual solo podrá crearse una única instancia.
Todo lo que se le pide al sistema se le pide a una instancia de Biblioteca: es la fachada del sistema. Coordina toda la interacción y lleva el registro de préstamos

*nombre: el de la biblioteca
*catalogo: lista material catalogado (Hay un solo ejemplar de cada material)
*lectores: lista socios/lectores
*prestamos: lista historial de prestamos (activos y no activos).
"
Class {
	#name : 'Biblioteca',
	#superclass : 'Object',
	#instVars : [
		'nombre',
		'datePort',
		'catalogo',
		'lectores',
		'prestamos'
	],
	#category : 'TP1-Biblioteca',
	#package : 'TP1-Biblioteca'
}

{ #category : 'accessing' }
Biblioteca class >> nombre: unNombre [
"new biblioteca + nombre"
|unaBiblioteca|
unaBiblioteca := self new.
unaBiblioteca nombrar: unNombre.
^unaBiblioteca 
]

{ #category : 'updating' }
Biblioteca >> agregarLector: unLector [
	"recibe un lector y lo agrega a la lista de lectores y lo retorna. Si ya estaba en la lista retorna nil"
	
|lectorRetorno|

lectores ifNil: [ lectores:= OrderedCollection new. lectores add: unLector. lectorRetorno:=unLector ]
			ifNotNil: [ (lectores anySatisfy: [:cadaLector | cadaLector numero == unLector numero ])
												ifTrue: [ Transcript open; show:'este lector ya está ingresado en el sistema de la biblioteca: ';show:nombre;cr.]
												ifFalse:[ lectores add: unLector. lectorRetorno :=unLector]
															].
^lectorRetorno 													
										
]

{ #category : 'updating' }
Biblioteca >> catalogar: unMaterial [
"catalogar recibe un material(libro o revista) y lo coloca en el catálogo. Si es el primer material crea un catálogo primero"

"retorno devuelve nil si el material ya existía y unMaterial si se acaba de agregar"
|retorno|

		catalogo ifNil: [catalogo:= OrderedCollection new. catalogo add: unMaterial. retorno :=unMaterial].
		catalogo	ifNotNil: [
						(catalogo includes: unMaterial) ifFalse: [catalogo add: unMaterial.retorno :=unMaterial]
																  ifTrue: [Transcript open; show: 'el material ingresado ya estaba previamente en el catálogo.'] ].

^retorno
]

{ #category : 'accessing' }
Biblioteca >> catalogo [
	"getter catalogo"
^catalogo
]

{ #category : 'updating' }
Biblioteca >> devolver: unNumeroIdentificador [
	"devuelve una instancia de préstamo correspondiente al numero de id del material pero cerrada"

	| prestamoAcerrar fechaActual|
	
	"busca un préstamo relacionado al material identificado que no esté cerrado."
	prestamoAcerrar:= prestamos detect:[:cadaPrestamo | 
		cadaPrestamo identificador==unNumeroIdentificador and: cadaPrestamo devolucion isNil].
	
	fechaActual := Time now. "capaz haya que modificar esto con la librería que nos pidieron"
	prestamoAcerrar devolucion: fechaActual.
	
	^prestamoAcerrar 
	
	"esto supone que el préstamo existe. hay que preguntar si puede pasar que no exista"
]

{ #category : 'accessing' }
Biblioteca >> estaPrestado: unCodigo [
	"devuelve true si el material asociado al código está prestado actualmente y false si no lo está"

	| materialEstaPrestado prestamosAsociadosAcodigo |
	
	prestamosAsociadosAcodigo := prestamos select: [ :cadaPrestamo | cadaPrestamo  identificador == unCodigo ].
	materialEstaPrestado := prestamosAsociadosAcodigo anySatisfy: [ :cadaPrestamo | cadaPrestamo devolucion isNil ].
	
	^materialEstaPrestado 
]

{ #category : 'finding/searching' }
Biblioteca >> lectorNumero: unNumero [
	"busca y devuelve un lector asociado a el numero ingresado. Si no hay ninguno asociado a ese número se muestra un mensaje en pantalla y retorna nil"

	| lectorAsociado |
	
	lectorAsociado := (lectores detect:[:cadaLector | cadaLector numero == unNumero ]ifNone:[nil]).
	lectorAsociado ifNil: [Transcript open; show: 'No existe ningún lector asociado al número '; show: unNumero; cr] .
	
	^lectorAsociado 
]

{ #category : 'accessing' }
Biblioteca >> lectores [
	"getter lectores"
	
^lectores 
]

{ #category : 'finding/searching' }
Biblioteca >> materialNumero: unNumero [
	"busca y devuelve un material asociado a el numero ingresado. Si no hay ninguno asociado a ese número se muestra un mensaje en pantalla y retorna nil"

	| materialAsociado |
	
	materialAsociado := (catalogo detect:[:cadaMaterial | cadaMaterial identificador == unNumero ]ifNone:[nil]).
	materialAsociado ifNil: [Transcript open; show: 'No existe ningún material asociado al número '; show: unNumero; cr] .
	
	^materialAsociado 
]

{ #category : 'finding/searching' }
Biblioteca >> materialesDe: unAutor [
	"selecciona y devuelve del catálogo la lista de materiales que son del autor ingresado"

	| listaDelAutor |
	
listaDelAutor := catalogo select:[:cadaMaterial | cadaMaterial autores == unAutor ].

^listaDelAutor 

]

{ #category : 'accessing' }
Biblioteca >> nombrar: unNombre [
"setter nombre"
nombre:=unNombre.
]

{ #category : 'accessing' }
Biblioteca >> nombre [
"getter nombre"
^nombre
]

{ #category : 'accessing' }
Biblioteca >> prestamoVigenteDe: unNumeroSocio [
	"devuelve todas las instancias de prestamos vigentes del socio asociado al número"


	| prestamosAsociadosASocioVigentes |
	
	prestamosAsociadosASocioVigentes := prestamos select: [ :cadaPrestamo | 
				(cadaPrestamo lector) numero == unNumeroSocio and: ( cadaPrestamo devolucion isNil ) ].

^prestamosAsociadosASocioVigentes 
]

{ #category : 'accessing' }
Biblioteca >> prestamos [
	"getter prestamos"
	
^prestamos 
]

{ #category : 'updating' }
Biblioteca >> prestar: unCodigo a: unNumero [
	"crea un préstamo del material al lector, lo agrega al registro y lo retorna. Si el código o el socio no existen, si el lector es moroso, o si el material ya está prestado, retorna nil e informa por el Transcript la situación"
	
|lectorPrestamo materialPrestamo prestamoArealizar validezPrestamo|

	lectorPrestamo := lectores lectorNumero: unNumero .
	materialPrestamo := catalogo materialNumero: unCodigo.
	
	validezPrestamo := (((lectorPrestamo isNotNil or: (materialPrestamo isNotNil)) or: (lectorPrestamo moroso)) or: (prestamos estaPrestado: unCodigo)). 
	 
	validezPrestamo ifTrue: [ "crear préstamo con estos datos
										prestamoArealizar:= ...." ] 
						ifFalse:[Transcript show: 'No se pudo crear el préstamo.'; cr.].	
							
		^prestamoArealizar 
]
