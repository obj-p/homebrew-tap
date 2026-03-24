class Previewsmcp < Formula
  desc "SwiftUI preview renderer with MCP server for AI-driven UI development"
  homepage "https://github.com/obj-p/PreviewsMCP"
  license "MIT"
  version "0.6.1"

  url "https://github.com/obj-p/PreviewsMCP/releases/download/v0.6.1/previewsmcp-0.6.1-darwin-arm64.tar.gz"
  sha256 "73f5afcced13936b66b4578f8a7e7f8de35b7a2881b1a53df1288bff86aeb7f9"

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
