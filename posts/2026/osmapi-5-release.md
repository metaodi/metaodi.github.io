---
date: 2026-02-19
categories: [OpenStreetMap, Code, Open Source]
lang: de
title: "osmapi 5.0.0 Release"
image: osmapi_5.jpg
---

Ich freue mich sehr, Version 5.0.0 von [osmapi](https://github.com/metaodi/osmapi) offiziell freizugeben. Ein echter Major-Release und ein grosser Schritt in Richtung einer moderner und «pythonic» Library.

* Pythonic API: Alle bisherigen CamelCase-Methoden wurden durch snake_case ersetzt (z.B. osmapi.node_get) und Support für with-Statements (Context-Manager)
* Modernere Codebasis: Das einst grosse OsmApi-Modul wurde auf mehrere Module aufgeteilt für die bessere Wartbarkeit
* Type Hints & mypy: Neu gibt es Type Hints und mypy-Checks für besseren Editor-Support, stärkere Typ-Sicherheit und allgemein mehr Entwicklerfreundlichkeit.

Code mit der neuen Version von `osmapi` sieht z.B. so aus. Beachte z.B. `with api.changeset()` und `api.node_create` oder `api.way_create()`):

```python
from oauthcli import OpenStreetMapDevAuth
import osmapi
import os

# load secrets for OAuth
client_id = os.getenv("OSM_OAUTH_CLIENT_ID")
client_secret = os.getenv("OSM_OAUTH_CLIENT_SECRET")

auth = OpenStreetMapDevAuth(
    client_id, client_secret, ["write_api", "write_notes"]
).auth_code()


api = osmapi.OsmApi(api="https://api06.dev.openstreetmap.org", session=auth.session)
with api.changeset({"comment": "My first test"}) as changeset_id:
    print(f"Part of Changeset {changeset_id}")
    node1 = api.node_create({"lon": 1, "lat": 1, "tag": {}})
    print(node1)
    node2 = api.node_create({"lon": 2, "lat": 2, "tag": {}})
    print(node2)
    way = api.way_create(
        {
            "nd": [
                node1["id"],
                node2["id"],
            ],
            "tag": {
                "highway": "unclassified",
                "name": "Osmapi Street",
            },
        }
    )
    print(way)
```

👉 Zum vollständigen Changelog: [https://github.com/metaodi/osmapi/releases/tag/v5.0.0](https://github.com/metaodi/osmapi/releases/tag/v5.0.0)
