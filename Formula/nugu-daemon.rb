class NuguDaemon < Formula
  desc "Daemon for NUGU service"
  homepage "https://github.com/nugulinux/nugu-daemon"
  url "https://github.com/nugulinux/nugu-daemon/archive/fc4b05c.tar.gz"
  version "1.7.3"
  sha256 "26e7376ba6e50517c3b331934c14c77cdf8fcb5ac71831218e4985e41dac691b"
  license "Apache-2.0"

  # brew install --build-from-source --HEAD nugu-daemon
  head "https://github.com/nugulinux/nugu-daemon.git", branch: "master"

  bottle do
    root_url "https://github.com/nugulinux/homebrew-sdk/releases/download/nugu-daemon-1.7.3"
    sha256 monterey: "9ab017eeeb61d058b38874071af0134238b504ed3f854d886a175dc1824cfe7d"
    sha256 big_sur:  "9dc9ca3e32ca29cab94b19a7231ed6690b9cae40d6381ea1ca15a39bd1d199f7"
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
