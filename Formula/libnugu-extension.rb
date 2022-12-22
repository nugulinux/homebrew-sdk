require_relative "../lib/GitHubPrivateRepositorySnapshotDownloadStrategy"

class LibnuguExtension < Formula
  desc "C/C++ library for NUGU SDK Extension"
  homepage "https://github.com/nugulinux/nugu-extension"
  # Use URL fragment to prevent brew audit failures for private repository.
  url "https://github.com/nugulinux/#nugu-extension/archive/f23633a.tar.gz", using: GitHubPrivateRepositorySnapshotDownloadStrategy
  version "1.7.4"
  sha256 "8f3d222b69db2dfd9d7d90d238c8fbc25d657e6baa753e804b4e20ff0c979f40"
  license "Apache-2.0"

  bottle do
    root_url "https://github.com/nugulinux/homebrew-sdk/releases/download/libnugu-extension-1.7.4"
    sha256 arm64_monterey: "0c5198bce069c4d83edf0a0eabba1f38c7e71f00485b5832b956be113b31572d"
    sha256 monterey:       "f3b17e067b9ca151b54c1de143fcbfdcc08c36ef61a388bf9a84844610b1df9d"
    sha256 big_sur:        "d0b1ef5fcfbe17da5ef1295f4d8ba7dbcd9d977ba81ce9ba2f4d61161b4ed95b"
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
