workspace(name = "com_github_ebay_rules_ytt")

load(":deps.bzl", "ytt_rules_dependencies")

ytt_rules_dependencies()

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

load("@bazel_gazelle//:deps.bzl", "gazelle_dependencies")
gazelle_dependencies()

load(
    "@io_bazel_rules_docker//repositories:repositories.bzl",
    container_repositories = "repositories",
)

container_repositories()

load("@io_bazel_rules_docker//go:image.bzl", _go_image_repos = "repositories")

_go_image_repos()

