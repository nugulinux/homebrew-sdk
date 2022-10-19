require_relative "../lib/GitHubPrivateRepositorySnapshotDownloadStrategy"

class LibnuguExtension < Formula
  desc "C/C++ library for NUGU SDK Extension"
  homepage "https://github.com/nugulinux/nugu-extension"
  # Use URL fragment to prevent brew audit failures for private repository.
  url "https://github.com/webispy/#nugu-extension/archive/d535de3.tar.gz", using: GitHubPrivateRepositorySnapshotDownloadStrategy
  version "1.7.3"
  sha256 "3078091c659fb5d9f2b672b4f6564e64f3faa3f14803cd26e5e1dfcb27803ca5"
  license "Apache-2.0"

  bottle do
    root_url "https://github.com/nugulinux/homebrew-sdk/releases/download/libnugu-extension-1.7.3"
    rebuild 1
    sha256 monterey: "9009a663b30f293db0197bc31ced2d11d008f85dce6540d5ea44115e956f94ad"
    sha256 big_sur:  "97cc90a4eee17be75bdcadd94fb4f44570a905beba5d93385b75873dc50b3bae"
  end

  depends_on "cmake" => :build
  depends_on "pkg-config" => :build
  depends_on "libnugu"
  depends_on "sqlite3"

  def install
    args = %W[
      -DENABLE_LIBRARY_ONLY=ON
      -DENABLE_SYSTEM_STORAGE_DIR=OFF
      -DENABLE_HOME_STORAGE_DIR=ON
      -DMODEL_DIR=#{Formula["libnugu"].share}/nugu/model
      -DPACKAGING=ON
    ]

    system "cmake", "-S", ".", "-B", "build", *args, *std_cmake_args
    system "cmake", "--build", "build"
    system "cmake", "--install", "build"
  end

  test do
    system "true"
  end
end
