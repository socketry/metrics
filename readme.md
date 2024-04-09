# Metrics

Capture metrics about code execution in a vendor agnostic way. As the author of many libraries which would benefit from metrics, there are few key priorities: (1) zero overhead if metrics are disabled, minimal overhead if enabled, and (2) a small and opinionated interface with standardised semantics.

[![Development Status](https://github.com/socketry/metrics/workflows/Test/badge.svg)](https://github.com/socketry/metrics/actions?workflow=Test)

## Features

  - Zero-overhead if tracing is disabled and minimal overhead if enabled.
  - Small opinionated interface with standardised semantics.

## Usage

Please see the [project documentation](https://socketry.github.io/metrics/) for more details.

  - [Getting Started](https://socketry.github.io/metrics/guides/getting-started/index) - This guide explains how to use `metrics` for capturing run-time metrics.

  - [Capture](https://socketry.github.io/metrics/guides/capture/index) - This guide explains how to use `metrics` for exporting metric definitions from your application.

  - [Testing](https://socketry.github.io/metrics/guides/testing/index) - This guide explains how to write assertions in your test suite to validate `metrics` are being emitted correctly.

## Contributing

We welcome contributions to this project.

1.  Fork it.
2.  Create your feature branch (`git checkout -b my-new-feature`).
3.  Commit your changes (`git commit -am 'Add some feature'`).
4.  Push to the branch (`git push origin my-new-feature`).
5.  Create new Pull Request.

### Developer Certificate of Origin

This project uses the [Developer Certificate of Origin](https://developercertificate.org/). All contributors to this project must agree to this document to have their contributions accepted.

### Contributor Covenant

This project is governed by the [Contributor Covenant](https://www.contributor-covenant.org/). All contributors and participants agree to abide by its terms.

## See Also

  - [metrics-backend-datadog](https://github.com/socketry/metrics-backend-datadog) — A Metrics backend for Datadog.
  - [traces](https://github.com/socketry/traces) — A code tracing interface which follows a similar pattern.
