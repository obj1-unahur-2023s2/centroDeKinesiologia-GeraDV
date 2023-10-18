import aparatos.*

object centro {
	const pacientes = []
	const aparatos = []
	
	method agregarPaciente(paciente){
		pacientes.add(paciente)
	}
	
	method agregarAparato(aparato){
		aparatos.add(aparato)
	}
	
	method coloresAparatos(){
		return aparatos.map({aparato => aparato.color()})
	}
	
	method coloresAparatosSinRepetir(){
		return self.coloresAparatos().asSet()
	}
	
	method pacientesMenores(){
		return pacientes.filter({paciente => paciente.edad() < 8})
	}
	
	method pacientesQueNoPuedenHacerSesion(){
		return pacientes.count({paciente => not paciente.puedeHacerRutina()})
	}
	
	method estaEnCondiciones(){
		return not aparatos.any({aparato => aparato.necesitaMantenimiento()})
	}
	
	method aparatosParaMantenimiento(){
		return aparatos.filter({aparato => aparato.necesitaMantenimiento()})
	}
	
	method estaComplicado(){
		return self.aparatosParaMantenimiento().size() >= aparatos.size()/2
	}
	
	method visitaTecnico(){
		self.aparatosParaMantenimiento().forEach({aparato => aparato.hacerMantenimiento()})
	}
}
