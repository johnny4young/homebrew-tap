class Gos < Formula
  desc "Go Switch - install and switch Go versions in seconds"
  homepage "https://github.com/johnny4young/gos"
  url "https://github.com/johnny4young/gos/archive/refs/tags/v1.7.0.tar.gz"
  version "1.7.0"
  sha256 "a87143169f2a85b37132bec50d68b83375d6f1fada91c75e5bd133e342f50616"
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
