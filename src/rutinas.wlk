import aparatos.*

class Rutina {
	const property aparatos = []
	
	method agregarARutina(aparato){
		aparatos.add(aparato)
	}
	
	method vaciarRutina(){
		aparatos.clear()
	}	
}
