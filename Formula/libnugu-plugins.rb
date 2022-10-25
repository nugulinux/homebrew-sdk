class LibnuguPlugins < Formula
  desc "Default plugins for NUGU SDK"
  homepage "https://github.com/nugu-developers/nugu-linux"
  url "https://github.com/nugu-developers/nugu-linux/archive/742ca26.tar.gz"
  version "1.7.3"
  sha256 "b5d74620bd33f27118e3c30a5c27838a3b43e434b8640b58c6fef4674f6e6cd7"
  license "Apache-2.0"

  # brew install --build-from-source --HEAD libnugu
  head "https://github.com/nugu-developers/nugu-linux.git", branch: "master"

  bottle do
    root_url "https://github.com/nugulinux/homebrew-sdk/releases/download/libnugu-plugins-1.7.3"
    rebuild 2
    sha256 cellar: :any, arm64_monterey: "4b9b294222215de9d04090c22726b88a4d58ed2c96862646df21d228ced385d6"
    sha256 cellar: :any, monterey:       "96a91d7e1e42b003e3236b6354f5fc2c0b9dc756faea57d8fca82bd3b17fb345"
    sha256 cellar: :any, big_sur:        "32ed4141969d0c1bcc41f2217e7d6bcc2eb4aaad2938e30cc22556a1aafe2354"
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
