class Previewsmcp < Formula
  desc "SwiftUI preview renderer with MCP server for AI-driven UI development"
  homepage "https://github.com/obj-p/PreviewsMCP"
  license "MIT"
  version "0.8.0"

  url "https://github.com/obj-p/PreviewsMCP/releases/download/v0.8.0/previewsmcp-0.8.0-darwin-arm64.tar.gz"
  sha256 "763018b80a0ba591f3bc511b580ee79d22b2a9bc2757f9fff291703858dd9d87"

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
