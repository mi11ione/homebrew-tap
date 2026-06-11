# Copyright (c) 2026 Roman Zhuzhgov
# Licensed under the Apache License, Version 2.0

class Iris < Formula
  desc "Pure-Swift ARM64/ARM64E disassembler with a semantic layer validated against LLVM"
  homepage "https://github.com/mi11ione/iris"
  version "0.1.0"
  license "Apache-2.0"

  on_macos do
    url "https://github.com/mi11ione/iris/releases/download/0.1.0/iris-0.1.0-macos-universal.tar.gz"
    sha256 "FILL_AFTER_FIRST_RELEASE_MACOS"
  end

  on_linux do
    on_intel do
      url "https://github.com/mi11ione/iris/releases/download/0.1.0/iris-0.1.0-linux-x86_64.tar.gz"
      sha256 "FILL_AFTER_FIRST_RELEASE_LINUX_X86_64"
    end
    on_arm do
      url "https://github.com/mi11ione/iris/releases/download/0.1.0/iris-0.1.0-linux-aarch64.tar.gz"
      sha256 "FILL_AFTER_FIRST_RELEASE_LINUX_AARCH64"
    end
  end

  def install
    bin.install "iris"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/iris --version")
    assert_match "nop", shell_output("#{bin}/iris 0xd503201f")
  end
end
