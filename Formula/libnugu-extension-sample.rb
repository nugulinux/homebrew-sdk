class LibnuguExtensionSample < Formula
  desc "Sample applications for NUGU Extension SDK"
  homepage "https://github.com/nugulinux/nugu-examples"
  url "https://github.com/nugulinux/nugu-examples/archive/refs/heads/master.tar.gz"
  version "1.7.6"
  sha256 "2c9c18555bdb493901e3c18e5eca70938fb6cbbab2aefa3d7649ddd4645f0063"
  license "Apache-2.0"

  # brew install --build-from-source --HEAD libnugu-extension-sample
  head "https://github.com/nugulinux/nugu-examples.git", branch: "master"

  bottle do
    root_url "https://github.com/nugulinux/homebrew-sdk/releases/download/libnugu-extension-sample-1.7.6"
  end

  depends_on "cmake" => :build
  depends_on "pkg-config" => :build
  depends_on "libnugu-extension"

  def install
    args = %w[
      -DENABLE_NUGU_EXTENSION_SAMPLE=ON
      -DENABLE_NUGU_GUI_SAMPLE=OFF
      -DENABLE_NUGU_AUTH_SAMPLE=OFF
    ]

    system "cmake", "-S", ".", "-B", "build", *args, *std_cmake_args
    system "cmake", "--build", "build"
    system "cmake", "--install", "build"
  end

  test do
    system "true"
  end
end
