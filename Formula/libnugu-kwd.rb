class LibnuguKwd < Formula
  desc "C/C++ library for NUGU SDK Keyword detector"
  homepage "https://github.com/nugulinux/nugu-kwd"
  url "https://github.com/nugulinux/nugu-kwd/releases/download/0.9.38ubuntu8/libnugu-kwd-src.tgz"
  sha256 "b2d1e8dd0e3a8afa2c8b4831fe8ee727a727e3be2b5e2e563f4a355ddde8b92c"
  license "Apache-2.0"

  bottle do
    root_url "https://github.com/nugulinux/homebrew-sdk/releases/download/libnugu-kwd-0.9.38"
    rebuild 2
    sha256 cellar: :any, arm64_monterey: "3509bc5b7f2ba8dbe71ef3a3293b4430d59577b958190871daea4e5d3629ff1d"
    sha256 cellar: :any, monterey:       "445540b9abb048215b6d68c8ef6d6e92aab0b32f202c76ae0fefc84ef6ddacaa"
    sha256 cellar: :any, big_sur:        "c7742ebd95888852ab5a1e1ef0bf4380f4a9cd0ccc8c274c0446aa4f4694663f"
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
