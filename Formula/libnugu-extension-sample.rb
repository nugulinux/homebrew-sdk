class LibnuguExtensionSample < Formula
  desc "Sample applications for NUGU Extension SDK"
  homepage "https://github.com/nugulinux/nugu-examples"
  url "https://github.com/nugulinux/nugu-examples/archive/518d69c.tar.gz"
  version "1.7.4"
  sha256 "e8cac7f8f55c76a63b14fdad654d1a1d6ee79b95e0a7e4e8a082bdf49bd366c4"
  license "Apache-2.0"

  # brew install --build-from-source --HEAD libnugu-extension-sample
  head "https://github.com/nugulinux/nugu-examples.git", branch: "master"

  bottle do
    root_url "https://github.com/nugulinux/homebrew-sdk/releases/download/libnugu-extension-sample-1.7.4"
    sha256 cellar: :any, arm64_monterey: "db8690be29836d086c07ff2df25b546e27e1573a5eed1ec883111f492a0a8cf6"
    sha256 cellar: :any, monterey:       "081241b77e853f9782cc1a3ed0fc4eb8f89317c088fda26ecfba0c5c1d123271"
    sha256 cellar: :any, big_sur:        "b8ee7fc4531eca4b6292349a3eb7a9e1f2bf1b887ab1f1246f173b5d91b5a1cf"
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
