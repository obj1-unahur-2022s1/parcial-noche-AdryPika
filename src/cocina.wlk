import comidas.*
import comensales.*

object cocina{
	var property comidas = []
	
	method buenaOfertaVegetariana(){
		return (comidas.aptoVegetariano() - not comidas.aptoVegetariano() )>2.abs()
	}
	
	method platoFuerteCarnivoro(){
		return comidas.filter({c=>not c.aptoVegetariano()}).valoracion().max()
		}
	method comidasQueLeGustan(comensal) = comidas.all({c=> comensal.leAgrada(c)})
	
	method poderElegirPlato(comensal){
		if ( comidas.comidasQueLeGustan(comensal).isEmpty()) { 
			self.error("No hay comidas que le gusten")
		}else  comidas.anyOne({c=>comensal.comer(c)})
	}
	
}