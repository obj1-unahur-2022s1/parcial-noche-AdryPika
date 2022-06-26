//REVISAR TODAS LAS MODIFICACIONES REALIADAS

class Plato {
	method peso()
	method aptoVegetariano() 
	method valoracion() 
	method esAbundante() = self.peso()>250
	
	
	
}

class Provoleta inherits Plato{
	var property tieneEspecias = true
	const property peso
	override method aptoVegetariano() = not tieneEspecias 
	
	method esEspecial() { 
		return self.esAbundante() || tieneEspecias}
	
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
	override method valoracion() {
		return 60 + tipoDePan.puntos() 
	}
	
}

object panIndustrial{
	method puntos() = 0
}

object panCasero {
	method puntos() = 20
}

object panMasaMadre {
	method puntos() = 45
}




class HamburguesaVegetariana inherits HamburguesaCarne{
		var property estaHechaDe 
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
	method agregarCorte(unCorte){cortes.add(unCorte)}
	override method peso() = cortes.sum( { c=>c.peso() } )
	override method aptoVegetariano() = false
	override method valoracion() {
		return 15 * self.calidadMaximaDeCorte() - cortes.size() 
	}
	method calidadMaximaDeCorte() = cortes.max( { c=>c.calidad() } ).calidad() 
}

class Corte {
	var property nombre
	var property calidad
	var property peso
}







