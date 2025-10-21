class Plaga{
    var poblacion
    method transmiteEnfermedades()= poblacion >= 10  
    method atacarElemento() {
        poblacion = poblacion + (poblacion * 0.1)
    } 
}

class PlagaDeCucaracha inherits Plaga{
    var pesoPromedio
    method nivelDeDanio() = poblacion / 2
    override method transmiteEnfermedades() = super() and pesoPromedio >= 10
    override method atacarElemento() { 
        super()
        pesoPromedio+= 2
    }
}

class PlagaDePulgas inherits Plaga{
    method nivelDeDanio() = poblacion * 2
}

class PlagaDeGarrapatas inherits PlagaDePulgas{
    override method atacarElemento() {
        poblacion = poblacion + (poblacion * 0.2)
    }
}

class PlagaDeMosquito inherits Plaga{
    method nivelDeDanio() = poblacion
    override method transmiteEnfermedades() = super() and (poblacion % 3 == 0) 
}