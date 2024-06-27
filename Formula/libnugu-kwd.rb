class LibnuguKwd < Formula
  desc "C/C++ library for NUGU SDK Keyword detector"
  homepage "https://github.com/nugulinux/nugu-kwd"
  url "https://github.com/nugulinux/nugu-kwd/releases/download/0.9.38ubuntu6/libnugu-kwd-src.tgz"
  sha256 "ad524e18328dde5f07381cfad56a62a03f11108db3696a7d1f72e7996e8257aa"
  license "Apache-2.0"

  bottle do
    root_url "https://github.com/nugulinux/homebrew-sdk/releases/download/libnugu-kwd-0.9.38"
    sha256 cellar: :any, arm64_sonoma: "4c9a0610d2e4d9d88b1cd0c3a1c33006376a1e700ddc6ce51a5c84199454d2f9"
    sha256 cellar: :any, ventura:      "fbb40b8dcd4236a1955bd6dd3be4109086cc57f1583764ef23ce60ba2e38a85b"
    sha256 cellar: :any, monterey:     "ef6e608706191d85d7fefabdfb21e7da421c246b618a2fe5453af2252b493be7"
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
