# Website

## Build

First, pub packages need to be restored, then `dart2js` is used to generate the javascript part of the website  

```bash
> dart2js --out=docs/main.js website/web/main.dart
```