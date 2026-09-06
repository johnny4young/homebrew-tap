class Gos < Formula
  desc "Go Switch - install and switch Go versions in seconds"
  homepage "https://github.com/johnny4young/gos"
  url "https://github.com/johnny4young/gos/archive/refs/tags/v1.10.0.tar.gz"
  version "1.10.0"
  sha256 "ccf7d14ea94bc5cb8c4b25e93a98456cf08fb7be1e138fb2fb399095e8878445"
  license "MIT"

  def install
    bin.install "gos.sh" => "gos"
    bash_completion.install "completions/gos.bash" => "gos"
    zsh_completion.install "completions/gos.zsh" => "_gos"
    fish_completion.install "completions/gos.fish"
    man1.install "docs/gos.1"
  end

  test do
    assert_match "gos v#{version}", shell_output("#{bin}/gos version")
  end
end
