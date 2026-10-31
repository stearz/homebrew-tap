cask "darniri" do
  version "1.3.0"
  sha256 "3f451e3e90f39383be509082b9edb51dd5643054c4f842c088372a56276bee09"

  url "https://github.com/stearz/Darniri/releases/download/v1.3.0/Darniri-arm64.zip"
  name "Darniri"
  desc "Scrolling-column window manager"
  homepage "https://github.com/stearz/Darniri"

  depends_on arch: :arm64
  depends_on macos: :sequoia

  app "Darniri.app"
  binary "#{appdir}/Darniri.app/Contents/Resources/darniri", target: "Darniri"
end
