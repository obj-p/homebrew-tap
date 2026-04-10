class Previewsmcp < Formula
  desc "SwiftUI preview renderer with MCP server for AI-driven UI development"
  homepage "https://github.com/obj-p/PreviewsMCP"
  license "MIT"
  version "0.9.0"

  url "https://github.com/obj-p/PreviewsMCP/releases/download/v0.9.0/previewsmcp-0.9.0-darwin-arm64.tar.gz"
  sha256 "d0b74b1884ef9cf77cd9050d9b0ca6ac11c6a72eaf2727fd18aed4941cc79fa9"

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
