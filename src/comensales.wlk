import comidas.*

class Comensales {
	var property peso = 0
	var property comidas = []
	
	method leAgrada(unaComida)
	method comer(unaComida) = comidas.add(unaComida)
	method estaSatisfecho() {
		return  comidas.peso() >= peso * 0.01 
		and self.condicionAdicional()
	}
	method condicionAdicional()
	
}

class Vegetarianos inherits Comensales{
	
	override method leAgrada(unaComida) = unaComida.aptoVegetariano() 
	and unaComida.valoracion() > 85
	
	override method condicionAdicional() = comidas.all( { c=> not c.esAbundante() } )
	
}

class HambrePopular inherits Comensales{
	override method leAgrada(unaComida) = unaComida.esAbundante()
	override method condicionAdicional(){}
}

class PaladarFino inherits Comensales{
	
	override method leAgrada(unaComida){
		return unaComida.peso().between(150, 300)
		and unaComida.valoracion()>100		
		}
	override method condicionAdicional(){
		return comidas.size().even()
	}
	
}

