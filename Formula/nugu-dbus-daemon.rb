class NuguDbusDaemon < Formula
  desc "SESSION_BUS based dbus-daemon for NUGU service"
  homepage "https://github.com/nugulinux/nugu-daemon"
  url "https://github.com/nugulinux/nugu-daemon/archive/3c2c624.tar.gz"
  version "1.7.4"
  sha256 "9bd7b933a4c1ea2b906362dfd47091640740345ddbed3c5528a38ed0117ef06c"
  license "Apache-2.0"

  bottle do
    root_url "https://github.com/nugulinux/homebrew-sdk/releases/download/nugu-dbus-daemon-1.7.4"
    sha256 cellar: :any_skip_relocation, arm64_monterey: "5e6c07101deb81cbcffd222be2671d397ea9d33b6f565591fc08a6d83c1e52dd"
    sha256 cellar: :any_skip_relocation, monterey:       "53f94d0e33dbe588aa35f84e7fffe9593bcc7233645434c548b1feecfc99c827"
    sha256 cellar: :any_skip_relocation, big_sur:        "c0054bb91a7937767690d0738dacffd1a9d8135b3badde48c221242403a02ceb"
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
