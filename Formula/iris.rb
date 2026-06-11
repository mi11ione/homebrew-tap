# Copyright (c) 2026 Roman Zhuzhgov
# Licensed under the Apache License, Version 2.0

class Iris < Formula
  desc "Pure-Swift ARM64/ARM64E disassembler with a semantic layer validated against LLVM"
  homepage "https://github.com/mi11ione/iris"
  version "0.1.0"
  license "Apache-2.0"

  on_macos do
    url "https://github.com/mi11ione/iris/releases/download/0.1.0/iris-0.1.0-macos-universal.tar.gz"
    sha256 "63ea5c1ee3ad5bf7eedbaa8a7a33870a41872f64ed3f4ec8f47982ed02e2b02c"
  end

  on_linux do
    on_intel do
      url "https://github.com/mi11ione/iris/releases/download/0.1.0/iris-0.1.0-linux-x86_64.tar.gz"
      sha256 "b451b702fec1978745fdb65f674932a77f01bc61b94156287708cadeff438de8"
    end
    on_arm do
      url "https://github.com/mi11ione/iris/releases/download/0.1.0/iris-0.1.0-linux-aarch64.tar.gz"
      sha256 "a58e2dbfc0d96476e66c285d8a86b08744cecfa9774b1ece8edc1212f59e9090"
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
