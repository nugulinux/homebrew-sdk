class Libnugu < Formula
  desc "C/C++ library for NUGU SDK"
  homepage "https://github.com/nugu-developers/nugu-linux"
  url "https://github.com/nugu-developers/nugu-linux/archive/8b598cf.tar.gz"
  version "1.7.4"
  sha256 "b0d03d292e46b1e44e0acf35d4009c724f8f49aa0aafa1043746d4446965ca42"
  license "Apache-2.0"

  # brew install --build-from-source --HEAD libnugu
  head "https://github.com/nugu-developers/nugu-linux.git", branch: "master"

  bottle do
    root_url "https://github.com/nugulinux/homebrew-sdk/releases/download/libnugu-1.7.3"
    rebuild 2
    sha256 cellar: :any, arm64_monterey: "a93fcc19aef6aad3b4e1d73ae73ee62b8294551134ec2801e8f9c19ab20ce123"
    sha256 cellar: :any, monterey:       "4bc797184770ff0f23f8521497485957563e1d6296ef97da2d323003eaaeeecd"
    sha256 cellar: :any, big_sur:        "16bb3640a549b397935d0d9c100dd30c335e3b0a3e4ec213100ec77640b7e381"
  end

  depends_on "cmake" => :build
  depends_on "pkg-config" => :build
  depends_on "curl"
  depends_on "glib"
  depends_on "jsoncpp"
  depends_on "libnugu-epd"
  depends_on "libnugu-kwd"
  depends_on "openssl"

  def install
    args = %W[
      -DENABLE_LIBRARY_ONLY=ON
      -DENABLE_BUILTIN_JSONCPP=OFF
      -DENABLE_BUILTIN_CURL=OFF
      -DENABLE_GSTREAMER_PLUGIN=OFF
      -DPLUGIN_DIR=#{HOMEBREW_PREFIX}/lib/nugu
      -DPACKAGING=ON
    ]

    system "cmake", "-S", ".", "-B", "build", *args, *std_cmake_args
    system "cmake", "--build", "build"
    system "cmake", "--install", "build"
  end

  test do
    system "true"
  end
end
