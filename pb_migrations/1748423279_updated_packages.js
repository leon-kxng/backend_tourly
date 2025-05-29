/// <reference path="../pb_data/types.d.ts" />
migrate((app) => {
  const collection = app.findCollectionByNameOrId("pbc_3690698942")

  // add field
  collection.fields.addAt(7, new Field({
    "hidden": false,
    "id": "number1769007887",
    "max": null,
    "min": null,
    "name": "reviews",
    "onlyInt": false,
    "presentable": false,
    "required": false,
    "system": false,
    "type": "number"
  }))

  return app.save(collection)
}, (app) => {
  const collection = app.findCollectionByNameOrId("pbc_3690698942")

  // remove field
  collection.fields.removeById("number1769007887")

  return app.save(collection)
})
