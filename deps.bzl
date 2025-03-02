load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

def openssl_deps():
    VERSION = "1.1.1w"

    for (arch, sha256) in [
        ("x86_64", "604c4489d0b05f22f41bfaa85a19452a78533dcb99f481b0bb4918d0771856f6"),
        ("arm64", "7858a0d504ba263be9d1ea3855ffd0b819a306133a8e8f38980af00bb38d5795"),
    ]:
        http_archive(
            name = "openssl_macos_" + arch,
            sha256 = sha256,
            urls = ["https://github.com/scasagrande/openssl-prebuilt/releases/download/openssl-prebuilt-{ver}/openssl-darwin-{arch}-{ver}.tar.zst".format(arch = arch, ver = VERSION)],
            build_file = "//:BUILD.openssl_darwin.bazel",
        )

    for (arch, sha256) in [
        ("x86_64", "f69e323a2f95693178f5b2fa01ee1087eb609503c3c6a6873b0f5035419eeb80"),
        ("aarch64", "2cd400a13d493d6c4e92b1f46ea456d3c5e7b28c721ecd0d480bb19f7c6e501f"),
    ]:
        http_archive(
            name = "openssl_linux_" + arch,
            sha256 = sha256,
            urls = ["https://github.com/scasagrande/openssl-prebuilt/releases/download/openssl-prebuilt-{ver}/openssl-linux-rhel8-{arch}-{ver}.tar.zst".format(arch = arch, ver = VERSION)],
            build_file = "//:BUILD.openssl_linux.bazel",
        )

def _non_module_dependencies_impl(_ctx):
    openssl_deps()
    return _ctx.extension_metadata(
        root_module_direct_deps = "all",
        root_module_direct_dev_deps = [],
        reproducible = True,
    )

non_module_dependencies = module_extension(
    implementation = _non_module_dependencies_impl,
)
