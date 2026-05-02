class Sicario < Formula
  desc "Next-generation SAST, SCA, and secret scanner"
  homepage "https://usesicario.xyz"
  version "0.2.3"  # bumped automatically by CI

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/sicario-labs/sicario-cli/releases/download/v#{version}/sicario-darwin-arm64.tar.gz"
      sha256 "2a8a0497b94b8531cf6f2ddf6b11a207a70e4bd30edb7e52046ae24569386d33"
    else
      url "https://github.com/sicario-labs/sicario-cli/releases/download/v#{version}/sicario-darwin-amd64.tar.gz"
      sha256 "e632bbb546755b5cf10129f5a62da5da357e976d1db7490545a2afad8de61158"
    end
  end

  on_linux do
    url "https://github.com/sicario-labs/sicario-cli/releases/download/v#{version}/sicario-linux-amd64.tar.gz"
    sha256 "c57d5f839cd04b0683e88f2eccf4dcb4fd54441dab5d5227037d7180496cadc9"
  end

  def install
    bin.install "sicario"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/sicario --version")
  end
end
