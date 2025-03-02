# prebuilt openssl for bazel

This is an example implementation of how to provide pre-built copies of
openssl to a bazel build.

It is pretty limited, but provides enough of an implementation for CC
targets, and enough to build the rust openssl-sys crate.

Currently only provides openssl 1.1.1w as taken from the following locations:

- Linux copies are taken from a Red Hat Universal Base Image 8 container
- macOS copies are from brew.sh

There is nothing special about these specific copies. I used them purely
because in my use case I was using RHEL UBI 8 in production and wanted
my builds to dynamically link against as close of a version as possible.

In the future I might update this to allow for more customization of the
version, or to fetch the copies direct from the source via tools such
as [bazeldnf](https://github.com/rmohr/bazeldnf).

Note that you should not rely on copies that I have provided for your
business needs! Use this as an idea, and modify it to fetch copies that
you trust.

