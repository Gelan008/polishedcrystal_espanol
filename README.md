# Pokémon Polished Crystal Español

## Notas de Progreso de Traducción
<!-- Usa este espacio para añadir tus notas sobre el progreso de la traducción del hackrom -->
- [x] Textos de batallas (`data/text/battle.asm`)
- [x] Habilidades, ataques, tipos, fuentes, etc...
- [x] Objetos.
- [x] Menús de tiendas y PC
- [x] Textos de entrenadores de la Torre Batalla
- [x] Opciones de menú y menús principales

De momento no se ha lanzado ninguna release.

---
README traducido de Rangi42
---
Este es un juego de Pokémon personalizado basado en [el desensamblado de Pokémon Cristal](https://github.com/pret/pokecrystal).

Mi objetivo es crear lo que dice el título: una versión mejorada y pulida (polished) de Pokémon Cristal. Corrige errores, tiene en cuenta los cambios oficiales de los juegos desde 2001 y añade algunas ideas nuevas propias. Muchas características restauran lo que se eliminó de R/A/Am, o son originales de HG/SS.

He tenido planes vagos de hacer un juego de Pokémon durante años. Estoy muy impresionado por el esfuerzo que se ha dedicado a desensamblar Pokémon Cristal y hacer que el código esté tan bien organizado. Gracias a que es de código abierto (y a los romhackers que me inspiraron), finalmente estoy haciendo este juego realidad.

> Hay muchas formas de crear juegos, pero la forma en que trabajamos en Game Freak puede ser un poco diferente a la de otras empresas. Es decir, constantemente cambiamos y retocamos lo que se nos ha ocurrido. Para hacer un juego divertido aún más divertido y pulirlo, tomamos lo que hemos hecho y empezamos a pensar en ello desde cero. Y para hacer el juego lo más divertido de jugar hacemos un sinfín de cambios y retoques sin importar cuánto tiempo lleve. Puede que no sea la mejor manera, pero creo que estos retoques son importantes para hacer nuestros juegos divertidos y mejores.
>
> — Junichi Masuda, "[HIDDEN POWER of masuda No. 7](https://www.gamefreak.co.jp/blog/dir_english/?p=21)"

## Descargar y Jugar

La **versión oficial actual** es la **v3.2.3** (la versión "Polished Crystal"). Es completamente jugable de principio a fin e incluye revisiones importantes de la jugabilidad, mecánicas y calidad de vida. Pronto publicaremos un registro de cambios más detallado, pero a continuación puedes encontrar los aspectos más destacados.

- **[Descarga la v3.2.3 aquí](https://github.com/Rangi42/polishedcrystal/releases/tag/v3.2.3)**

La versión oficial anterior fue la [v3.1.1](https://github.com/Rangi42/polishedcrystal/releases/tag/v3.1.1) (1 de febrero de 2025).

*Si tienes alguna pregunta sobre cómo jugar o aplicar el parche, ¡[lee las Preguntas Frecuentes (FAQ)](FAQ.md)!*

## Novedades de la v3.2.3

A continuación se muestra un breve resumen de los cambios y adiciones importantes. Pronto se publicará un registro de cambios más detallado.

- **Configuración de Nueva Partida Personalizable:** Ahora puedes activar/desactivar las Naturalezas y Habilidades, elegir cómo funcionan los Puntos de Esfuerzo (EVs) (sin límite clásico, límite moderno de 510 o desactivados), y configurar varias opciones de juego antes de comenzar una nueva aventura.
- **Los DVs Ya No Determinan las Naturalezas/Variocolor/Sexo/Forma de Unown:** Los DVs siguen afectando la variación de color (tonos ligeramente diferentes para la misma especie), pero todo lo demás ahora se maneja por separado.
- **Motor de Batalla e Interfaz Revisados:**
  - Las Habilidades ahora son compatibles.
  - Los movimientos se han actualizado para comportarse de manera más similar a sus contrapartes modernas.
  - Mejoras menores en la interfaz (HUD) hacen que las batallas sean más ágiles.
- **Animaciones de Movimientos Renovadas:** Muchos movimientos tienen animaciones actualizadas.
- **Motor Optimizado y Mundo a 60fps:** El motor del juego ha sido fuertemente optimizado para un rendimiento más fluido, y el mundo exterior ahora funciona a 60 cuadros por segundo.
- **Rediseño del Sistema de Almacenamiento:** La interfaz de almacenamiento del PC es más parecida a la de los juegos de Pokémon modernos. Puedes cambiar de cajas, mover Pokémon y gestionar tu equipo con menos molestias al guardar.
- **Pokédex Inspirada en HGSS:** La nueva Pokédex incluye estadísticas base, grupos huevo y un mapa de encuentros más completo que muestra *todos* los métodos de obtención de Pokémon.
- **Clima Dinámico en el Mundo:** En lugar de solo oscurecer la pantalla, ahora verás lluvia, nieve o tormentas de arena reales en las áreas correspondientes.
- **Pantalla de Datos Renovada:** Reemplaza la pantalla de estadísticas original. Muestra naturaleza, habilidades, datos de vistos y capturados, y más.

## Características

Una lista completa de características se encuentra en [FEATURES.md](FEATURES.md). Algunos puntos destacados:

- **289 especies de Pokémon**, incluyendo algunas evoluciones nuevas, además de **56 formas estéticas** (ej. patrones de Magikarp, Pikachu Vuelo/Surf, patrones de Arbok, formas de Unown) y **46 variantes** (Alola, Galar, Hisui, etc.)—para un total de **391 Pokémon únicos**.
- **73 nuevos movimientos** (72 en versiones fieles), **75 MTs**, y **31 tutores de movimientos**.
- Mecánicas modernas, como el **tipo Hada**, la **división Físico/Especial**, **Naturalezas**, **Habilidades**, y más.
- **MTs infinitas** y características de calidad de vida como las **Deportivas** y el **Repelente** continuo.
- **Mapas Nuevos/Renovados**: Algunos de R/A/Am, algunos adaptados de HG/SS, además de ubicaciones originales.
- **Nuevos Personajes** incluyendo Lorelei y Agatha (R/A/Am), Lira y los Ejecutivos del Team Rocket (HG/SS), y otros.
- **Más Contenido Post-Juego**: Revanchas de Líderes de Gimnasio, un nuevo evento después de luchar contra Rojo, y más.
- **Curva de Nivel Mejorada** con desafíos que aumentan de forma constante.
- **Música y Gráficos** adaptados de generaciones más recientes.

## Discusión

Si tienes preguntas o comentarios, por favor revisa o publica en cualquiera de estos sitios. (¡Lee las [Preguntas Frecuentes](FAQ.md) primero si tienes preguntas generales!)

- [Discord](https://discord.gg/ZK5pqK8)
- [Skeetendo](https://hax.iimarckus.org/topic/6874/)
- [PokéCommunity](http://www.pokecommunity.com/showthread.php?t=373172)
- [Romhack.me](http://www.romhack.me/polishedcrystal/wall/)
- [/r/PokemonROMHacks](https://www.reddit.com/r/PokemonROMhacks/comments/51kbcn/pok%C3%A9mon_polished_crystal_200/)
- [Nuzlocke Forums](http://s7.zetaboards.com/Nuzlocke_Forum/topic/11003710/)
- [Pokémon Hackers Online](http://www.pokemonhackersonline.com/showthread.php?t=15811)

Recurso adicional:

- [PolishedDex](https://www.polisheddex.app/) — Un compañero en línea para Polished Crystal. PolishedDex proporciona una Pokédex con capacidad de búsqueda, lista de movimientos, lista de objetos, ubicaciones, habilidades, eventos especiales y un creador de equipos. También incluye unas FAQ y enlaces a las versiones oficiales de la ROM, lo que lo convierte en una referencia conveniente al jugar.

## Capturas de Pantalla

![title-screen](screenshots/title-screen.png)
![which-photo](screenshots/which-photo.png)
![running-shoes](screenshots/running-shoes.png)
![town-map](screenshots/town-map.png)
  
![lyra](screenshots/lyra.png)
![cherrygrove-city](screenshots/cherrygrove-city.png)
![pokemon-center](screenshots/pokemon-center.png)
![bag](screenshots/bag.png)
  
![oaks-aide](screenshots/oaks-aide.png)
![move-tutor](screenshots/move-tutor.png)
![moss-rock](screenshots/moss-rock.png)
![rich-boy](screenshots/rich-boy.png)
  
![tm43](screenshots/tm43.png)
![game-corner-prizes](screenshots/game-corner-prizes.png)
![goldenrod-move-tutor](screenshots/goldenrod-move-tutor.png)
![eviolite](screenshots/eviolite.png)
  
![wonder-trade](screenshots/wonder-trade.png)
![ecruteak-shrine](screenshots/ecruteak-shrine.png)
![cowgirl](screenshots/cowgirl.png)
![olivine-city](screenshots/olivine-city.png)
  
![remoraid](screenshots/remoraid.png)
![team-rocket](screenshots/team-rocket.png)
![steelix](screenshots/steelix.png)
![custom-map](screenshots/custom-map.png)
  
![ice-rock](screenshots/ice-rock.png)
![hex-maniac](screenshots/hex-maniac.png)
![route-45](screenshots/route-45.png)
![summary](screenshots/summary.png)

![leppa-berry](screenshots/leppa-berry.png)
![regional-forms](screenshots/regional-forms.png)
![move-reminder](screenshots/move-reminder.png)
![moves](screenshots/moves.png)
  
![sylveon-moonblast](screenshots/sylveon-moonblast.png)
![togetic-fairy-wind](screenshots/togetic-fairy-wind.png)
![aerodactyl-fossil](screenshots/aerodactyl-fossil.png)
![cerulean-city](screenshots/cerulean-city.png)
  
![celadon-city](screenshots/celadon-city.png)
![weather](screenshots/weather.png)
![viridian-forest](screenshots/viridian-forest.png)
![mismagius](screenshots/mismagius.png)
  
![fighting-dojo](screenshots/fighting-dojo.png)
![silph-co](screenshots/silph-co.png)
![stormy-beach](screenshots/stormy-beach.png)
![rock-tunnel](screenshots/rock-tunnel.png)
  
![safari-zone](screenshots/safari-zone.png)
![soul-house](screenshots/soul-house.png)
![cinnabar-island](screenshots/cinnabar-island.png)
![seafoam-islands](screenshots/seafoam-islands.png)
