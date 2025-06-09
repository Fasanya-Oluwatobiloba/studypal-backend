/// <reference path="../pb_data/types.d.ts" />
migrate((app) => {
  const collection = app.findCollectionByNameOrId("pbc_669929365")

  // update collection data
  unmarshal({
    "createRule": ""
  }, collection)

  return app.save(collection)
}, (app) => {
  const collection = app.findCollectionByNameOrId("pbc_669929365")

  // update collection data
  unmarshal({
    "createRule": "@request.auth.id = '' && @request.auth.user = @request.auth.id"
  }, collection)

  return app.save(collection)
})
