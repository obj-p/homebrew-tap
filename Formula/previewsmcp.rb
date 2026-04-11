class Previewsmcp < Formula
  desc "SwiftUI preview renderer with MCP server for AI-driven UI development"
  homepage "https://github.com/obj-p/PreviewsMCP"
  license "MIT"
  version "0.10.1"

  url "https://github.com/obj-p/PreviewsMCP/releases/download/v0.10.1/previewsmcp-0.10.1-darwin-arm64.tar.gz"
  sha256 "4873167d84954371296cb57ba72b032d641bb5bf1de5daaa99b31ed27d91be78"

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
