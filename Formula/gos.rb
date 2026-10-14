class Gos < Formula
  desc "Go Switch - install and switch Go versions in seconds"
  homepage "https://github.com/johnny4young/gos"
  url "https://github.com/johnny4young/gos/archive/refs/tags/v1.11.1.tar.gz"
  version "1.11.1"
  sha256 "7a66e8e79a81e40f076b150d4b0e2f7511b86e38cec11b6fc50fb9f9664890ca"
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
