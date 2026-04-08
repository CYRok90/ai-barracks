class AiBarracks < Formula
  desc "Git-native AI agent workspace with session tracking and persistent memory"
  homepage "https://github.com/CYRok90/ai-barracks"
  url "https://github.com/CYRok90/ai-barracks/archive/refs/tags/v0.7.0.tar.gz"
  sha256 "c5c104ac9487e9061111ae769b551350bae5cfede032c0907fc984de0f54afbb"
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
