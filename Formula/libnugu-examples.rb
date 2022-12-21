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
    root_url "https://github.com/nugulinux/homebrew-sdk/releases/download/libnugu-examples-1.7.4"
    sha256 cellar: :any, arm64_monterey: "b522591f1f606621e8238acaae2a7f672115158b2227bb52fba13e8d7aff2087"
    sha256 cellar: :any, monterey:       "3403c85dc7f0b68d3b9b511fc04962fe6fa1d89feabce251b05a28cc2e791107"
    sha256 cellar: :any, big_sur:        "6fa3f5f6e0a11fdd8dbaf86174aaf70a8b0fe97437c74714c075f48ff2e133cc"
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
