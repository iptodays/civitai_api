[Civitai Api](https://github.com/civitai/civitai/wiki/REST-API-Reference)

``` dart
final CivitaApi api = CivitaApi('api_key');

api.getModelVersionById(128713).then((resp) {
    print(resp?.toJson());
});
```