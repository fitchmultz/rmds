class Rmds < Formula
  desc "Remove all .DS_Store files recursively from current directory"
  homepage "https://github.com/fitchmultz/rmds"
  url "https://github.com/fitchmultz/rmds/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "REPLACE_WITH_ACTUAL_SHA256_AFTER_RELEASE"
  license "MIT"

  def install
    bin.install "rmds"
    man1.install "rmds.1"
  end

  test do
    # Create a test .DS_Store file
    touch "#{testpath}/.DS_Store"
    system "#{bin}/rmds"
    refute_predicate testpath/".DS_Store", :exist?
    
    # Test help flag
    assert_match "Usage: rmds", shell_output("#{bin}/rmds --help")
  end
end