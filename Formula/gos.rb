class Gos < Formula
  desc "Go Switch - install and switch Go versions in seconds"
  homepage "https://github.com/johnny4young/gos"
  url "https://github.com/johnny4young/gos/archive/refs/tags/v1.5.0.tar.gz"
  version "1.5.0"
  sha256 "53a3ecb4a9a51fbeff090f678fae776118913cfcbf1485dfaf9107babc9dc49c"
  license "MIT"

  def install
    bin.install "gos.sh" => "gos"
    bash_completion.install "completions/gos.bash" => "gos"
    zsh_completion.install "completions/gos.zsh" => "_gos"
    fish_completion.install "completions/gos.fish"
  end

  test do
    assert_match "gos v#{version}", shell_output("#{bin}/gos version")
  end
end
