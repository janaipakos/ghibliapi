# Studio Ghibli API

 **December 1 2022 - Heroku is charging for apps now, so I'm archiving this. Feel free to fork and host another version**
 
The [Studio Ghibli API](https://ghibliapi.herokuapp.com) catalogs the people, places, and things found in the worlds of Ghibli. It was created to help users discover resources, consume them via HTTP requests, and interact with them in whatever way makes sense. Navigation can be found on the left sidebar, and the right sidebar shows examples of returned objects for successful calls.

## Endpoints

- Films
- People
- Locations
- Species
- Vehicles

## Getting Started
Requests can be made with curl or other helper libraries by following regular REST calls. Examples are provided for Ruby and Python with a use case in Haskell. For example, here is how to GET the resource for the film My Neighbor Tororo:

`curl https://ghibliapi.herokuapp.com/films/58611129-2dbc-4a81-a72f-77ddfc1b1b49`

Calling this resource will respond with the following object:

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

## Helper libraries
### Elixir
- [ghibli](https://github.com/sotojuan/ghibli) by [Juan Soto](https://github.com/sotojuan)

### Go
- [totoro](https://github.com/Rchristiani/totoro) by [Ryan Christiani](https://github.com/Rchristiani)

### GraphQL
- [ghibliQL](https://github.com/kisscool-fr/ghibliql) by [Sebastien](https://github.com/kisscool-fr)

### R
- [ghibliapi](https://github.com/onertipaday/ghibliapi) by [Paolo](https://github.com/onertipaday)

### Python2 and Python3
- [python_studio_ghibli_api_sdk](https://github.com/Incognito/python_studio_ghibli_api_sdk) by [Incognito](https://github.com/Incognito)


## Examples
### Swift (iOS)
- https://github.com/kxvn-lx/Ghibliii

### Android
- https://github.com/txemasv/ghibli-films

### Haskell
- https://github.com/janaipakos/ghibliapi-example

### Datascript and Clojure
- https://cjohansen.no/a-unified-specification/

### JavaScript
- https://github.com/mazipan/ghibli-fans
- https://github.com/taniarascia/sandbox/tree/master/ghibli

## Resources
This API was built using [JSON Server](https://github.com/typicode/json-server), [ReDoc](https://github.com/Rebilly/ReDoc), and looking through [swapi.co](https://github.com/phalt/swapi)
