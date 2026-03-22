class Previewsmcp < Formula
  desc "SwiftUI preview renderer with MCP server for AI-driven UI development"
  homepage "https://github.com/obj-p/PreviewsMCP"
  license "MIT"
  version "0.4.1"

  url "https://github.com/obj-p/PreviewsMCP/releases/download/v0.4.1/previewsmcp-0.4.1-darwin-arm64.tar.gz"
  sha256 "b6a46418268ee3466473cbd042dcebf428d1c390cf654d1a1f45dfeb09d4c183"

  depends_on :macos

  def install
    bin.install "previewsmcp"
  end

  def caveats
    <<~EOS
      previewsmcp requires Xcode 16+ to compile SwiftUI previews at runtime.
      For iOS simulator support, Apple Silicon is required.
    EOS
  end

  test do
    assert_match "SwiftUI previews", shell_output("#{bin}/previewsmcp --help")
  end
end
