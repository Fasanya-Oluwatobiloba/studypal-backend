/// <reference path="../pb_data/types.d.ts" />
migrate((app) => {
  const collection = app.findCollectionByNameOrId("pbc_755682315")

  // update collection data
  unmarshal({
    "createRule": "@request.auth.id != \"\" && @request.auth.id = @request.auth.user",
    "deleteRule": "@request.auth.id != \"\" && @request.auth.id = user",
    "updateRule": "@request.auth.id != \"\" && @request.auth.id = user"
  }, collection)

  return app.save(collection)
}, (app) => {
  const collection = app.findCollectionByNameOrId("pbc_755682315")

  // update collection data
  unmarshal({
    "createRule": "@request.auth.id != \"\"",
    "deleteRule": "user = @request.auth.id",
    "updateRule": "user = @request.auth.id"
  }, collection)

  return app.save(collection)
})
