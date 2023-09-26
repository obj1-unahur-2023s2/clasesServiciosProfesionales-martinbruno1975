import solicitantes.*
import profesionales.*
import universidad.*

class Empresa {
	const profesionales = #{}
	const clientes = #{}
	var property honorariosDeReferencia = 0
	
	method agregarCliente(unCliente) {
		clientes.add(unCliente)
	}
	method quitarCliente(unCliente) {
		clientes.remove(unCliente)
	}
	
	method cuantosEstudiaronEn(unaUniversidad) = profesionales.count({p=>p.universidad() == unaUniversidad})
	method profesionalesCaros() {
		return profesionales.filter({p=>p.honorariosPorHora() > honorariosDeReferencia})
	}
	method universidadesFormadoras() {
		return profesionales.map({p=>p.universidad()}).asSet()
	}
	method profesionalMasBarato() = profesionales.min({p=>p.honorariosPorHora()})
	method esDeGenteAcotada() {
		return not profesionales.any({p=>p.provinciasDondePuedeTrabajar().size() > 3})
	}
	method esDeGenteAcotadaAll() {
		return profesionales.all({p=>p.provinciasDondePuedeTrabajar().size() <= 3})
	}
	method puedeSatisfacer(unSolicitante) {
		return profesionales.any({p=>unSolicitante.puedeSerAtendidoPor(p)})
	}
	
	method profesionalesQuePuedenAtenderA(unSolicitante){
		return profesionales.filter({p=>unSolicitante.puedeSerAtendidoPor(p)})
	}
	
	method darServicio(unSolicitante) {
		if (not self.puedeSatisfacer(unSolicitante)){
			self.error("Ningun profesional no puede satisfacer al solicitante")	
		}
		
		const profesional = self.profesionalesQuePuedenAtenderA(unSolicitante).anyOne()
		profesional.cobrar(profesional.honorariosPorHora()) // devuele un objeto aleatorio de una coleccion
		self.agregarCliente(unSolicitante)
	}
	
	method cantidadClientes() = clientes.size()
	method tieneComoCliente(unSolicitante) = clientes.contains(unSolicitante)
	
}
