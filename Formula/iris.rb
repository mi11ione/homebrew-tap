# Copyright (c) 2026 Roman Zhuzhgov
# Licensed under the Apache License, Version 2.0

class Iris < Formula
  desc "Pure-Swift ARM64/ARM64E disassembler with a semantic layer validated against LLVM"
  homepage "https://github.com/mi11ione/iris"
  version "1.0.0"
  license "Apache-2.0"

  on_macos do
    url "https://github.com/mi11ione/iris/releases/download/1.0.0/iris-1.0.0-macos-universal.tar.gz"
    sha256 "425b5badf651fdffc742967b6dc4cccbf318cb5ce0e98cb5a761ef4218787b80"
  end

  on_linux do
    on_intel do
      url "https://github.com/mi11ione/iris/releases/download/1.0.0/iris-1.0.0-linux-x86_64.tar.gz"
      sha256 "ccdd133e9438a7c66d5aef3ecc0994a95c7b58b59dd6bee6ecc19d85389ae3dd"
    end
    on_arm do
      url "https://github.com/mi11ione/iris/releases/download/1.0.0/iris-1.0.0-linux-aarch64.tar.gz"
      sha256 "e98d790eb399f07d4b4c07ff851f213219d9842b5838c791a15e348c3cee3799"
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
