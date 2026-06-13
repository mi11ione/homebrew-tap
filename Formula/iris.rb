# Copyright (c) 2026 Roman Zhuzhgov
# Licensed under the Apache License, Version 2.0

class Iris < Formula
  desc "Pure-Swift ARM64/ARM64E disassembler with a semantic layer validated against LLVM"
  homepage "https://github.com/mi11ione/iris"
  version "0.3.0"
  license "Apache-2.0"

  on_macos do
    url "https://github.com/mi11ione/iris/releases/download/0.3.0/iris-0.3.0-macos-universal.tar.gz"
    sha256 "fab479e2718ca7d0948889cb15b6f931ae719b14f37ebf77be9f362c1241f764"
  end

  on_linux do
    on_intel do
      url "https://github.com/mi11ione/iris/releases/download/0.3.0/iris-0.3.0-linux-x86_64.tar.gz"
      sha256 "c8a5e532076b9faac3cd15f62bf58bb7d25a70a083304efe78668c7121de2aac"
    end
    on_arm do
      url "https://github.com/mi11ione/iris/releases/download/0.3.0/iris-0.3.0-linux-aarch64.tar.gz"
      sha256 "120d7ea738ad98b7910f7ae5a32d0dde5ac6e1ecd04b95803b21b1a995e05135"
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
