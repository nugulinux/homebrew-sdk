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
    sha256 monterey: "86a1ee6d6d4e06f7c893f2a4b0fe6cf8643e3800b133d8b54452ce9be48c4fe9"
    sha256 big_sur:  "8ffbe876b94351e1eb6647e644bd2bc2e892e915bb07e63d06a15499d46de9ec"
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
