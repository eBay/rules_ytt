# Carvel ytt rules for Bazel

## Setup

Add to `WORKSPACE` file.
```starlark
load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

http_archive(
    name = "com_github_ebay_rules_ytt",
    sha256 = "0232522fd7a07d2eb0a47fe4ec3a6dc8bc8e0bcbaa8abd658c6be53a34f5bd76",
    strip_prefix = "rules_ytt-0.1.0",
    urls = [
        "https://github.com/eBay/rules_ytt/releases/download/v0.1.0/rules_ytt-0.1.0.zip",
    ],
)

load("@com_github_ebay_rules_ytt//:deps.bzl", "ytt_rules_dependencies")

ytt_rules_dependencies()
```

## Usage

Add to `BUILD` file:

```starlark
load("@com_github_ebay_rules_ytt//:def.bzl", "ytt")
load("@io_bazel_rules_docker//go:image.bzl", "go_image")

go_image(
    name = "image",
    srcs = ["main.go"],
    importpath = "...",
)

ytt(
    name = "manifests",
    srcs = [
        ":base.yaml",
        ":defaults.yaml",
        ":values.yaml",
    ],
    image = ":image.digest",
)
```

Which is equivalent to

```shell
ytt -f base.yaml -f defaults.yaml -f values.yaml --dangerous-allow-all-symlink-destinations
```

* `bazel build //:manifests` - generates yaml files and store it in cache.
* `bazel run //:manifests` - prints generated yaml files to stdout.
* `bazel run //:manifests | kubectl -n <namespace> -f -` - applies generated manifests to k8s cluster.

Image digest is available inside yaml templates as `data.values.image_digest`.

## Commands

[Here](./ytt.md)

## LICENSE

   Copyright 2023 eBay Inc. Developer: Evgeny Khabarov

   Licensed under the Apache License, Version 2.0 (the "License");
   you may not use this file except in compliance with the License.
   You may obtain a copy of the License at

       http://www.apache.org/licenses/LICENSE-2.0

   Unless required by applicable law or agreed to in writing, software
   distributed under the License is distributed on an "AS IS" BASIS,
   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
   See the License for the specific language governing permissions and
   limitations under the License.

   See [LICENSE](./LICENSE) for more details.
