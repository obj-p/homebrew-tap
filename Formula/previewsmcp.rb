class Previewsmcp < Formula
  desc "SwiftUI preview renderer with MCP server for AI-driven UI development"
  homepage "https://github.com/obj-p/PreviewsMCP"
  license "MIT"
  version "0.3.0"

  url "https://github.com/obj-p/PreviewsMCP/releases/download/v0.3.0/previewsmcp-0.3.0-darwin-arm64.tar.gz"
  sha256 "c7091fbdbc70b7cb679deadebb192593b88680edd508a507228d4709b75717f2"

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
