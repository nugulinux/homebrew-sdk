class NuguDaemon < Formula
  desc "Daemon for NUGU service"
  homepage "https://github.com/nugulinux/nugu-daemon"
  url "https://github.com/nugulinux/nugu-daemon/archive/7b99fc6.tar.gz"
  version "1.7.4"
  sha256 "51dbbbbf8296d6401b1cd26a4831acb4341886f000225f5163beec5c11e9d135"
  license "Apache-2.0"

  # brew install --build-from-source --HEAD nugu-daemon
  head "https://github.com/nugulinux/nugu-daemon.git", branch: "master"

  bottle do
    root_url "https://github.com/nugulinux/homebrew-sdk/releases/download/nugu-daemon-1.7.4"
    sha256 arm64_monterey: "08fa3abb9efff7ba7bd9b6d471c1a508d378a1586a0137d619057b2ec7d4c32b"
    sha256 monterey:       "01bb8fe7345a6def0f0bbf75c42c5eba924f8c542568433b17e59b2e1ceacbe2"
    sha256 big_sur:        "83bac0c712fba44839883f24139b9bb2f5613cf2a09b229aca9505cdb2744ffc"
  end

  depends_on "cmake" => :build
  depends_on "pkg-config" => :build
  depends_on "dbus"
  depends_on "libnugu-extension"
  depends_on "libnugu-plugins"
  depends_on "nugu-dbus-daemon"

  def install
    args = %W[
      -DENABLE_PULSEAUDIO=OFF
      -DENABLE_SESSION_BUS=ON
      -DSESSION_BUS_ADDRESS=unix:path=#{HOMEBREW_PREFIX}#{Formula["nugu-dbus-daemon"].sock_path}
    ]

    system "cmake", "-S", ".", "-B", "build", *args, *std_cmake_args
    system "cmake", "--build", "build"
    system "cmake", "--install", "build"
  end

  test do
    system "true"
  end
end
