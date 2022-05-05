const isImageURL = require('image-url-validator').default;
const GHIBLI_DATA = require("../data.json")

/* data.json key constants */
const FILM_IMAGE_KEY = "image"
const FILM_BANNER_KEY = "movie_banner"

const assertImageIsValid = (imageUrl, objectKey) => (
  test(`"${objectKey}" URL should not return a 404 error`, (done) => {
    isImageURL(imageUrl)
      .then((urlIsValid) => {
        expect(urlIsValid).toBeTruthy()
        done()
      })
      .catch((error) => done(error))
  })
)

describe("Validate all Film image URLs", () => {
  const { films } = GHIBLI_DATA

  films.forEach((filmData) => {
    const { title } = filmData

    describe(`Check ${title} links`, () => {
      if (filmData.hasOwnProperty(FILM_IMAGE_KEY)) {
        const imageUrl = filmData[FILM_IMAGE_KEY]
        assertImageIsValid(imageUrl, FILM_IMAGE_KEY)
      }

      if (filmData.hasOwnProperty(FILM_BANNER_KEY)) {
        const imageUrl = filmData[FILM_BANNER_KEY]
        assertImageIsValid(imageUrl, FILM_BANNER_KEY)
      }
    })
  })
})
