class Previewsmcp < Formula
  desc "SwiftUI preview renderer with MCP server for AI-driven UI development"
  homepage "https://github.com/obj-p/PreviewsMCP"
  license "MIT"
  version "0.11.0"

  url "https://github.com/obj-p/PreviewsMCP/releases/download/v0.11.0/previewsmcp-0.11.0-darwin-arm64.tar.gz"
  sha256 "16cf09624eec1f1f103e3ca6173c19f8b5a7ccd6cdcac0526b4fb115898129d0"

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
