import plagas.*

/*Hogar
De cada hogar se manejan dos parámetros: el nivel de mugre y el confort 
que ofrece. Estos valores, los dos numéricos varían de hogar en hogar.
Se considera que un hogar es bueno si su nivel de mugre es la mitad del
confort que ofrece, o menos.*/
class Hogar {
  var nivelMugre
  const comfort
  
  method esBuenoSi() = nivelMugre <= (comfort / 2)
  
  method efectoDeSerAtacadoPor(unaPlaga) {
    nivelMugre += unaPlaga.nivelDanio()
    unaPlaga.atacarElemento()
  }
} /*Huerta
De cada huerta se conoce la capacidad de producción medida en kilos 
por mes; a efectos de este modelo es un simple número.
Se considera que una huerta es buena si su capacidad de producción
supera un nivel que no es fijo, pero es el mismo para todas las huertas.*/

class Huerta {
  var cantidadProduccion
  
  method esBuenoSi() = cantidadProduccion > nivelMinimoProduccion.valor()
  
  
  method efectoDeSerAtacadoPor(unaPlaga) {
    if (unaPlaga.transmiteEnfermedades()) {
      cantidadProduccion = 0.ma(cantidadProduccion-(10 + unaPlaga.nivelDanio()*0.1))
    }
    else {
      cantidadProduccion = 0.max(cantidadProduccion - unaPlaga.nivelDanio()*0.1)
    }
    unaPlaga.atacarElemento()
  }
  /*
  method efectoDeSerAtacadoPor(unaPlaga) {
      cantidadProduccion = 0.max(cantidadProduccion - unaPlaga.nivelDanio()*0.1)
      cantidadProduccion = if(unaPlaga.transmiteEnfermedades()) 0.max(cantidadProduccion- 10 )
  }
  */
} 

object nivelMinimoProduccion {
  var property valor = 100 
}
/*Mascota
De cada mascota se conoce el nivel de salud, un número. Cuanto más alto 
es este número, se considera que la mascota es más saludable.
Se considera que una mascota es buena si su nivel de salud supera 
las 250 unidades.*/

class Mascota {
  var nivelSalud
  
  method esBuenoSi() = nivelSalud > 250
  method efectoDeSerAtacadoPor(unaPlaga) {
      if(unaPlaga.transmiteEnfermedades()) {
        nivelSalud = 0.max(nivelSalud - unaPlaga.nivelDanio())
      }
      unaPlaga.atacarElemento()
  }
}
