class LibnuguEpd < Formula
  desc "C/C++ library for NUGU SDK Endpoint detector"
  homepage "https://github.com/nugulinux/nugu-epd"
  url "https://github.com/nugulinux/nugu-epd/releases/download/2.1.11ubuntu5/libnugu-epd-src.tgz"
  sha256 "511ec9b5d08c55689eee7ee72412fb4cb29b87c644edeaf8b88f30cb48298af9"
  license "Apache-2.0"

  bottle do
    root_url "https://github.com/nugulinux/homebrew-sdk/releases/download/libnugu-epd-2.1.11"
    sha256 cellar: :any, monterey: "3143873069c44ed5bbe8a6dc8e96b284f65b70b75fdd0e11af11efcf275cc872"
    sha256 cellar: :any, big_sur:  "ff45d9e4fec9549de3c29298ccbb8687ca7620463c4686a73bd6b04477e9bd90"
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
