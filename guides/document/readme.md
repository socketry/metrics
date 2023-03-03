# Document

This guide explains how to use `metrics` for exporting metric definitions from your application.

## Extraction

If your application defines one or more metrics, you can export them using the `bake metrics:document` command. This command will generate a list of metrics which you can export.

```bash
$ bake metrics:document output --format json
[
  {
    "name": "my_metric",
    "type": "gauge",
    "description": "My metric",
    "unit": "seconds",
    "values": [

    ],
    "tags": [

    ],
    "sample_rates": [

    ]
  }
]
```

## Capture

If your application has a test suite which emits metrics, you can capture those as samples for the purpose of your documentation. This includes fields like tags.

```bash
$ bake metrics:document capture --environment test --format json
[
  {
    "name": "my_metric",
    "type": "gauge",
    "description": "My metric",
    "unit": "seconds",
    "values": [
      1
    ],
    "tags": [
      "environment:test"
    ],
    "sample_rates": [
      1.0
    ]
  }
]
```

This will assume you have a top level bake task `bake test` which runs your test suite.
