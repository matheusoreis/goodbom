/// <reference path="../pb_data/types.d.ts" />
migrate((db) => {
  const collection = new Collection({
    "id": "42arwplac98ftts",
    "created": "2024-02-10 20:52:41.121Z",
    "updated": "2024-02-10 20:52:41.121Z",
    "name": "teste",
    "type": "view",
    "system": false,
    "schema": [],
    "indexes": [],
    "listRule": null,
    "viewRule": null,
    "createRule": null,
    "updateRule": null,
    "deleteRule": null,
    "options": {
      "query": "SELECT id FROM introduction"
    }
  });

  return Dao(db).saveCollection(collection);
}, (db) => {
  const dao = new Dao(db);
  const collection = dao.findCollectionByNameOrId("42arwplac98ftts");

  return dao.deleteCollection(collection);
})
