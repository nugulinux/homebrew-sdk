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
    sha256 cellar: :any, arm64_sonoma: "f30c02f3dc4dde12517b508d6a695ee20270aa285cb4f65659c3028f77f99e67"
    sha256 cellar: :any, ventura:      "4fdbc4e9273f79e1043073afe23093800014dd8bff0f3d693da2ad8263008e38"
    sha256 cellar: :any, monterey:     "eb99abd8be9d7b5115d2d3b2e5020f80ba9b712781b6dc03f7fa07a47f266aad"
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
