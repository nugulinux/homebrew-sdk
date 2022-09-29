class LibnuguKwd < Formula
  desc "C/C++ library for NUGU SDK Keyword detector"
  homepage "https://github.com/nugulinux/nugu-kwd"
  url "https://github.com/nugulinux/nugu-kwd/releases/download/0.9.38ubuntu6/libnugu-kwd-src.tgz"
  sha256 "ad524e18328dde5f07381cfad56a62a03f11108db3696a7d1f72e7996e8257aa"
  license "Apache-2.0"

  bottle do
    root_url "https://github.com/nugulinux/homebrew-sdk/releases/download/libnugu-kwd-0.9.38"
    sha256 cellar: :any, monterey: "57fa45b4f69ac890fee77db2c01528b3bcd1ae603831f323a6de3f64367d9a5b"
    sha256 cellar: :any, big_sur:  "685adeb8d3f9268f53e12f071ddaa49bce16bde99a29c46c0591e42a376f30f6"
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
