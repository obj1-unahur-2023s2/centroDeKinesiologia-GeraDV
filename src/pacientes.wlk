import aparatos.*

class Paciente{
	var edad
	var fortaleza
	var dolor	
	var rutina = null
	
	method edad() = edad
	method dolor() = dolor
	method fortaleza() = fortaleza
	
	method disminuirDolor(cantidad){
		dolor = 0.max(dolor-cantidad)
	}
	
	method puedeUsar(aparato){
		return aparato.sePuedeUsar(self)
	} 
	
	method usarAparato(aparato){
		if(self.puedeUsar(aparato)){
			aparato.usar(self)
		}
	}
	
	method aumentarFortalezaMuscular(cantidad){
		fortaleza += cantidad
	}
	
	method asignarRutina(unaRutina){
		rutina = unaRutina
	}
	
	method puedeHacerRutina(){
		return rutina.aparatos().all({aparato => self.puedeUsar(aparato)})
	}
	
	method realizarRutina(){
		if(self.puedeHacerRutina()){
			rutina.aparatos().forEach({aparato => self.usarAparato(aparato)})
		}
	}
}

class Resistente inherits Paciente{
	override method usarAparato(aparato){
		if(self.puedeUsar(aparato)){
			super(aparato)
			self.aumentarFortalezaMuscular(1)
		}
	}
}

class Caprichoso inherits Paciente{
	override method puedeHacerRutina(){
		return super() and rutina.aparatos().any({aparato => aparato.color()=="rojo"})
	}
	
	override method realizarRutina(){
		super()
		super()
	}
}

class RapidaRecuperacion inherits Paciente{
	override method realizarRutina(){
		super()
		self.disminuirDolor(recuperacion.valorRecuperacion())
	}
}

object recuperacion{
	var property valorRecuperacion = 3	
}