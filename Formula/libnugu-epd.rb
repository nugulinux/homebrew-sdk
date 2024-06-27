class LibnuguEpd < Formula
  desc "C/C++ library for NUGU SDK EndPoint detector"
  homepage "https://github.com/nugulinux/nugu-epd"
  url "https://github.com/nugulinux/nugu-epd/releases/download/2.1.11ubuntu7/libnugu-epd-src.tgz"
  sha256 "99ad543858eda0d68d89ffbe923f79d6d6480b072750127a8e96dde4590a8677"
  license "Apache-2.0"

  bottle do
    root_url "https://github.com/nugulinux/homebrew-sdk/releases/download/libnugu-epd-2.1.11"
    sha256 cellar: :any, arm64_sonoma: "0f5de6435d421e20fc2c3364a9050a566a169d09a99788ad48202c551b37ba20"
    sha256 cellar: :any, ventura:      "e85f247e6e45b3abf353a3fd33a34c4a8c2546d5a025db014ff79cdba8d8f80d"
    sha256 cellar: :any, monterey:     "46bf9fa9d0d1c6b2d8c8c28059689cd72c766927c2b017b2bbf3cea482a7c121"
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
