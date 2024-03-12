/// <reference path="../pb_data/types.d.ts" />
migrate((db) => {
  const dao = new Dao(db)
  const collection = dao.findCollectionByNameOrId("42arwplac98ftts")

  collection.options = {
    "query": "SELECT id, background, title, buttonText FROM introduction"
  }

  // remove
  collection.schema.removeField("ulic2ppt")

  // add
  collection.schema.addField(new SchemaField({
    "system": false,
    "id": "zf9d3dtw",
    "name": "background",
    "type": "file",
    "required": false,
    "presentable": false,
    "unique": false,
    "options": {
      "mimeTypes": [],
      "thumbs": [],
      "maxSelect": 1,
      "maxSize": 5242880,
      "protected": false
    }
  }))

  // add
  collection.schema.addField(new SchemaField({
    "system": false,
    "id": "yzjbnraq",
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

  // add
  collection.schema.addField(new SchemaField({
    "system": false,
    "id": "cypanbgl",
    "name": "buttonText",
    "type": "text",
    "required": true,
    "presentable": false,
    "unique": false,
    "options": {
      "min": 4,
      "max": null,
      "pattern": ""
    }
  }))

  return dao.saveCollection(collection)
}, (db) => {
  const dao = new Dao(db)
  const collection = dao.findCollectionByNameOrId("42arwplac98ftts")

  collection.options = {
    "query": "SELECT id, title FROM introduction"
  }

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

  // remove
  collection.schema.removeField("zf9d3dtw")

  // remove
  collection.schema.removeField("yzjbnraq")

  // remove
  collection.schema.removeField("cypanbgl")

  return dao.saveCollection(collection)
})
