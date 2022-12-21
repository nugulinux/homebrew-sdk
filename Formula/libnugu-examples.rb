class LibnuguExamples < Formula
  desc "Example applications for NUGU SDK"
  homepage "https://github.com/nugu-developers/nugu-linux"
  url "https://github.com/nugu-developers/nugu-linux/archive/8b598cf.tar.gz"
  version "1.7.4"
  sha256 "b0d03d292e46b1e44e0acf35d4009c724f8f49aa0aafa1043746d4446965ca42"
  license "Apache-2.0"

  # brew install --build-from-source --HEAD libnugu
  head "https://github.com/nugu-developers/nugu-linux.git", branch: "master"

  bottle do
    root_url "https://github.com/nugulinux/homebrew-sdk/releases/download/libnugu-examples-1.7.3"
    rebuild 2
    sha256 cellar: :any, arm64_monterey: "a9e777c3bd3ec3ecaafe2aa078657e03b25aebc5227f0bfceb507701f21db845"
    sha256 cellar: :any, monterey:       "e84ff05a0c1c31076299f6844fa2573c234532ff9d06b9600a29c0bbd992224c"
    sha256 cellar: :any, big_sur:        "bb5169bcd5eb7d00bae9509ac11116e48e43ce5f37bafd9b2c635ec2cd269848"
  end

  depends_on "cmake" => :build
  depends_on "pkg-config" => :build
  depends_on "libnugu"
  depends_on "libnugu-plugins"

  def install
    args = %W[
      -DENABLE_EXAMPLES_ONLY=ON
      -DPACKAGING=ON
      -DASSET_DIR=#{Formula["libnugu"].share}/nugu
    ]

    system "cmake", "-S", ".", "-B", "build", *args, *std_cmake_args
    system "cmake", "--build", "build"
    system "cmake", "--install", "build"
  end

  test do
    system "true"
  end
end
