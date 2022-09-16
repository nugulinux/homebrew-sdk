class Libnugu < Formula
  desc "C/C++ library for NUGU SDK"
  homepage "https://github.com/nugu-developers/nugu-linux"
  url "https://github.com/nugu-developers/nugu-linux/archive/a5bffd0.tar.gz"
  version "1.7.3"
  sha256 "1d7846706201448156b9a6ba38535dcae6b785cc96ccd102f6da40b91052065b"
  license "Apache-2.0"

  # brew install --build-from-source --HEAD libnugu
  head "https://github.com/nugu-developers/nugu-linux.git", branch: "master"

  bottle do
    root_url "https://github.com/nugulinux/homebrew-sdk/releases/download/libnugu-1.7.3"
    sha256 cellar: :any, monterey: "23f0e53943bb303d36d4bd4d063ef4d46f7e3aef61981ce1f88fe663661f729c"
    sha256 cellar: :any, big_sur:  "b8915ce16a952c2c2ca97800a4eff5b24c7d573b2948a818baab6dd7aa912189"
  end

  depends_on "cmake" => :build
  depends_on "pkg-config" => :build
  depends_on "curl"
  depends_on "glib"
  depends_on "jsoncpp"
  depends_on "openssl"

  def install
    args = %W[
      -DENABLE_VENDOR_LIBRARY=OFF
      -DENABLE_LIBRARY_ONLY=ON
      -DENABLE_BUILTIN_JSONCPP=OFF
      -DENABLE_BUILTIN_CURL=OFF
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
