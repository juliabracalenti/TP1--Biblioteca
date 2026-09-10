"
Representa el prestamo de un libro a un lector.
Un préstamo nace abierto y se cierra cuando el material vuelve: ahí se le anota la fecha de
devolución. Esa fecha es lo único que cambia después de creado. Un préstamo cerrado no se vuelve a abrir ni se borra: queda en el registro, y por eso se puede saber después qué material se llevó cada socio a lo largo del tiempo

*material: el material por el cual se inició el préstamo.
*inicio: fecha en que se retira el material.
*vencimiento: indica si se ha vencido el tiempo para devolver el libro con un bool
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
