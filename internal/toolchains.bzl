load(":providers.bzl", "YttToolchainInfo")

def _ytt_toolchain_impl(ctx):
  return [platform_common.ToolchainInfo(
        info = YttToolchainInfo(
          ytt = ctx.executable.ytt,
        ),
    )]

ytt_toolchain = rule(
  implementation = _ytt_toolchain_impl,
  attrs = {
    "ytt": attr.label(
      executable = True,
      cfg = "exec",
      allow_single_file = True,
      doc = "Ytt binary.",
      mandatory = True,
    ),
  },
  doc = "Gathers functions and file lists needed for a Ytt toolchain",
)
