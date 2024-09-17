object pepita {
	var energia = 100
	
	method comer(comida) {
		energia = energia + comida.energiaQueAporta()
	}
	
	method volar(distancia) {
		self.validarVolar(distancia)
		energia = energia - 10 - distancia
	}

	method validarVolar(distancia) {
		if (energia < (10 + distancia)) {
			self.error("La energía de " + self + "no es suficiente para volar " + distancia + " de distancia")
		}
	}
		
	method energia() {
		return energia
	}
}

object alpiste {
	method energiaQueAporta() {
		return 20
	}
}

object manzana {
	var madurez = 1
	const base = 5
	
	method madurez() {
		return madurez
	}
	
	method madurez(_madurez) {
		madurez = _madurez
	}
	
	method madurar() {
		self.madurez(madurez + 1)
	}
	
	method energiaQueAporta() {
		return base * madurez
	}
	
}

object pepon {
	var energia = 30
	
	method energia() {
		return energia
	}
		
	method comer(comida) {
		energia += energia + comida.energiaQueAporta() / 2
	}
		
	method volar(distancia) {
		self.validarVolar(distancia)
		energia = energia - 20 - 2*distancia
	}
	
	method validarVolar(distancia) {
		if (energia < (20 + 2*distancia)) {
			self.error("La energía de " + self + "no es suficiente para volar " + distancia + " de distancia")
		}
	}
}

object roque {
	var ave = pepita
	var cenas = 0;
	
	method ave(_ave) {
		ave = _ave
		cenas = 0
	}
	
	method alimentar(alimento) {
		ave.comer(alimento)
		cenas = cenas + 1
	}
}

object milena {
	
	const aves = #{pepon, pepita}

	method movilizar(distancia) {
		self.validarMovilizar(distancia)
		aves.map({ave => ave.volar(distancia)})
	}

	method validarMovilizar(distancia) {
		if (pepon.energia() < (20 + 2*distancia) || pepita.energia() < (10 + distancia)) {
			self.error("La energía de las aves no es suficiente para que se movilizen a " + distancia + " de distancia")
		}
	}
}