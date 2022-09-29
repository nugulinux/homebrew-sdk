class LibnuguPlugins < Formula
  desc "Default Plugins for NUGU SDK"
  homepage "https://github.com/nugu-developers/nugu-linux"
  url "https://github.com/nugu-developers/nugu-linux/archive/742ca26.tar.gz"
  version "1.7.3"
  sha256 "b5d74620bd33f27118e3c30a5c27838a3b43e434b8640b58c6fef4674f6e6cd7"
  license "Apache-2.0"

  # brew install --build-from-source --HEAD libnugu
  head "https://github.com/nugu-developers/nugu-linux.git", branch: "master"

  bottle do
    root_url "https://github.com/nugulinux/homebrew-sdk/releases/download/libnugu-plugins-1.7.3"
    rebuild 1
    sha256 cellar: :any, monterey: "517c0e5c642b54d3139e74a009634b403ce2ae39f3d1f67930bcae9474fbb0d8"
    sha256 cellar: :any, big_sur:  "3bfe230e4e4077b7f1a81e8834965b4ffbc161e222918ca2580f289feef01bd6"
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
