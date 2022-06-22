class Plato {
	var property peso = 0
	var property aptoVegetariano = true 
	var property valoracion = 0 
	var property esAbundante = peso>250
	
	
	
}

class Provoleta inherits Plato{
	var property tieneEspecias = true
	
	override method aptoVegetariano() = not tieneEspecias 
	
	method esEspecial() { 
		return esAbundante || tieneEspecias}
	
	override method valoracion() {
		 if (self.esEspecial()){
			 return 120
		}else {return 80}
	}
}

class HamburguesaCarne inherits Plato{
	var  tipoDePan 
	
	override method peso() {return 250}
	override method aptoVegetariano() = false
	method tienePan(unPan) { return tipoDePan == unPan} 
	override method valoracion() {
		return 60 + tipoDePan 
	}
	
}

object pan{
	
	method panIndustrial() = 0
	method panCasero() = 20
	method panMasaMadre()= 45
}

class HamburguesaVegetariana inherits HamburguesaCarne{
		var property estaHechaDe = "string"
		override method aptoVegetariano() = true
	
		override method valoracion(){
			return super() + self.plus()
		}
		method plus() {
			return  17.min(2 * self.estaHechaDe().size())
		}
}

class Parrillada inherits Plato{
	const cortes = []
	var property nombre = null
	var property calidad = 0 
	
	override method peso() = cortes.sum( { c=>c.peso() } )
	override method aptoVegetariano() = false
	override method valoracion() {
		return 15 * self.calidadMaximaDeCorte() - cortes.size() 
	}
	method calidadMaximaDeCorte() = cortes.max( { c=>c.calidad() } ).calidad() 
}








