# Copyright (c) 2026 Roman Zhuzhgov
# Licensed under the Apache License, Version 2.0

class Iris < Formula
  desc "Pure-Swift ARM64/ARM64E disassembler with a semantic layer validated against LLVM"
  homepage "https://github.com/mi11ione/iris"
  version "0.7.0"
  license "Apache-2.0"

  on_macos do
    url "https://github.com/mi11ione/iris/releases/download/0.7.0/iris-0.7.0-macos-universal.tar.gz"
    sha256 "55aa139b7bafedbc0e42e067906b7f721d354ae9b380fa1cc6274deacd96e74d"
  end

  on_linux do
    on_intel do
      url "https://github.com/mi11ione/iris/releases/download/0.7.0/iris-0.7.0-linux-x86_64.tar.gz"
      sha256 "e8de5dcff9a32379c94922599647b685d5166f0ab5c9c0edc622ad65f4e1f644"
    end
    on_arm do
      url "https://github.com/mi11ione/iris/releases/download/0.7.0/iris-0.7.0-linux-aarch64.tar.gz"
      sha256 "19c38c22ff6556d7c2787bb61ba549c4828ed54cf545e1b78d93636bd707a0d0"
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
