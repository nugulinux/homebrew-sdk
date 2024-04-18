class Libnugu < Formula
  desc "C/C++ library for NUGU SDK"
  homepage "https://github.com/nugu-developers/nugu-linux"
  url "https://github.com/nugu-developers/nugu-linux.git",
      branch: "master"
  version "1.7.5"
  license "Apache-2.0"

  # brew install --build-from-source --HEAD libnugu
  head "https://github.com/nugu-developers/nugu-linux.git", branch: "master"

  bottle do
    root_url "https://github.com/nugulinux/homebrew-sdk/releases/download/libnugu-1.7.4"
    sha256 cellar: :any, arm64_monterey: "7d994415f5c54ea71158b94ad5fe89239f06a7cc2244977f4901d3c63bcbc7d0"
    sha256 cellar: :any, monterey:       "05a579f60808f232fece0fc6cb53c4d14094ac1595ab733271c32218f2d66150"
    sha256 cellar: :any, big_sur:        "3fda690b545862f4527a5988976c9879bb8ceadc6c5ee6010343ef2d00adc2d1"
  end

  depends_on "cmake" => :build
  depends_on "pkg-config" => :build
  depends_on "curl"
  depends_on "glib"
  depends_on "rapidjson"
  depends_on "opus"
  depends_on "libnugu-epd"
  depends_on "libnugu-kwd"
  depends_on "openssl"

  def install
    args = %W[
      -DENABLE_BUILTIN_CURL=OFF
      -DENABLE_GSTREAMER_PLUGIN=OFF
      -DENABLE_GSTREAMER_PLUGIN_VOLUME=OFF
      -DENABLE_VENDOR_LIBRARY=ON
      -DENABLE_BUILTIN_PLUGIN="speex,opus"
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
