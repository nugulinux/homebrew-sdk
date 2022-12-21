class LibnuguKwd < Formula
  desc "C/C++ library for NUGU SDK Keyword detector"
  homepage "https://github.com/nugulinux/nugu-kwd"
  url "https://github.com/nugulinux/nugu-kwd/releases/download/0.9.38ubuntu8/libnugu-kwd-src.tgz"
  sha256 "b2d1e8dd0e3a8afa2c8b4831fe8ee727a727e3be2b5e2e563f4a355ddde8b92c"
  license "Apache-2.0"

  bottle do
    root_url "https://github.com/nugulinux/homebrew-sdk/releases/download/libnugu-kwd-0.9.38"
    rebuild 1
    sha256 cellar: :any, arm64_monterey: "79b09bc6d80a6c46d7918c0b159cddbc8bd4fef26c7eb1ee93fc4feeff1e6708"
    sha256 cellar: :any, monterey:       "9185425e8b3d1cef7ae58611875023bd28991bcf316458d90b29429a091af00d"
    sha256 cellar: :any, big_sur:        "c2efc523780b121cb602f3451a9d84a24a69216a3cf679de29388b41bc7e9a3c"
  end

  depends_on "cmake" => :build

  def install
    system "cmake", "-S", ".", "-B", "build", *std_cmake_args
    system "cmake", "--build", "build"
    system "cmake", "--install", "build"
  end

  test do
    system "true"
  end
end
