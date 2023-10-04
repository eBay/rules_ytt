def _impl(ctx):
  runtools = []
  dv = []
  runfiles = ctx.runfiles()

  if ctx.file.image:
    image_digest = ctx.actions.declare_file("image_digest.out")

    ctx.actions.run_shell(
      inputs = [ctx.file.image],
      outputs = [image_digest],
      command = "sed -e 's/^/image_digest: /g' {} > {}".format(ctx.file.image.path, image_digest.path),
    )

    runfiles = runfiles.merge(ctx.runfiles(files = [ctx.file.image, image_digest]))
    runtools = [image_digest]
    dv = ["--data-values-file", image_digest.path]

  files = []
  for f in ctx.files.srcs:
    files += ["-f", f.path]

  tree = ctx.actions.declare_directory(ctx.label.name + "_out")

  ctx.actions.run(
    inputs = ctx.files.srcs,
    outputs = [tree],
    arguments =  files + dv + [
      "--dangerous-allow-all-symlink-destinations",
      "--output-files", tree.path,
    ],
    executable = ctx.toolchains["//:toolchain_type"].info.ytt,
    tools = runtools,
  )

  out = ctx.actions.declare_file(ctx.label.name + ".yaml")

  args = ctx.actions.args()
  args.add_all("", depset([tree]))

  ctx.actions.run_shell(
    inputs = depset([tree]),
    arguments = [args],
    outputs = [out],
    command = "cat $@ > {}".format(out.path),
  )

  ctx.actions.write(
    output = ctx.outputs.executable,
    content = "cat {}".format(out.short_path),
    is_executable = True,
  )

  return [DefaultInfo(
    files = depset([out]),
    runfiles = runfiles.merge(ctx.runfiles(files = [out])),
    executable = ctx.outputs.executable,
  )]

ytt = rule(
  implementation = _impl,
  attrs = {
    "srcs": attr.label_list(
      allow_files = True,
      mandatory = True,
      doc = "List of files that will be passed to ytt with -f param.",
    ),
    "image": attr.label(
      allow_single_file = True,
      doc = "Target that generates a Docker image. Used for extracting image digest.",
    ),
  },
  toolchains = ["//:toolchain_type"],
  executable = True,
)

