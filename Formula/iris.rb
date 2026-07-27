# Copyright (c) 2026 Roman Zhuzhgov
# Licensed under the Apache License, Version 2.0

class Iris < Formula
  desc "Pure-Swift ARM64/ARM64E disassembler with a semantic layer validated against LLVM"
  homepage "https://github.com/mi11ione/iris"
  version "0.6.0"
  license "Apache-2.0"

  on_macos do
    url "https://github.com/mi11ione/iris/releases/download/0.6.0/iris-0.6.0-macos-universal.tar.gz"
    sha256 "26cc2c907c4a6df896f6733a2433b0938196c88db5c345341e00babab262f653"
  end

  on_linux do
    on_intel do
      url "https://github.com/mi11ione/iris/releases/download/0.6.0/iris-0.6.0-linux-x86_64.tar.gz"
      sha256 "9b01d92738c1e0f6b03761899db7e5eb64b4517a4c94e2cfcabad8659c3b579a"
    end
    on_arm do
      url "https://github.com/mi11ione/iris/releases/download/0.6.0/iris-0.6.0-linux-aarch64.tar.gz"
      sha256 "cca48e339a5320ef6159efce6efde788c1900fbbd7218e9050f77089996b85bc"
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
