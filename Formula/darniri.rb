class Darniri < Formula
  desc "Darwin/macOS implementation of a Niri-style scrolling-column window manager"
  homepage "https://github.com/stearz/Darniri"
  license "GPL-2.0-only"
  version "1.1.0"

  url "https://github.com/stearz/Darniri/releases/download/v1.1.0/Darniri-arm64.tar.gz"
  sha256 "b60d62c46e8b425ad03de60f2c96e2cc6ff9fa37b07fce3447ac2b8cc5538c45"

  head "https://github.com/stearz/Darniri.git", branch: "main"

  depends_on macos: :sequoia
  depends_on arch: :arm64
  depends_on xcode: :build if build.head?

  def install
    if build.head?
      system "swift", "build",
        "--configuration", "release",
        "--disable-sandbox",
        "--product", "Darniri"
      bin.install ".build/release/Darniri"
    else
      bin.install "Darniri"
    end
  end

  test do
    assert_path_exists bin/"Darniri"
  end
end
