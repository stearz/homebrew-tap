class Darniri < Formula
  desc "Darwin/macOS implementation of a Niri-style scrolling-column window manager"
  homepage "https://github.com/stearz/Darniri"
  license "GPL-2.0-only"
  version "1.0.0"

  url "https://github.com/stearz/Darniri/releases/download/v1.0.0/Darniri-arm64.tar.gz"
  sha256 "7f83c9bc52af2c657cf4386d95465bbb477220fa366a9085c75d15ff2b523724"

  head "https://github.com/stearz/Darniri.git", branch: "main"

  depends_on macos: :sequoia
  depends_on xcode: ["16.4", :build] if build.head?

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
