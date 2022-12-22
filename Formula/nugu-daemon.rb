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
    root_url "https://github.com/nugulinux/homebrew-sdk/releases/download/nugu-daemon-1.7.3"
    rebuild 1
    sha256 arm64_monterey: "ad0b7e017dd0473dc25b55d5e815b99848cd5a6a199fe4c980a24b98ca7468f0"
    sha256 monterey:       "b9bfd385bdf5bf5b02e8697673587a8a9ace947ff928f42d7865a4217240030a"
    sha256 big_sur:        "0fce14b37d76766c56b3e8e5914009774c34ce0b6e3d969da56f25603b81f836"
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
