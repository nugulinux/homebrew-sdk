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
    sha256 arm64_sonoma: "0f1c8ef404ce2591fc9abc872cb3cfeaa7bd77ab569ff6e484ac8ec39f800aaf"
    sha256 ventura:      "2e4515dc7e08141b5400f8c2690c3b6827af8cfda828c2e9c4678bf70d55672e"
    sha256 monterey:     "9800f83132e923d341a44ff8e0fe2b5453ba5460bd50a0cbe392f36d8b4d6ef2"
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
