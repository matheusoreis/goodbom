/// <reference path="../pb_data/types.d.ts" />
migrate((db) => {
  const dao = new Dao(db)
  const collection = dao.findCollectionByNameOrId("42arwplac98ftts")

  collection.name = "introductionView"

  // remove
  collection.schema.removeField("fmqdvnzl")

  // add
  collection.schema.addField(new SchemaField({
    "system": false,
    "id": "ulic2ppt",
    "name": "title",
    "type": "text",
    "required": true,
    "presentable": false,
    "unique": false,
    "options": {
      "min": 6,
      "max": null,
      "pattern": ""
    }
  }))

  return dao.saveCollection(collection)
}, (db) => {
  const dao = new Dao(db)
  const collection = dao.findCollectionByNameOrId("42arwplac98ftts")

  collection.name = "teste"

  // add
  collection.schema.addField(new SchemaField({
    "system": false,
    "id": "fmqdvnzl",
    "name": "title",
    "type": "text",
    "required": true,
    "presentable": false,
    "unique": false,
    "options": {
      "min": 6,
      "max": null,
      "pattern": ""
    }
  }))

  // remove
  collection.schema.removeField("ulic2ppt")

  return dao.saveCollection(collection)
})
