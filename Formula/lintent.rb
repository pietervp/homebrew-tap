class Lintent < Formula
  desc "Plain-language lint rules judged by a model, scoped with tree-sitter"
  homepage "https://github.com/pietervp/lintent"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/pietervp/lintent/releases/download/v0.1.1/lintent-aarch64-apple-darwin.tar.gz"
      sha256 "63f1edd528cf8314993324ce4b0c4e0d772042b1dd3b3074f9238a9ed95cde2b"
    end
    on_intel do
      url "https://github.com/pietervp/lintent/releases/download/v0.1.1/lintent-x86_64-apple-darwin.tar.gz"
      sha256 "632e52641d72f599e0386e6fc04ed4c826893215bb890412a4a9dd790103fcb0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/pietervp/lintent/releases/download/v0.1.1/lintent-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "73698e3f090056410932ea2784a8110a2e21224eb54d1b32fa07a3f2fe5e4dd5"
    end
    on_intel do
      url "https://github.com/pietervp/lintent/releases/download/v0.1.1/lintent-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b068bc14eb3f4b8eafae62b1d3ea0bf65af97227aa80eeed9941ee199c860edb"
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
