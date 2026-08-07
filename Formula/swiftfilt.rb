# Copyright (c) 2026 Roman Zhuzhgov
# Licensed under the Apache License, Version 2.0

class Swiftfilt < Formula
  desc "Swift demangler you can pipe, script, and embed — c++filt for Swift"
  homepage "https://github.com/mi11ione/swiftfilt"
  version "1.0.2"
  license "Apache-2.0"

  on_macos do
    url "https://github.com/mi11ione/swiftfilt/releases/download/1.0.2/swiftfilt-1.0.2-macos-universal.tar.gz"
    sha256 "8e48c74b7667756f03a27b70db21b016755e230df3b5c4ce6e358bfdfbe1a8fc"
  end

  on_linux do
    on_intel do
      url "https://github.com/mi11ione/swiftfilt/releases/download/1.0.2/swiftfilt-1.0.2-linux-x86_64.tar.gz"
      sha256 "72bfa178ed1fd1f92b348f6ffa1b8c9c6632e7a46f1848b4527fa0426d340bde"
    end
    on_arm do
      url "https://github.com/mi11ione/swiftfilt/releases/download/1.0.2/swiftfilt-1.0.2-linux-aarch64.tar.gz"
      sha256 "ae03264a54f412c8fd7e68dfe5931e38b0e2f9dac924f71a74835ed3d052ecf9"
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
