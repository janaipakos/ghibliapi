# Contributing
- Clone the repo with `git clone https://github.com/janaipakos/ghibliapi.git`
- Watch fun Ghibli movies
- Make changes to `./data.json` or `public/swagger.yaml`
- Submit a pull request
- That's it

## Development Server
- Clone the repo with `git clone https://github.com/janaipakos/ghibliapi.git`
- `npm install`
- `npm start`
- Open `http://localhost:3000/`
- Refresh dev server on changes to `public/swagger.yaml` and restart after changes to `./data.json`

## What to contribute
Wrappers in different response languages are always welcome. Additionally, the two main files that need work are `./data.json`, which contains the array of resource end points, and `public/swagger.yaml`, which describes the json schema and documentation website layout. As you can see, there are a ton of missing resources. Below is a suggested workflow:

- `./data.json`: 
    - Pick a movie
    - Watch this movie while noting people, locations, species, and vehicles (or whatever end point)
    - Add these to `./data.json` while following the layout of other objects. Note that some other referenced resources may not exist, so beware of gaps. For example, if you see a movie featuring a character that does not yet exist in the .json, add that character to the people array
    - UUIDs can be generated easily in any programming language as well as linux with `uuidgen` (OSX has a `uuidgen` command, but it doesn't follow the spec), and sites like https://www.uuidgenerator.net

- `public/swagger.yaml`:
    - Feel free to clean up the schema if you notice any inconsistencies or if you know a more optimal swagger layout
    - Add more fields or end points if you can make a case for their inclusion. Potential ideas are `technologies` or `relationships`
