load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("@bazel_tools//tools/build_defs/repo:utils.bzl", "maybe")

def rust_setup_stage_1():
    maybe(
        http_archive,
        name = "rules_rust",
        sha256 = "c9d5a39cb3e1ceacace98f19f09d61c4b55034bc34a565bdcf7cd80eb4c412af",
        url = "https://github.com/bazelbuild/rules_rust/releases/download/0.62.0/rules_rust-0.62.0.tar.gz",
    )

    maybe(
        http_archive,
        name = "rules_rust_bindgen",
        sha256 = "c9d5a39cb3e1ceacace98f19f09d61c4b55034bc34a565bdcf7cd80eb4c412af",
        strip_prefix = "extensions/bindgen",
        url = "https://github.com/bazelbuild/rules_rust/releases/download/0.62.0/rules_rust-0.62.0.tar.gz",
    )

    maybe(
        http_archive,
        name = "ros2_rust",
        build_file = "@com_github_mvukov_rules_ros2//repositories:ros2_rust.BUILD.bazel",
        sha256 = "693408db72d40bd11d80740b7bf8d3ef2122f6b98eeaf4a1dba7c5f2d0b479b5",
        strip_prefix = "ros2_rust-94f76e5e220f3bb393372dc4d4042abfdb00b427",
        urls = ["https://github.com/ros2-rust/ros2_rust/archive/94f76e5e220f3bb393372dc4d4042abfdb00b427.zip"],
        patch_args = ["-p1"],
        patches = [
            "@com_github_mvukov_rules_ros2//repositories/patches:ros2_rust_fix_rclrs.patch",
            "@com_github_mvukov_rules_ros2//repositories/patches:ros2_rust_fix_rosidl_generator.patch",
            "@com_github_mvukov_rules_ros2//repositories/patches:ros2_rust_fix_rosidl_runtime.patch",
        ],
    )
