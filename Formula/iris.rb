# Copyright (c) 2026 Roman Zhuzhgov
# Licensed under the Apache License, Version 2.0

class Iris < Formula
  desc "Pure-Swift ARM64/ARM64E disassembler with a semantic layer validated against LLVM"
  homepage "https://github.com/mi11ione/iris"
  version "0.2.0"
  license "Apache-2.0"

  on_macos do
    url "https://github.com/mi11ione/iris/releases/download/0.2.0/iris-0.2.0-macos-universal.tar.gz"
    sha256 "66daca571110624216715997e75ad701d05963aaedc45d1c4f18fee7add7fdf1"
  end

  on_linux do
    on_intel do
      url "https://github.com/mi11ione/iris/releases/download/0.2.0/iris-0.2.0-linux-x86_64.tar.gz"
      sha256 "03bc4b64476cf1165de2c93c60fdf77f1e2b2704013b80a2f3ffe6774c6e0d08"
    end
    on_arm do
      url "https://github.com/mi11ione/iris/releases/download/0.2.0/iris-0.2.0-linux-aarch64.tar.gz"
      sha256 "3a480626302923e4b2c0c044bbf698cb022f26c9d7521ec450187c82384572a9"
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
