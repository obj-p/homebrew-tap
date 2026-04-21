class Previewsmcp < Formula
  desc "SwiftUI preview renderer with MCP server for AI-driven UI development"
  homepage "https://github.com/obj-p/PreviewsMCP"
  license "MIT"
  version "0.11.2"

  url "https://github.com/obj-p/PreviewsMCP/releases/download/v0.11.2/previewsmcp-0.11.2-darwin-arm64.tar.gz"
  sha256 "97b00e5ce5305013c82f7e766833d9410107d40629a10c546d357e290bfcc3dd"

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
