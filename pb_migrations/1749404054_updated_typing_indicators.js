/// <reference path="../pb_data/types.d.ts" />
migrate((app) => {
  const collection = app.findCollectionByNameOrId("pbc_755682315")

  // update collection data
  unmarshal({
    "createRule": ""
  }, collection)

  // update field
  collection.fields.addAt(3, new Field({
    "hidden": false,
    "id": "bool273319153",
    "name": "isTyping",
    "presentable": false,
    "required": false,
    "system": false,
    "type": "bool"
  }))

  return app.save(collection)
}, (app) => {
  const collection = app.findCollectionByNameOrId("pbc_755682315")

  // update collection data
  unmarshal({
    "createRule": "@request.auth.id != '' && @request.auth.user = @request.auth.id"
  }, collection)

  // update field
  collection.fields.addAt(3, new Field({
    "hidden": false,
    "id": "bool273319153",
    "name": "isTyping",
    "presentable": false,
    "required": true,
    "system": false,
    "type": "bool"
  }))

  return app.save(collection)
})
