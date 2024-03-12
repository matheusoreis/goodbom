/// <reference path="../pb_data/types.d.ts" />
migrate((db) => {
  const dao = new Dao(db)
  const collection = dao.findCollectionByNameOrId("42arwplac98ftts")

  collection.options = {
    "query": "SELECT id, title FROM introduction"
  }

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

  return dao.saveCollection(collection)
}, (db) => {
  const dao = new Dao(db)
  const collection = dao.findCollectionByNameOrId("42arwplac98ftts")

  collection.options = {
    "query": "SELECT id FROM introduction"
  }

  // remove
  collection.schema.removeField("fmqdvnzl")

  return dao.saveCollection(collection)
})
