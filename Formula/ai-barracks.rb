class AiBarracks < Formula
  desc "Git-native AI agent workspace with session tracking and persistent memory"
  homepage "https://github.com/CYRok90/ai-barracks"
  url "https://github.com/ai-barracks/ai-barracks/archive/refs/tags/v0.9.1.tar.gz"
  sha256 "fa7ecc0c807b34ef178bdf8a468784a6109542553443c5afee421939e6a28c5e"
  license "MIT"

  def install
    bin.install "bin/aib"
    pkgshare.install "templates"
    pkgshare.install "scripts"
    zsh_completion.install "completions/_aib"

    # Patch template dir path in the aib script
    inreplace bin/"aib", /^TEMPLATE_DIR=.*$/, "TEMPLATE_DIR=\"#{pkgshare}/templates\""
  end

  test do
    system bin/"aib", "version"
  end
end
