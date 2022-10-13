class Mdbus2 < Formula
  desc "Mickey's DBus Introspection and Interaction Utility V2"
  homepage "https://github.com/webispy/mdbus"
  url "https://github.com/webispy/mdbus/archive/17b0747.tar.gz"
  version "2.3.3"
  sha256 "b8f0afa5a37840c8e38f9b354e4426f57313a4917197a549f18058a6e6b3cc4b"
  license "GPL-2.0-only"

  # brew install --build-from-source --HEAD mdbus2
  head "https://github.com/webispy/mdbus.git", branch: "master"

  bottle do
    root_url "https://github.com/nugulinux/homebrew-sdk/releases/download/mdbus2-2.3.3"
    sha256 cellar: :any, monterey: "31ce02cbff892721fe89275395c7aee4bf25b2ed8e60a6365cd4965f23b9b0a7"
    sha256 cellar: :any, big_sur:  "ae1f85e15747d2ef283f91740f5ac3382545177ac434e1efb1e12248cf35d2ac"
  end

  depends_on "autoconf" => :build
  depends_on "automake" => :build
  depends_on "libtool" => :build
  depends_on "pkg-config" => :build
  depends_on "vala" => :build
  depends_on "glib"

  def install
    system "./autogen.sh", "--prefix=#{prefix}"
    system "make", "install"
  end

  test do
    system "true"
  end
end
