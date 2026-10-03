class Lintent < Formula
  desc "Plain-language lint rules judged by a model, scoped with tree-sitter"
  homepage "https://github.com/pietervp/lintent"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/pietervp/lintent/releases/download/v0.1.2/lintent-aarch64-apple-darwin.tar.gz"
      sha256 "a3819fcd2d88d7848fe9120a4be2502ea794391b704e43bda6bbdf47781f9669"
    end
    on_intel do
      url "https://github.com/pietervp/lintent/releases/download/v0.1.2/lintent-x86_64-apple-darwin.tar.gz"
      sha256 "91c8042755d1a23af024d0ffc62720e22f0b3c25fecb6703ede148717ac9b38a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/pietervp/lintent/releases/download/v0.1.2/lintent-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "f24608326ff836d91df3d70a15915fb745e33a778e22a22e2056975201688d06"
    end
    on_intel do
      url "https://github.com/pietervp/lintent/releases/download/v0.1.2/lintent-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c7d36c676b4987f560a7942e91d5880a746cd7515baf09fa57012d3b8faf3de7"
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
