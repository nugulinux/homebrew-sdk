class LibnuguPlugins < Formula
  desc "Default Plugins for NUGU SDK"
  homepage "https://github.com/nugu-developers/nugu-linux"
  url "https://github.com/nugu-developers/nugu-linux/archive/a5bffd0.tar.gz"
  version "1.7.3"
  sha256 "1d7846706201448156b9a6ba38535dcae6b785cc96ccd102f6da40b91052065b"
  license "Apache-2.0"

  # brew install --build-from-source --HEAD libnugu
  head "https://github.com/nugu-developers/nugu-linux.git", branch: "master"

  bottle do
    root_url "https://github.com/nugulinux/homebrew-sdk/releases/download/libnugu-plugins-1.7.3"
    sha256 cellar: :any, monterey: "7ca0a72d8d8dfad2522e7f70074052c2f61b72833f99498f286c39140d0aa72f"
    sha256 cellar: :any, big_sur:  "c1da7b0e0690a8dedbdc38a34166e0f76594c6490b1e34ce7a54c829d9c01956"
  end

  depends_on "cmake" => :build
  depends_on "pkg-config" => :build
  depends_on "gst-plugins-bad"
  depends_on "gst-plugins-good"
  depends_on "gstreamer"
  depends_on "libnugu"
  depends_on "gst-plugins-ugly" => :recommended

  def install
    args = %w[
      -DENABLE_VENDOR_LIBRARY=OFF
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
