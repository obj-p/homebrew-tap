class Previewsmcp < Formula
  desc "SwiftUI preview renderer with MCP server for AI-driven UI development"
  homepage "https://github.com/obj-p/PreviewsMCP"
  license "MIT"
  version "0.12.1"

  url "https://github.com/obj-p/PreviewsMCP/releases/download/v0.12.1/previewsmcp-0.12.1-darwin-arm64.tar.gz"
  sha256 "250f3da7cc1da7925ec3bbdb562126d6392c1f84147a2e642918a65ba41f11f4"

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
