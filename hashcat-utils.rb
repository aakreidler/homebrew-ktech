# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://www.rubydoc.info/github/Homebrew/brew/master/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class HashcatUtils < Formula
  desc "Hashcat Utils"
  homepage "https://github.com/hashcat/hashcat-utils"
  url "https://github.com/hashcat/hashcat-utils/archive/v1.9.tar.gz"
  version "1.9"
  sha256 "9ddda7f9dfeebfde95b2e980241730262a7f512ceb37941c38b590721d6b6921"
  # depends_on "cmake" => :build
  depends_on "rename" => :build

  def install
    # ENV.deparallelize  # if your formula fails when building in parallel
    # Remove unrecognized options if warned by configure
    # system "./configure", "--disable-debug",
    #                       "--disable-dependency-tracking",
    #                       "--disable-silent-rules",
    #                       "--prefix=#{prefix}"
    # system "cmake", ".", *std_cmake_args
	system "cd src && make"
	system "mv src/*.bin bin"
	system "rename -d .bin bin/*.bin"
	bin.install Dir["bin/*"]
	# , "install" # if this fails, try separate make/make install steps
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! For Homebrew/homebrew-core
    # this will need to be a test that verifies the functionality of the
    # software. Run the test with `brew test hashcat-utils`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "false"
  end
end
