class Previewsmcp < Formula
  desc "SwiftUI preview renderer with MCP server for AI-driven UI development"
  homepage "https://github.com/obj-p/PreviewsMCP"
  license "MIT"
  version "0.5.0"

  url "https://github.com/obj-p/PreviewsMCP/releases/download/v0.5.0/previewsmcp-0.5.0-darwin-arm64.tar.gz"
  sha256 "13f35aa44f14b6a06723cd660e33880ec2c7729a10fcb1bfcee92556ab870d1a"

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
