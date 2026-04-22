class Previewsmcp < Formula
  desc "SwiftUI preview renderer with MCP server for AI-driven UI development"
  homepage "https://github.com/obj-p/PreviewsMCP"
  license "MIT"
  version "0.12.0"

  url "https://github.com/obj-p/PreviewsMCP/releases/download/v0.12.0/previewsmcp-0.12.0-darwin-arm64.tar.gz"
  sha256 "dde88189996d951da22ecbc3ac134e1d62cef8e94644fe3f691de59388c95a7f"

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
