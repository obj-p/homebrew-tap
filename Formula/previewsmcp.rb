class Previewsmcp < Formula
  desc "SwiftUI preview renderer with MCP server for AI-driven UI development"
  homepage "https://github.com/obj-p/PreviewsMCP"
  license "MIT"
  version "0.7.0"

  url "https://github.com/obj-p/PreviewsMCP/releases/download/v0.7.0/previewsmcp-0.7.0-darwin-arm64.tar.gz"
  sha256 "7c908a097091bd41cff627dd371e7b8cb7a545d8b0509e1b3c19329f90d41ebd"

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
