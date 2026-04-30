class Previewsmcp < Formula
  desc "SwiftUI preview renderer with MCP server for AI-driven UI development"
  homepage "https://github.com/obj-p/PreviewsMCP"
  license "MIT"
  version "0.12.2"

  url "https://github.com/obj-p/PreviewsMCP/releases/download/v0.12.2/previewsmcp-0.12.2-darwin-arm64.tar.gz"
  sha256 "e2db7a23fd2c78e2f5d506c689f1f572bb13337d2ca895894ec96e786c02e4c0"

  depends_on :macos

  def install
    bin.install "previewsmcp"
  end

  def post_install
    # Kill any daemon left over from a previous Homebrew-installed
    # version so it can't receive requests from the newly-upgraded
    # CLI. The in-binary version handshake (issue #142) covers this
    # case too — this hook is defense-in-depth that short-circuits
    # the handshake's kill+respawn sequence when brew is the install
    # path. Ignores failure: a wedged daemon that won't respond to
    # SIGTERM must not fail `brew upgrade`; the handshake will
    # surface a clear error on the next CLI invocation.
    system bin/"previewsmcp", "kill-daemon", "--timeout", "5" rescue nil
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
