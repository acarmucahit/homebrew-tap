class Napbar < Formula
  desc "Menu bar app that puts your Mac to sleep after a chosen number of minutes"
  homepage "https://github.com/acarmucahit/napbar"
  url "https://github.com/acarmucahit/napbar/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "1cfc13d5ba215f681baf2d806790efa1fcd324b7c31444cc0d6db8d3a09597c3"
  license "MIT"

  depends_on macos: :ventura

  def install
    system "./build.sh"
    prefix.install "NapBar.app"
  end

  def caveats
    <<~EOS
      To add NapBar to your Applications folder:
        ln -sfn #{opt_prefix}/NapBar.app /Applications/NapBar.app

      Then launch it:
        open /Applications/NapBar.app
    EOS
  end

  test do
    assert_predicate prefix/"NapBar.app/Contents/MacOS/NapBar", :executable?
    system "codesign", "--verify", prefix/"NapBar.app"
  end
end
