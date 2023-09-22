import solicitantes.*
import profesionales.*
import universidad.*

class Empresa {
	const profesionales = #{}
	const clientes = #{}
	var property honorariosDeReferencia = 0
	
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
	method darServicio(unSolicitante) {
		profesionales.anyOne // devuele un objeto aleatorio de una coleccion
	}
}
