class Rmds < Formula
  desc "Remove all .DS_Store files recursively from current directory"
  homepage "https://github.com/fitchmultz/rmds"
  url "https://github.com/fitchmultz/rmds/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "0e7fb20e950282f7574ce5c86ac714d373b9e2c629ad405aacf093e60a9f556d"
  license "MIT"

  def install
    bin.install "rmds"
    man1.install "rmds.1"
  end

  test do
    # Create a test .DS_Store file
    touch "#{testpath}/.DS_Store"
    system bin/"rmds"
    refute_path_exists "#{testpath}/.DS_Store"

    # Test help flag
    assert_match "Usage: rmds", shell_output(bin/"rmds --help")
  end
end
