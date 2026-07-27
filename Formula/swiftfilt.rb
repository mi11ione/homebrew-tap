# Copyright (c) 2026 Roman Zhuzhgov
# Licensed under the Apache License, Version 2.0

class Swiftfilt < Formula
  desc "Swift demangler you can pipe, script, and embed — c++filt for Swift"
  homepage "https://github.com/mi11ione/swiftfilt"
  version "1.0.1"
  license "Apache-2.0"

  on_macos do
    url "https://github.com/mi11ione/swiftfilt/releases/download/1.0.1/swiftfilt-1.0.1-macos-universal.tar.gz"
    sha256 "dd78054ee1d52718b69a473e770dd6de1fc9ab720abfb0a9a7835d47801d1793"
  end

  on_linux do
    on_intel do
      url "https://github.com/mi11ione/swiftfilt/releases/download/1.0.1/swiftfilt-1.0.1-linux-x86_64.tar.gz"
      sha256 "2a1f2f3e0b03a6ed6c0b83479f1d8e4dc12495bc03d2e95ed389739a3696133d"
    end
    on_arm do
      url "https://github.com/mi11ione/swiftfilt/releases/download/1.0.1/swiftfilt-1.0.1-linux-aarch64.tar.gz"
      sha256 "bbe46212bf43a714695d448d419077e8d5bc0aa47b55e77e5efafe97bbe780de"
    end
  end

  def install
    bin.install "swiftfilt"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/swiftfilt --version")
    assert_match "main.foo() -> ()", shell_output("#{bin}/swiftfilt '$s4main3fooyyF'")
  end
end
