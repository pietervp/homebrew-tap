class Lintent < Formula
  desc "Plain-language lint rules judged by a model, scoped with tree-sitter"
  homepage "https://github.com/pietervp/lintent"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/pietervp/lintent/releases/download/v0.1.4/lintent-aarch64-apple-darwin.tar.gz"
      sha256 "92f9603f030c0cce812fabcb921702508f1459b3a93dc4ad98319314ea6d1a58"
    end
    on_intel do
      url "https://github.com/pietervp/lintent/releases/download/v0.1.4/lintent-x86_64-apple-darwin.tar.gz"
      sha256 "4453b293fcf17fb60154c46fefb20ea369d57a5f861912a92c4d5b659052b496"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/pietervp/lintent/releases/download/v0.1.4/lintent-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "8ce08bc4844d3734c84b53d4df4521a8fca7a2a1541e445d75a82b2c94fd4225"
    end
    on_intel do
      url "https://github.com/pietervp/lintent/releases/download/v0.1.4/lintent-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d2439edc29656c041bb9543adeed2f76ef86d23b7d2615ddffad696c01619ebd"
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
