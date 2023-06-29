load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

def ytt_rules_dependencies(workspace_name = "com_github_ebay_rules_ytt"):
  if "io_bazel_rules_go" not in native.existing_rules().keys():
    http_archive(
        name = "io_bazel_rules_go",
        sha256 = "dd926a88a564a9246713a9c00b35315f54cbd46b31a26d5d8fb264c07045f05d",
        urls = [
            "https://mirror.bazel.build/github.com/bazelbuild/rules_go/releases/download/v0.38.1/rules_go-v0.38.1.zip",
            "https://github.com/bazelbuild/rules_go/releases/download/v0.38.1/rules_go-v0.38.1.zip",
        ],
    )

  if "com_github_vmware_tanzu_carvel_ytt" not in native.existing_rules().keys():
    http_archive(
        name = "com_github_vmware_tanzu_carvel_ytt",
        sha256 = "27cce7c58bbd761808fb2eb17cf402e062d33b337749499279b07504383b4080",
        strip_prefix = "ytt-0.45.0",
        urls = ["https://github.com/vmware-tanzu/carvel-ytt/archive/v0.45.0.zip"],
        patches = [
            "@%s//buildpatches:delete_print" % workspace_name,
            "@%s//buildpatches:build_files" % workspace_name,
        ],
        patch_args = ["-s", "-p0"],
    )

  if "bazel_skylib" not in native.existing_rules().keys():
    http_archive(
        name = "bazel_skylib",
        sha256 = "b8a1527901774180afc798aeb28c4634bdccf19c4d98e7bdd1ce79d1fe9aaad7",
        urls = [
            "https://mirror.bazel.build/github.com/bazelbuild/bazel-skylib/releases/download/1.4.1/bazel-skylib-1.4.1.tar.gz",
            "https://github.com/bazelbuild/bazel-skylib/releases/download/1.4.1/bazel-skylib-1.4.1.tar.gz",
        ],
    )

  if "io_bazel_rules_docker" not in native.existing_rules().keys():
    http_archive(
        name = "io_bazel_rules_docker",
        sha256 = "b1e80761a8a8243d03ebca8845e9cc1ba6c82ce7c5179ce2b295cd36f7e394bf",
        urls = ["https://github.com/bazelbuild/rules_docker/releases/download/v0.25.0/rules_docker-v0.25.0.tar.gz"],
    )

    http_archive(
        name = "bazel_gazelle",
        sha256 = "ecba0f04f96b4960a5b250c8e8eeec42281035970aa8852dda73098274d14a1d",
        urls = [
            "https://mirror.bazel.build/github.com/bazelbuild/bazel-gazelle/releases/download/v0.29.0/bazel-gazelle-v0.29.0.tar.gz",
            "https://github.com/bazelbuild/bazel-gazelle/releases/download/v0.29.0/bazel-gazelle-v0.29.0.tar.gz",
        ],
    )
