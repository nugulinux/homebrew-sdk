class LibnuguEpd < Formula
  desc "C/C++ library for NUGU SDK Endpoint detector"
  homepage "https://github.com/nugulinux/nugu-epd"
  url "https://github.com/nugulinux/nugu-epd/releases/download/2.1.11ubuntu5/libnugu-epd-src.tgz"
  sha256 "511ec9b5d08c55689eee7ee72412fb4cb29b87c644edeaf8b88f30cb48298af9"
  license "Apache-2.0"

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
