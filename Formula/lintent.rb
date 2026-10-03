class Lintent < Formula
  desc "Plain-language lint rules judged by a model, scoped with tree-sitter"
  homepage "https://github.com/pietervp/lintent"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/pietervp/lintent/releases/download/v0.1.3/lintent-aarch64-apple-darwin.tar.gz"
      sha256 "3de761131b35351803e32edc495adf88da840c0815969ec1261e04b3e7445dc5"
    end
    on_intel do
      url "https://github.com/pietervp/lintent/releases/download/v0.1.3/lintent-x86_64-apple-darwin.tar.gz"
      sha256 "0d308abdacc737e39d28ecc1cfb9f2bbb006ff0a7614f9f18e6c8ce50e3b4b7b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/pietervp/lintent/releases/download/v0.1.3/lintent-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "1b247a011d7391fbad76ba25c3283d07b3f0e72094dfd71a60f6aecc7d1c2e76"
    end
    on_intel do
      url "https://github.com/pietervp/lintent/releases/download/v0.1.3/lintent-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "ffc906098f6df6a3b0c0759dfa7365ed7ac25cb46e697ecfb971f03f53ffb1d9"
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
