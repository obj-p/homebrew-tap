class Previewsmcp < Formula
  desc "SwiftUI preview renderer with MCP server for AI-driven UI development"
  homepage "https://github.com/obj-p/PreviewsMCP"
  license "MIT"
  version "0.1.0"

  url "https://github.com/obj-p/PreviewsMCP/releases/download/v0.1.0/previewsmcp-0.1.0-darwin-arm64.tar.gz"
  sha256 "2a27bed571f9dbdbfbbd0d4c9c72652e6a2a58270af7541eb4be73f3eb25f0d0"

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
