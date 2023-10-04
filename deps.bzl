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
        sha256 = "13c70be7f2631bf313c6269206b738f6a9976f2f8b9c480624a70d75a495f4f8",
        strip_prefix = "ytt-0.46.0",
        urls = ["https://github.com/vmware-tanzu/carvel-ytt/archive/v0.46.0.zip"],
        patches = [
            "@%s//buildpatches:delete_print" % workspace_name,
            "@%s//buildpatches:build_files" % workspace_name,
        ],
        patch_args = ["-s", "-p0"],
    )

  if "rules_oci" not in native.existing_rules().keys():
    http_archive(
        name = "rules_oci",
        sha256 = "21a7d14f6ddfcb8ca7c5fc9ffa667c937ce4622c7d2b3e17aea1ffbc90c96bed",
        strip_prefix = "rules_oci-1.4.0",
        url = "https://github.com/bazel-contrib/rules_oci/releases/download/v1.4.0/rules_oci-v1.4.0.tar.gz",
    )

  if "io_bazel_stardoc" not in native.existing_rules().keys():
    http_archive(
        name = "io_bazel_stardoc",
        sha256 = "3fd8fec4ddec3c670bd810904e2e33170bedfe12f90adf943508184be458c8bb",
        urls = [
            "https://mirror.bazel.build/github.com/bazelbuild/stardoc/releases/download/0.5.3/stardoc-0.5.3.tar.gz",
            "https://github.com/bazelbuild/stardoc/releases/download/0.5.3/stardoc-0.5.3.tar.gz",
        ],
    )

  if "aspect_bazel_lib" not in native.existing_rules().keys():
    http_archive(
        name = "aspect_bazel_lib",
        sha256 = "a185ccff9c1b8589c63f66d7eb908de15c5d6bb05562be5f46336c53e7a7326a",
        strip_prefix = "bazel-lib-2.0.0-rc1",
        url = "https://github.com/aspect-build/bazel-lib/releases/download/v2.0.0-rc1/bazel-lib-v2.0.0-rc1.tar.gz",
    )

def ytt_register_toolchains():
  return native.register_toolchains( ":toolchain")
