class Gos < Formula
  desc "Go Switch - install and switch Go versions in seconds"
  homepage "https://github.com/johnny4young/gos"
  url "https://github.com/johnny4young/gos/archive/refs/tags/v1.9.0.tar.gz"
  version "1.9.0"
  sha256 "0e0af8484d4de0b8c4a25e4465d789ccab6f03f710c06416e5568d583d1c46f5"
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
