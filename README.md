Prueba para vacante de desarrollo ios

Se utilizo singleton como patron de diseño para tener una y solo una instancia de la clase servicios. 
Esta clase se ancarga de realizar el consumo de servicio, de mapear el json recibido en una estructura  y de los metodos para guardar y cargar los datos en los userdefaults
La clase mapView controller unicamente toma del singleton las coordenadas y dibuja el punto en el mapa
La clase view controller cuenta con unos labels donde se presenta la información obtenida del servicio y los botones "ver mapa" "historial" y "obtener información
La clase historyViewcontroller toma el arreglo donde se almacenan las peticiones hechas en la clase service y que guardado en user defaults del singleton y lo muestra en una tabla con la información obtenida
Al ser una practica pequeña utilizar MVC lo creo bastante conveniente y también utilizar user defaults como metodo para persistencia de datos ya que no se requeire mucha información y son datos concisos
