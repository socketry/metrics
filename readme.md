# Metrics

Capture metrics about code execution in a vendor agnostic way. As the author of many libraries which would benefit from metrics, there are few key priorities: (1) zero overhead if metrics are disabled, minimal overhead if enabled, and (2) a small and opinionated interface with standardised semantics.

[![Development Status](https://github.com/socketry/metrics/workflows/Test/badge.svg)](https://github.com/socketry/metrics/actions?workflow=Test)

## Features

  - Zero-overhead if tracing is disabled and minimal overhead if enabled.
  - Small opinionated interface with standardised semantics.

## Usage

Please see the [project documentation](https://socketry.github.io/metrics).

## Contributing

We welcome contributions to this project.

1.  Fork it.
2.  Create your feature branch (`git checkout -b my-new-feature`).
3.  Commit your changes (`git commit -am 'Add some feature'`).
4.  Push to the branch (`git push origin my-new-feature`).
5.  Create new Pull Request.

## See Also

  - [metrics-backend-datadog](https://github.com/socketry/metrics-backend-datadog) — A Metrics backend for Datadog.
  - [traces](https://github.com/socketry/traces) — A code tracing interface which follows a similar pattern.
