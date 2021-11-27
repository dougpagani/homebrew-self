# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class DiskutilCompletion < Formula
  desc "Bash shell completion for OS X/Darwin diskutil utility"
  homepage "https://github.com/dougpagani/diskutil_completion"
  url "https://github.com/dougpagani/diskutil_completion/archive/refs/tags/1.0.1.tar.gz"
  sha256 "c0411f77ce0ce32ea232bf6e3ee5b12ef5746675f5b87f80986b4190cac31d75"
  license ""

  # depends_on "cmake" => :build

  def install
    bash_completion.install "diskutil_completion" => "diskutil"
    bin.install "complete_diskutil.py" => "complete_diskutil.py"
    # system 'ln', '-s', 

    # ENV.deparallelize  # if your formula fails when building in parallel
    # Remove unrecognized options if warned by configure
    # https://rubydoc.brew.sh/Formula.html#std_configure_args-instance_method
    # system "./configure", *std_configure_args, "--disable-silent-rules"
    # system "cmake", "-S", ".", "-B", "build", *std_cmake_args
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! For Homebrew/homebrew-core
    # this will need to be a test that verifies the functionality of the
    # software. Run the test with `brew test diskutil_completion`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "true"
  end
end
