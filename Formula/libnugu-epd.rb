class LibnuguEpd < Formula
  desc "C/C++ library for NUGU SDK Endpoint detector"
  homepage "https://github.com/nugulinux/nugu-epd"
  url "https://github.com/nugulinux/nugu-epd/releases/download/2.1.11ubuntu6/libnugu-epd-src.tgz"
  sha256 "66b422cc5043ddc30eccb14741bddc8cde11da67c72ba07938df2d86f8ea2824"
  license "Apache-2.0"

  bottle do
    root_url "https://github.com/nugulinux/homebrew-sdk/releases/download/libnugu-epd-2.1.11"
    rebuild 2
    sha256 cellar: :any, arm64_monterey: "237d2e7b0bdb2e8d0ba48853a75489100160eb8e562f90474543df302afb3d24"
    sha256 cellar: :any, monterey:       "6ee8808cf89521ea45d36b2667b0c4b250e1728258018d763c4767be41908245"
    sha256 cellar: :any, big_sur:        "60adf9932b8e3cf9542989998f02be1658732ae8bde4d35dbf925ca57485f2d6"
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
