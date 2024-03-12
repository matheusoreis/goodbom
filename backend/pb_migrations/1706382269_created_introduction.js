/// <reference path="../pb_data/types.d.ts" />
migrate((db) => {
  const collection = new Collection({
    "id": "jfjpapwpfpozsbd",
    "created": "2024-01-27 19:04:29.951Z",
    "updated": "2024-01-27 19:04:29.951Z",
    "name": "introduction",
    "type": "base",
    "system": false,
    "schema": [
      {
        "system": false,
        "id": "io2kzdt6",
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
      },
      {
        "system": false,
        "id": "ctdsfbuc",
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
      },
      {
        "system": false,
        "id": "yb0qq5gz",
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
      }
    ],
    "indexes": [],
    "listRule": null,
    "viewRule": null,
    "createRule": null,
    "updateRule": null,
    "deleteRule": null,
    "options": {}
  });

  return Dao(db).saveCollection(collection);
}, (db) => {
  const dao = new Dao(db);
  const collection = dao.findCollectionByNameOrId("jfjpapwpfpozsbd");

  return dao.deleteCollection(collection);
})
