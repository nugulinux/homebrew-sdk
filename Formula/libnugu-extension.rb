require_relative "../lib/GitHubPrivateRepositorySnapshotDownloadStrategy"

class LibnuguExtension < Formula
  desc "C/C++ library for NUGU SDK Extension"
  homepage "https://github.com/nugulinux/nugu-extension"
  # Use URL fragment to prevent brew audit failures for private repository.
  url "https://github.com/nugulinux/#nugu-extension/archive/refs/tags/v1.7.6.tar.gz", using: GitHubPrivateRepositorySnapshotDownloadStrategy
  sha256 "c78e0352a399cd59c0f1eb8d5b7a7082e24ec8cc773b21f1d60bb0ee83e139e1"
  license "Apache-2.0"

  bottle do
    root_url "https://github.com/nugulinux/homebrew-sdk/releases/download/libnugu-extension-1.7.6"
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
