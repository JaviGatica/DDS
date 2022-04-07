class Prenda {
	const tipo
	var estado
	const valorProducto
	
	method precio() = estado.modificarPrecio(valorProducto)
}

class Estado
{
	method modificarPrecio(precio)
}

class Nueva inherits Estado
{
	override method modificarPrecio(valorProducto) = valorProducto
}

class Promocion inherits Estado
{
	const descuento
	
	override method modificarPrecio(valorProducto) = valorProducto - descuento
}

class Liquidacion inherits Estado
{
	override method modificarPrecio(valorProducto) = valorProducto / 2
}

class Venta
{
	const prendas = []
	const property fecha
	const property cuotas
	const metodoPago
	
	method cantidadPrendas() = prendas.length()
	
	method precioVenta() = prendas.sum{ prenda => prenda.precio() } * ( 1 + metodoPago.adicional(self) )
}


//metodos de pago
object efectivo
{
	method adicional(venta) = 0
}

object tarjetaCredito
{
	var coeficiente
	
	method adicional(venta) = venta.cuotas() * coeficiente * 0.01 
}

object macowins
{
	var ventas = []
	
	method ventasHechas(dia) = ventas.filter{ venta => venta.fecha() == dia }
	
	method ganancia(dia) = self.ventasHechas(dia).sum{ venta => venta.precioVenta() }
}