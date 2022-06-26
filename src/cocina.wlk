//REVISAR TODAS LAS MODIFICACIONES REALIADAS
import comidas.*
import comensales.*

object cocina{
	var property comidas = []
	
	method buenaOfertaVegetariana(){
		return (self.comidasCarnivoras() - self.comidasCarnivoras() )<=2.abs()
	}
	
	method comidasVegetarianas() {
		return comidas.filter({c=> c.aptoVegetariano()}).size()
	}
	
	method comidasCarnivoras() {
		return comidas.filter({c=> not c.aptoVegetariano()}).size()
	}
	
	method platoFuerteCarnivoro(){
		return comidas.filter({c=>not c.aptoVegetariano()}).max({c=>c.valoracion()})
		}
	method comidasQueLeGustan(comensal) = comidas.filter({c=> comensal.leAgrada(c)})
	
	method poderElegirPlato(comensal){
		if ( comidas.comidasQueLeGustan(comensal).isEmpty()) { 
			self.error("No hay comidas que le gusten")
		}else  comidas.anyOne({c=>comensal.comer(c)})
	}
	
}