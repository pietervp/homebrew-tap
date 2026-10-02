class Lintent < Formula
  desc "Plain-language lint rules judged by a model, scoped with tree-sitter"
  homepage "https://github.com/pietervp/lintent"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/pietervp/lintent/releases/download/v0.1.0/lintent-aarch64-apple-darwin.tar.gz"
      sha256 "d5bc35f4d901a435fb49ad9ed22aa0468b3e9817979811a91a19210ce6d27f2b"
    end
    on_intel do
      url "https://github.com/pietervp/lintent/releases/download/v0.1.0/lintent-x86_64-apple-darwin.tar.gz"
      sha256 "3d2f07bea361fc393d024a2d6bcbd7864a64371fa6fc75ba0073e28772ebdee5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/pietervp/lintent/releases/download/v0.1.0/lintent-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "c5cde1d64393f20935e50859126b1673114063ecf303e36bd4969b9917f88ed3"
    end
    on_intel do
      url "https://github.com/pietervp/lintent/releases/download/v0.1.0/lintent-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "fb1a8898a07e9db0d31cdabb39c35f90786e316448076118a724ea6ebb1b3426"
    end
  end

  def install
    bin.install "lintent"
    pkgshare.install "skills"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/lintent --version")
    system bin/"lintent", "init"
    assert_path_exists testpath/"lintent.toml"
  end
end
