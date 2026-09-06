class Gos < Formula
  desc "Go Switch - install and switch Go versions in seconds"
  homepage "https://github.com/johnny4young/gos"
  url "https://github.com/johnny4young/gos/archive/refs/tags/v1.11.0.tar.gz"
  version "1.11.0"
  sha256 "850dd87c47e22819c1fb4fcd9cfc43d85e56786dde35aac000cc77cccd8c6479"
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
