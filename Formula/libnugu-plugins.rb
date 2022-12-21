class LibnuguPlugins < Formula
  desc "Default plugins for NUGU SDK"
  homepage "https://github.com/nugu-developers/nugu-linux"
  url "https://github.com/nugu-developers/nugu-linux/archive/8b598cf.tar.gz"
  version "1.7.4"
  sha256 "b0d03d292e46b1e44e0acf35d4009c724f8f49aa0aafa1043746d4446965ca42"
  license "Apache-2.0"

  # brew install --build-from-source --HEAD libnugu
  head "https://github.com/nugu-developers/nugu-linux.git", branch: "master"

  bottle do
    root_url "https://github.com/nugulinux/homebrew-sdk/releases/download/libnugu-plugins-1.7.4"
    sha256 cellar: :any, arm64_monterey: "c0353739de0973ae7f0ecb987023564cf64548ad7320479596ef1a50164370ca"
    sha256 cellar: :any, monterey:       "45e760372a2e8442845a84e031884b86c1a550a73908856ebda127698b0057e2"
    sha256 cellar: :any, big_sur:        "3f6ddfba596880d92b503954203d459cf83799c0e5506aa61b444d3902761298"
  end

  depends_on "cmake" => :build
  depends_on "pkg-config" => :build
  depends_on "gst-plugins-bad"
  depends_on "gst-plugins-base"
  depends_on "gst-plugins-good"
  depends_on "gstreamer"
  depends_on "libnugu"
  depends_on "libnugu-epd"
  depends_on "gst-plugins-ugly" => :recommended

  def install
    args = %w[
      -DENABLE_PLUGINS_ONLY=ON
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
