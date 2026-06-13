# Copyright (c) 2026 Roman Zhuzhgov
# Licensed under the Apache License, Version 2.0

class Iris < Formula
  desc "Pure-Swift ARM64/ARM64E disassembler with a semantic layer validated against LLVM"
  homepage "https://github.com/mi11ione/iris"
  version "0.4.0"
  license "Apache-2.0"

  on_macos do
    url "https://github.com/mi11ione/iris/releases/download/0.4.0/iris-0.4.0-macos-universal.tar.gz"
    sha256 "5e9e0325f18068c3ff7d2764cd7866822d3b398c5d487ab67c66f5f081189118"
  end

  on_linux do
    on_intel do
      url "https://github.com/mi11ione/iris/releases/download/0.4.0/iris-0.4.0-linux-x86_64.tar.gz"
      sha256 "4b5d371abdf0051761f92e237a718ef6ea39458e0af7faf647f70678d434dc1d"
    end
    on_arm do
      url "https://github.com/mi11ione/iris/releases/download/0.4.0/iris-0.4.0-linux-aarch64.tar.gz"
      sha256 "2e3b5d8436e3500e012147b463e07c748d530cc9678b77b08b0f7a4fd1ed27f4"
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
