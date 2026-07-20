class Vzy < Formula
  desc "Swift VM harness for reproducible macOS guests via Virtualization.framework"
  homepage "https://github.com/obj-p/vzy"
  license "MIT"
  version "0.1.0"

  url "https://github.com/obj-p/vzy/releases/download/v0.1.0/vzy-0.1.0-darwin-arm64.tar.gz"
  sha256 "91a51fb4793801b5ce1084c6b90d3bce7dd82d98178e7e7014394032f96624dc"

  depends_on macos: :sonoma
  depends_on arch: :arm64

  def install
    # `vzy run` compiles Swift scripts against the VZYKit sources beside
    # the binary's real file, so the whole package tree lands in libexec
    # and bin gets a symlink (the binary resolves symlinks when locating
    # its package root).
    libexec.install Dir["*"]
    bin.install_symlink libexec/"vzy"
  end

  def caveats
    <<~EOS
      vzy requires an Apple Silicon Mac running macOS 14 or newer.
      `vzy run` compiles scripts with the Swift toolchain, so Xcode or
      the Command Line Tools must be installed.
    EOS
  end

  test do
    assert_match "vzy", shell_output("#{bin}/vzy --help")
  end
end
