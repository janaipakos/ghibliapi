# Studio Ghibli API

The [Studio Ghibli API](https://ghibliapi.herokuapp.com) catalogs the people, places, and things found in the worlds of Ghibli. It was created to help users discover resources, consume them via HTTP requests, and interact with them in whatever way makes sense. Navigation can be found on the left sidebar, and the right sidebar shows examples of returned objects for successful calls.

## Endpoints

- Films
- People
- Locations
- Species
- Vehicles

## Getting Started
Requests can be made with curl or other helper libraries by following regular REST calls. Examples are provided for Ruby and Python with a use case in Haskell. For example, here is how to GET the resource for the film My Neighbor Tororo:

`curl https://ghibliapi.herokuapp.com/films/3`

Calling this resource will respond with the following object:

```json
{
"id": 3,
"title": "My Neighbor Totoro",
"description": "Two sisters move to the country with their father in order to be closer to their hospitalized mother, and discover the surrounding trees are inhabited by Totoros, magical spirits of the forest. When the youngest runs away from home, the older sister seeks help from the spirits to find her.",
"director": "Hayao Miyazaki",
"producer": "Hayao Miyazaki",
"release_date": "1988",
"rt_score": "93",
...
}
```

## Resources
This API was built using JSON Server, ReDoc, and looking through swapi.co
