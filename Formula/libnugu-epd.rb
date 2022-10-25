class LibnuguEpd < Formula
  desc "C/C++ library for NUGU SDK Endpoint detector"
  homepage "https://github.com/nugulinux/nugu-epd"
  url "https://github.com/nugulinux/nugu-epd/releases/download/2.1.11ubuntu5/libnugu-epd-src.tgz"
  sha256 "511ec9b5d08c55689eee7ee72412fb4cb29b87c644edeaf8b88f30cb48298af9"
  license "Apache-2.0"

  bottle do
    root_url "https://github.com/nugulinux/homebrew-sdk/releases/download/libnugu-epd-2.1.11"
    rebuild 1
    sha256 cellar: :any, arm64_monterey: "62a9c42ea25e72af999f8616063ad777b161685b576047bf0e4cd6623fc706a3"
    sha256 cellar: :any, monterey:       "427ab6a4168c79357a81359c4fac7b6fdfd6c8b1f02527e0d04620aed20387c6"
    sha256 cellar: :any, big_sur:        "512be825bfaad1bbd544f799ae9d63e556f1ef9cbf693d4aeb942714c7e15899"
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
