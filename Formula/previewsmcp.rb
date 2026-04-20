class Previewsmcp < Formula
  desc "SwiftUI preview renderer with MCP server for AI-driven UI development"
  homepage "https://github.com/obj-p/PreviewsMCP"
  license "MIT"
  version "0.11.1"

  url "https://github.com/obj-p/PreviewsMCP/releases/download/v0.11.1/previewsmcp-0.11.1-darwin-arm64.tar.gz"
  sha256 "d49ec7eefd0a905e17d8515f78d181a1440032472005674a9ad690dbf6cab8b2"

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
