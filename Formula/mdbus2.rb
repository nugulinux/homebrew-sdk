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
    rebuild 1
    sha256 cellar: :any, arm64_monterey: "9546c9f69cea7bbe3c2ca5cd0c5b997e3652960efe456c14d2e67b7aae06d903"
    sha256 cellar: :any, monterey:       "0cb66bb9cfffd20808f4713d965a2cdcc8a7b707fb6b97c1eef93eb4daac34dd"
    sha256 cellar: :any, big_sur:        "46118759065a666aa476e82b20f86d1da7b69f547a1c444c8adfba062563521f"
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
