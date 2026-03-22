class Previewsmcp < Formula
  desc "SwiftUI preview renderer with MCP server for AI-driven UI development"
  homepage "https://github.com/obj-p/PreviewsMCP"
  license "MIT"
  version "0.4.0"

  url "https://github.com/obj-p/PreviewsMCP/releases/download/v0.4.0/previewsmcp-0.4.0-darwin-arm64.tar.gz"
  sha256 "805ad7c8928a3e8f66f5bb13474b1d56684aac56363cee99533c15bd2e8476d9"

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
