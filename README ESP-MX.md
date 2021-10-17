# Studio Ghibli API

La [Studio Ghibli API](https://ghibliapi.herokuapp.com) cataloga las personas, lugares y cosas que se encuentran en los mundos de Ghibli. Fue creado para ayudar a los usuarios a descubrir recursos, consumirlos a través de solicitudes HTTP e interactuar con ellos de cualquier manera que tenga sentido. La navegación se puede encontrar en la barra lateral izquierda y la barra lateral derecha muestra ejemplos de objetos devueltos para llamadas exitosas.

## Endpoints

- Films
- People
- Locations
- Species
- Vehicles

## Comienzo
Las solicitudes se pueden realizar con curl u otras bibliotecas auxiliares siguiendo las llamadas REST regulares. Se proporcionan ejemplos para Ruby y Python con un caso de uso en Haskell. Por ejemplo, aquí se muestra cómo OBTENER el recurso para la película My Neighbor Tororo:

`curl https://ghibliapi.herokuapp.com/films/58611129-2dbc-4a81-a72f-77ddfc1b1b49`

Al llamar a este recurso responderá con el siguiente objeto:

```json
{
  "id": "58611129-2dbc-4a81-a72f-77ddfc1b1b49",
  "title": "My Neighbor Totoro",
  "description": "Two sisters move to the country with their father in order to be closer to their hospitalized mother, and discover the surrounding trees are inhabited by Totoros, magical spirits of the forest. When the youngest runs away from home, the older sister seeks help from the spirits to find her.",
  "director": "Hayao Miyazaki",
  "producer": "Hayao Miyazaki",
  "release_date": "1988",
  "rt_score": "93",
  ...
}
```

## Bibliotecas auxiliares
### Elixir
- [ghibli](https://github.com/sotojuan/ghibli) por [Juan Soto](https://github.com/sotojuan)

### Go
- [totoro](https://github.com/Rchristiani/totoro) por [Ryan Christiani](https://github.com/Rchristiani)

### GraphQL
- [ghibliQL](https://github.com/kisscool-fr/ghibliql) por [Sebastien](https://github.com/kisscool-fr)

### R
- [ghibliapi](https://github.com/onertipaday/ghibliapi) por [Paolo](https://github.com/onertipaday)

### Python2 and Python3
- [python_studio_ghibli_api_sdk](https://github.com/Incognito/python_studio_ghibli_api_sdk) por [Incognito](https://github.com/Incognito)


## Ejemplos
### Swift (iOS)
- https://github.com/kxvn-lx/Ghibliii

### Android
- https://github.com/txemasv/ghibli-films

### Haskell
- https://github.com/janaipakos/ghibliapi-example

### Datascript y Clojure
- https://cjohansen.no/a-unified-specification/

### JavaScript
- https://github.com/mazipan/ghibli-fans
- https://github.com/taniarascia/sandbox/tree/master/ghibli

## Recursos
Esta API fue construida usando [JSON Server](https://github.com/typicode/json-server), [ReDoc](https://github.com/Rebilly/ReDoc), y mostrada a través de [swapi.co](https://github.com/phalt/swapi)
