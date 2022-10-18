class NuguDbusDaemon < Formula
  desc "SESSION_BUS based dbus-daemon for NUGU service"
  homepage "https://github.com/nugulinux/nugu-daemon"
  url "https://github.com/nugulinux/nugu-daemon/archive/3c2c624.tar.gz"
  version "1.7.3"
  sha256 "9bd7b933a4c1ea2b906362dfd47091640740345ddbed3c5528a38ed0117ef06c"
  license "Apache-2.0"

  bottle do
    root_url "https://github.com/nugulinux/homebrew-sdk/releases/download/nugu-dbus-daemon-1.7.3"
    sha256 cellar: :any_skip_relocation, monterey: "741fe02d22cf1bf79923c617d5334290979c5c080705648960296535beb004f0"
    sha256 cellar: :any_skip_relocation, big_sur:  "fda23d78067f4decc277f31411b01fa4f030df566b023058e75408f7e8e82193"
  end

  depends_on "cmake" => :build
  depends_on "dbus"

  def install
    args = %W[
      -DHOMEBREW_PREFIX=#{HOMEBREW_PREFIX}
      -DDBUS_PATH=#{Formula["dbus"].bin}
      -DSOCKET_PATH=#{sock_path}
    ]

    system "cmake", "-S", ".", "-B", "build", *args, *std_cmake_args
    prefix.install "build/com.sktnugu.nugu_dbus_daemon.plist"
  end

  def plist_name
    "com.sktnugu.nugu_dbus_daemon"
  end

  def sock_path
    "/var/run/nugu_dbus_daemon.sock"
  end

  def caveats
    <<~EOS
      To use dbus session bus, add the following to your .zshrc:

        export DBUS_SESSION_BUS_ADDRESS=unix:path=#{HOMEBREW_PREFIX}#{sock_path}
    EOS
  end

  plist_options startup: true

  test do
    system "true"
  end
end
