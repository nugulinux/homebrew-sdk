class Libnugu < Formula
  desc "C/C++ library for NUGU SDK"
  homepage "https://github.com/nugu-developers/nugu-linux"
  url "https://github.com/nugu-developers/nugu-linux.git",
    tag:      "v1.7.6",
    revision: "06461dbf3e6cdbc94d47a80412290a449c0dc5fc"
  license "Apache-2.0"

  # brew install --build-from-source --HEAD libnugu
  head "https://github.com/nugu-developers/nugu-linux.git", branch: "master"

  bottle do
    root_url "https://github.com/nugulinux/homebrew-sdk/releases/download/libnugu-1.7.6"
    sha256 arm64_sonoma: "3387358163596ceb62471bd30cc2df079cf3ecf68f8fd75e88df068275fa13d9"
    sha256 ventura:      "afb89a15a6d92857ca5336d898d9cf3fe27a764ff0963786073483fc481ea716"
    sha256 monterey:     "745bff1f492f482bb2d3e4450942ea8f1a4af5a1323af6574ab59916ed90a2c8"
  end

  depends_on "cmake" => :build
  depends_on "pkg-config" => :build
  depends_on "curl"
  depends_on "glib"
  depends_on "gstreamer"
  depends_on "libnugu-epd"
  depends_on "libnugu-kwd"
  depends_on "openssl"
  depends_on "opus"
  depends_on "rapidjson"

  def install
    args = %W[
      -DENABLE_BUILTIN_CURL=OFF
      -DPLUGIN_DIR=#{lib}/nugu
      -DPACKAGING=ON
      -DCMAKE_INSTALL_RPATH=#{rpath}
    ]

    system "cmake", "-S", ".", "-B", "build", *args, *std_cmake_args
    system "cmake", "--build", "build"
    system "cmake", "--install", "build"
  end

  test do
    system "true"
  end
end
