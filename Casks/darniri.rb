cask "darniri" do
  version "1.2.0"
  sha256 "d838ea0a95f44cd54745c178b0d65ab99bcf53485fc385c70f7909fbadd55c38"

  url "https://github.com/stearz/Darniri/releases/download/v1.2.0/Darniri-arm64.zip"
  name "Darniri"
  desc "Scrolling-column window manager for macOS"
  homepage "https://github.com/stearz/Darniri"

  depends_on macos: ">= :sequoia"
  depends_on arch: :arm64

  app "Darniri.app"
  binary "#{appdir}/Darniri.app/Contents/Resources/darniri", target: "Darniri"
end
