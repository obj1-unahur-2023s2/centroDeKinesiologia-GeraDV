import pacientes.*


class Aparato{
	const color = "blanco"
	method color() = color 
	method sePuedeUsar(paciente) = true
	method usar(paciente)
	method necesitaMantenimiento()
	method hacerMantenimiento()
}

class Magneto inherits Aparato{
	var imantacion = 800
	
	override method usar(unPaciente){
		unPaciente.disminuirDolor(unPaciente.dolor() * 0.1)
		self.disminuirImantacion()
	}
	
	method disminuirImantacion(){
		imantacion = 0.max(imantacion - 1)
	}
	
	override method necesitaMantenimiento(){
		return imantacion < 100
	}
	
	override method hacerMantenimiento(){
		imantacion += 500
	}
}

class Bicicleta inherits Aparato{
	var aceitePerdida = 0
	var tornilloDesajustado = 0
	
	override method usar(unPaciente){
		if(unPaciente.dolor()>30){
			self.aflojarTornillos()
			if(unPaciente.edad().between(30,50)){
				self.perderAceite()
			}
		}
		
		unPaciente.disminuirDolor(4)
		unPaciente.aumentarFortalezaMuscular(3)
		
	}
	
	override method sePuedeUsar(unPaciente){
		return unPaciente.edad() > 8
	}
	
	method aflojarTornillos(){
		tornilloDesajustado += 1
	}
	
	method perderAceite(){
		aceitePerdida += 1
	}
	
	override method necesitaMantenimiento(){
		return tornilloDesajustado >= 10 or aceitePerdida >= 5
	}
	
	override method hacerMantenimiento(){
		aceitePerdida = 0
		tornilloDesajustado = 0
	}
}

class Minitramp inherits Aparato{
	
	override method usar(unPaciente){
		unPaciente.aumentarFortalezaMuscular(unPaciente.edad() * 0.1)
	}
	
	override method sePuedeUsar(unPaciente){
		return unPaciente.dolor() < 20
	}
	
	override method necesitaMantenimiento()=false
	
	override method hacerMantenimiento(){}
}