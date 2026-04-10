class Previewsmcp < Formula
  desc "SwiftUI preview renderer with MCP server for AI-driven UI development"
  homepage "https://github.com/obj-p/PreviewsMCP"
  license "MIT"
  version "0.10.0"

  url "https://github.com/obj-p/PreviewsMCP/releases/download/v0.10.0/previewsmcp-0.10.0-darwin-arm64.tar.gz"
  sha256 "9ce65a50e4c7033a9ffa2ada1c253747147844f2c23c1fbfe9a2cca16d4eaaf5"

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
