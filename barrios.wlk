import elementos.*

class Barrio {
  const elementos = []

  method agregarElemento(elemento) {
    elementos.add(elemento)
  }
  method esBueno(unElemento) {
    return unElemento.esBuenoSi()
  } 
  method esCopado() = self.ElementosBuenos().size() > self.ElementosNoBuenos().size()

  method ElementosBuenos() = elementos.filter({e => self.esBueno(e)})
  method ElementosNoBuenos() =  elementos.filter({e => !self.esBueno(e)})
}