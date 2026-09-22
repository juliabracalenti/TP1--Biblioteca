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
		'prestamos',
		'fichas'
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

			ifNotNil: [ ( lectores contains: unLector )
												ifTrue: [ Transcript open; show:'este lector ya está ingresado en el sistema de la biblioteca: '; show: nombre; cr.]
												ifFalse:[ lectores add: unLector. lectorRetorno :=unLector]
															].
^lectorRetorno 													
										
]

{ #category : 'accessing' }
Biblioteca >> buscarLectoresPorApellido: unTexto [
"busca y colecciona todas las fichas cuyos apellidos contengan unTexto (no necesariamente son iguales unTexto y el apellido, sino que apellido al menos contiene unTexto)"

| fichasCoincidentes lectorescoincidentes|

lectorescoincidentes := lectores select: [ :cadaLector | cadaLector apellidoContiene:unTexto ].

fichasCoincidentes := fichas select: [ :cadaFicha | lectorescoincidentes anySatisfy: [ :cadaLectorCoincidente | cadaLectorCoincidente numero = cadaFicha numero ] ].

^fichasCoincidentes 
]

{ #category : 'accessing' }
Biblioteca >> cantidadDePrestamosDe: unNumero [
	"devuelve la cantidad de préstamos totales (vigentes o no) de un socio asociado al número"

	| cantidadDePrestamos |
	
	cantidadDePrestamos := prestamos count: [ :cadaPrestamo | (cadaPrestamo lector) numero = unNumero ].
	
	^cantidadDePrestamos 
]

{ #category : 'updating' }
Biblioteca >> catalogar: unMaterial [
"catalogar recibe un material(libro o revista) y lo coloca en el catálogo. Si es el primer material crea un catálogo primero"

"retorno devuelve nil si el material ya existía y unMaterial si se acaba de agregar"
|retorno|

		catalogo ifNil: [catalogo:= OrderedCollection new. catalogo add: unMaterial. retorno :=unMaterial]
					ifNotNil: [
						(catalogo includes: unMaterial) ifFalse: [catalogo add: unMaterial.retorno :=unMaterial]
																  ifTrue: [Transcript open; show: 'el material ingresado ya estaba previamente en el catálogo.'] ].

^retorno
]

{ #category : 'getter' }
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
		cadaPrestamo identificador = unNumeroIdentificador and: cadaPrestamo estaVigente ]. 
	
	fechaActual := DatePort now. 
	prestamoAcerrar registrarDevolucion: fechaActual.
	
	^prestamoAcerrar 
	
	"esto supone que el préstamo existe. hay que preguntar si puede pasar que no exista"
]

{ #category : 'accessing' }
Biblioteca >> esMoroso: unNumero [
	"devuelve verdadero si el lector es moroso y falso si no lo es o no existe"

	| morosidad |
	
	( self lectorNumero: unNumero )
		ifNil:[ morosidad:= false ] 
		ifNotNil: [ morosidad := (self lectorNumero: unNumero) moroso ]. 

	^morosidad 	
]

{ #category : 'accessing' }
Biblioteca >> estaPrestado: unCodigo [
	"devuelve true si el material asociado al código está prestado actualmente y false si no lo está"

	| materialEstaPrestado |
	
	materialEstaPrestado := (self prestamosVigentes ) anySatisfy: [ :cadaPrestamoVigente | (cadaPrestamoVigente material) identificador = unCodigo ].
	
	^materialEstaPrestado 
]

{ #category : 'accessing' }
Biblioteca >> identificarCuit: unCuit [
"devuelve la ficha de cuit asociado a ese número o nil"
| fichaSolicitada |

fichaSolicitada := fichas detect: [ :cadaFicha | cadaFicha cuit = unCuit ] ifNone: [ Transcript open; show: 'no existe una ficha asociada a este cuit '; show: unCuit ;cr ].

^fichaSolicitada 

]

{ #category : 'accessing' }
Biblioteca >> identificarSocio: unNumero [
"devuelve la ficha de socio asociada a ese número o nil"
| fichaSolicitada |

fichaSolicitada := fichas detect: [ :cadaFicha | cadaFicha numero = unNumero ] ifNone: [ Transcript open; show: 'no existe una ficha asociada a este número: '; show: unNumero;cr ].

^fichaSolicitada 

]

{ #category : 'accessing' }
Biblioteca >> lectorNumero: unNumero [
	"busca y devuelve un lector asociado a el numero ingresado. Si no hay ninguno asociado a ese número se muestra un mensaje en pantalla y retorna nil"

	| lectorAsociado |
	
	lectorAsociado := (lectores detect:[:cadaLector | cadaLector numero = unNumero ]ifNone:[nil]).
	lectorAsociado ifNil: [Transcript open; show: 'No existe ningún lector asociado al número '; show: unNumero; cr] .
	
	^lectorAsociado 
]

{ #category : 'getter' }
Biblioteca >> lectores [
	"getter lectores"
	
^lectores 
]

{ #category : 'accessing' }
Biblioteca >> lectoresMorosos [
	" devuelve una lista de todos los lectores morosos "


	| listaLectoresMorosos |
	
	listaLectoresMorosos := lectores select: [ :cadaLector | cadaLector moroso ].
	
	^listaLectoresMorosos 
]

{ #category : 'accessing' }
Biblioteca >> materialNumero: unNumero [
	"busca y devuelve un material asociado a el numero ingresado. Si no hay ninguno asociado a ese número se muestra un mensaje en pantalla y retorna nil"

	| materialAsociado |
	
	materialAsociado := (catalogo detect:[:cadaMaterial | cadaMaterial identificador = unNumero ]ifNone:[nil]).
	materialAsociado ifNil: [Transcript open; show: 'No existe ningún material asociado al número '; show: unNumero; cr] .
	
	^materialAsociado 
]

{ #category : 'accessing' }
Biblioteca >> materialesDe: unAutor [
	"selecciona y devuelve del catálogo la lista de materiales que son del autor ingresado"

	| listaDelAutor |
	
listaDelAutor := catalogo select:[:cadaMaterial | cadaMaterial autores = unAutor ].

^listaDelAutor 

]

{ #category : 'setter' }
Biblioteca >> nombrar: unNombre [
"setter nombre"
nombre:=unNombre.
]

{ #category : 'getter' }
Biblioteca >> nombre [
"getter nombre"
^nombre
]

{ #category : 'accessing' }
Biblioteca >> prestamoVigenteDe: unCodigo [ 
	" devuelve el préstamo vigente asociado a un código (nil si no hay) "

	| prestamoVigenteAsociado |
	
	prestamoVigenteAsociado:= (self prestamosVigentes) detect: [ :cadaPrestamoVigente | cadaPrestamoVigente identificador = unCodigo ] ifNone: [ nil ].
	 
	^prestamoVigenteAsociado 
	
]

{ #category : 'getter' }
Biblioteca >> prestamos [
	"getter prestamos"
	
^prestamos 
]

{ #category : 'accessing' }
Biblioteca >> prestamosDe: unNumero [
	"devuelve una lista con todos los préstamos que están a nombre del socio asociado al número"

	| listaPrestamosAsociados |
	
	listaPrestamosAsociados:= prestamos select: [ :cadaPrestamo | (cadaPrestamo lector) numero = unNumero ].
	
	^listaPrestamosAsociados 
]

{ #category : 'accessing' }
Biblioteca >> prestamosDelMaterial: unCodigo [
	"devuelve una lista de todos los prestamos relacionados al código ingreasado"

	| listaPrestamosRelacionados |
	
	listaPrestamosRelacionados:= prestamos select: [ :cadaPrestamo | cadaPrestamo  identificador = unCodigo ].
	
	^listaPrestamosRelacionados 
]

{ #category : 'accessing' }
Biblioteca >> prestamosVencidos [
"devuelve una coleccion de todos los prestamos vigentes, es decir que todavía no devolvieron los materiales correspondientes, que están vencidos"
|listaPrestamosVencidos|

listaPrestamosVencidos := prestamos select: [ :cadaPrestamo | cadaPrestamo estaVencidoA: (DatePort now)].

^listaPrestamosVencidos 
]

{ #category : 'accessing' }
Biblioteca >> prestamosVigentes [
	" devuelve una lista de todos los préstamos vigentes (de materiales no devueltos) "

	| listaPrestamosVigentes |

	listaPrestamosVigentes := prestamos select: [ :cadaPrestamo | cadaPrestamo estaVigente ].
	
	^listaPrestamosVigentes 
]

{ #category : 'accessing' }
Biblioteca >> prestamosVigentesDe: unNumeroSocio [
	"devuelve todas las instancias de prestamos vigentes del socio asociado al número"


	| prestamosAsociadosASocioVigentes |
	
	prestamosAsociadosASocioVigentes := (self prestamosVigentes ) select:[ :cadaPrestamoVigente | (self prestamosDe: unNumeroSocio ) anySatisfy: [ :cadaPrestamoDelSocio | cadaPrestamoVigente = cadaPrestamoDelSocio ] ] .

^prestamosAsociadosASocioVigentes 
]

{ #category : 'updating' }
Biblioteca >> prestar: unCodigo a: unNumero [
	"crea un préstamo del material al lector, lo agrega al registro y lo retorna. Si el código o el socio no existen, si el lector es moroso, o si el material ya está prestado, retorna nil e informa por el Transcript la situación"
	
|lectorPrestamo materialPrestamo prestamoArealizar validezPrestamo|

	lectorPrestamo := lectores lectorNumero: unNumero .
	materialPrestamo := catalogo materialNumero: unCodigo.
	
	validezPrestamo := lectorPrestamo isNotNil or: (materialPrestamo isNotNil or: ((lectorPrestamo puedeLlevar)negated or: (prestamos estaPrestado: unCodigo))). 
	 
	validezPrestamo 
	  ifTrue: [ prestamoArealizar:= Prestamo material: materialPrestamo lector: lectorPrestamo instante: (DatePort now).
			 prestamos add: prestamoArealizar. ]
		
    	ifFalse:[Transcript show: 'No se pudo crear el préstamo.'; cr.].	
							
		^prestamoArealizar 
]

{ #category : 'updating' }
Biblioteca >> rehabilitar: unNumero [
	"levanta la marca de morosidad del lector. Si era moroso, ya no es más moroso y devuelve true. Si el lector no existe o no era moroso devuelve false y no modifica nada"
	
	|cambioEstado lector|
	
	lector:= self lectorNumero: unNumero.
	(lector isNotNil and: (lector moroso))
		ifTrue: [ lector moroso: false. cambioEstado:= true ]
		ifFalse: [ cambioEstado:= false ].
		
	
	^cambioEstado 	
]
