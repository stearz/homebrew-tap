class Darniri < Formula
  desc "Darwin/macOS implementation of a Niri-style scrolling-column window manager"
  homepage "https://github.com/stearz/Darniri"
  license "GPL-2.0-only"
  version "1.1.0"

  url "https://github.com/stearz/Darniri/releases/download/v1.1.0/Darniri-arm64.tar.gz"
  sha256 "761989b850f2eb1cb2aa4f36b7d07c950d17982b207cdaeb6361869910e7d456"

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
