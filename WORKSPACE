workspace(name = "com_github_ebay_rules_ytt")

load(":deps.bzl", "ytt_rules_dependencies", "ytt_register_toolchains")

ytt_rules_dependencies()

ytt_register_toolchains()

load("@io_bazel_rules_go//go:deps.bzl",
  "go_register_toolchains",
  "go_rules_dependencies",
)

go_rules_dependencies()

go_register_toolchains(version = "1.20.3")

load("@io_bazel_stardoc//:setup.bzl", "stardoc_repositories")

stardoc_repositories()

load("@bazel_skylib//:workspace.bzl", "bazel_skylib_workspace")

bazel_skylib_workspace()

load("@rules_oci//oci:dependencies.bzl", "rules_oci_dependencies")

rules_oci_dependencies()

load("@rules_oci//oci:repositories.bzl",
  "LATEST_CRANE_VERSION",
  "oci_register_toolchains",
)

oci_register_toolchains(name = "oci", crane_version = LATEST_CRANE_VERSION)

load("@rules_oci//oci:pull.bzl", "oci_pull")

oci_pull(
    name = "distroless_base",
    digest = "sha256:ccaef5ee2f1850270d453fdf700a5392534f8d1a8ca2acda391fbb6a06b81c86",  #multi-arch
    image = "gcr.io/distroless/base",
    platforms = [
        "linux/amd64",
        "linux/arm64",
    ],
)

load("@aspect_bazel_lib//lib:repositories.bzl",
  "aspect_bazel_lib_dependencies",
  "aspect_bazel_lib_register_toolchains",
)

aspect_bazel_lib_dependencies()

aspect_bazel_lib_register_toolchains()

