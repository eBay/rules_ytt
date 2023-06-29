<!-- Generated with Stardoc: http://skydoc.bazel.build -->



<a id="ytt"></a>

## ytt

<pre>
ytt(<a href="#ytt-name">name</a>, <a href="#ytt-image">image</a>, <a href="#ytt-srcs">srcs</a>)
</pre>



**ATTRIBUTES**


| Name  | Description | Type | Mandatory | Default |
| :------------- | :------------- | :------------- | :------------- | :------------- |
| <a id="ytt-name"></a>name |  A unique name for this target.   | <a href="https://bazel.build/concepts/labels#target-names">Name</a> | required |  |
| <a id="ytt-image"></a>image |  Target that generates a Docker image. Used for extracting image digest.   | <a href="https://bazel.build/concepts/labels">Label</a> | optional | <code>None</code> |
| <a id="ytt-srcs"></a>srcs |  List of files that will be passed to ytt with -f param.   | <a href="https://bazel.build/concepts/labels">List of labels</a> | required |  |


