class LibnuguExtensionSample < Formula
  desc "Sample applications for NUGU Extension SDK"
  homepage "https://github.com/nugulinux/nugu-examples"
  url "https://github.com/nugulinux/nugu-examples/archive/264226c.tar.gz"
  version "1.7.3"
  sha256 "39d02ca3b8ddf5743b50deee7bb17eb83b0b40c281e9edc1093bb9bce8fc0d50"
  license "Apache-2.0"

  # brew install --build-from-source --HEAD libnugu-extension-sample
  head "https://github.com/nugulinux/nugu-examples.git", branch: "master"

  bottle do
    root_url "https://github.com/nugulinux/homebrew-sdk/releases/download/libnugu-extension-sample-1.7.3"
    rebuild 1
    sha256 cellar: :any, arm64_monterey: "44230f290575f56e4e6a74d3156027d49531baacf42e00b001d64dc7bad4e858"
    sha256 cellar: :any, monterey:       "f51bf41b2c0c7c1af449f6b00fda478167011a571334d8a5aed06fdafbe4d034"
    sha256 cellar: :any, big_sur:        "b5716ecd8a95d299cdc115c9340c51838f9ec1be72e025a68f027b5d07024cf2"
  end

  depends_on "cmake" => :build
  depends_on "pkg-config" => :build
  depends_on "libnugu-extension"
  depends_on "libnugu-plugins"

  def install
    args = %w[
      -DENABLE_NUGU_EXTENSION_SAMPLE=ON
      -DENABLE_NUGU_GUI_SAMPLE=OFF
    ]

    system "cmake", "-S", ".", "-B", "build", *args, *std_cmake_args
    system "cmake", "--build", "build"
    system "cmake", "--install", "build"
  end

  test do
    system "true"
  end
end
