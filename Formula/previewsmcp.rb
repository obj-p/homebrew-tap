class Previewsmcp < Formula
  desc "SwiftUI preview renderer with MCP server for AI-driven UI development"
  homepage "https://github.com/obj-p/PreviewsMCP"
  license "MIT"
  version "0.11.3"

  url "https://github.com/obj-p/PreviewsMCP/releases/download/v0.11.3/previewsmcp-0.11.3-darwin-arm64.tar.gz"
  sha256 "2445e4406e7e4b289a8eb67c505523505d12584ab14b3ad923050d1be26afd65"

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
