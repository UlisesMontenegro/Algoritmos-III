1. ¿Qué crítica le harías al protocolo de #estaHerido y #noEstaHerido? (en vez de tener solo el mensaje #estaHerido y hacer “#estaHerido not” para saber la negación)

    Al devolver un booleano tenemos solo 2 posibles respuestas (true y false) por lo que con tener sólamente el mensaje #estaHerido se sobreentiende que si devuelve false es porque no lo está. Por mas de que no me parezca mal tener ambos mensajes ya que representan cosas distintas (de hecho, opuestas), al tener sólo 2 posibles respuestas me resulta redundante tener los 2 mensajes, por lo que considero que tener uno sólo sería una mejor práctica.

2. ¿Qué opinan de que para algunas funcionalidades tenemos 3 tests para el mismo comportamiento pero aplicando a cada uno de los combatientes (Arthas, Mankrik y Olgra)

    No estaría mal al objeto que responde el mensaje del test poder pasarle por parámetro los objetos a los cuales quiero testear su comportamiento y tener entonces 1 solo mensaje. De todas maneras voy a tener que enviar el mensaje 3 veces con parámetros distintos.
    Para correr los test, en mi opinión es mejor tener 3 tests para el mismo comportamiento pero aplicando a cada uno de los combatientes tal como esta hecho.

3. ¿Cómo modelaron el resultado de haber desarrollado un combate? ¿qué opciones consideraron y por qué se quedaron con la que entregaron y por qué descartaron a las otras?

    Para el modelado de los combates creé un objeto llamado "orquestadorDeCombates" que responde a mensajes como "desarrollarDuranteRondas", quienEsElGanadorEntre: y:", "estanTodosFueraDeCombate", "ningunBandoEstaFueraDeCombate". Y tiene como colaboradores internos bando1, bando2, y los 3 posibles resultados (ganoBando1, ganoBando2, indeterminado). Cada uno de los 3 posibles resultados toman como valor la cantidad de rondas que hicieron falta para obtener dicho resultado.

    El objeto "orquestadorDeCombates", al mandarle el "mensaje quienEsElGanadorEntre: y:", responde con uno de sus colaboradores internos ya sea "ganoBando1", "ganoBando2", o "indeterminado" y, como mencioné anteriormente, el valor que toma esta respuesta es la cantidad de rondas que se desarrollaron para llegar a dicho resultado. 