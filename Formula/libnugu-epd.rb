class LibnuguEpd < Formula
  desc "C/C++ library for NUGU SDK EndPoint detector"
  homepage "https://github.com/nugulinux/nugu-epd"
  url "https://github.com/nugulinux/nugu-epd/releases/download/2.1.11ubuntu7/libnugu-epd-src.tgz"
  sha256 "99ad543858eda0d68d89ffbe923f79d6d6480b072750127a8e96dde4590a8677"
  license "Apache-2.0"

  bottle do
    root_url "https://github.com/nugulinux/homebrew-sdk/releases/download/libnugu-epd-2.1.11"
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
