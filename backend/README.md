# food-blueprint API

Rest API for the Food Blueprint mobile app.

## API Key authorization

Using the API from outside requires sending an `API-Key` header with the same value as stored in `.env` variable `API_KEY`. This is to ensure none can access this API publicly and cause chaos. However it's meaningless if anyone gets their hands on the mobile application as the key has to be included in the source.
