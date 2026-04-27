class Smali < Formula
  desc "Program to disassemble Android dex code"
  homepage "https://github.com/AbdullahRafsan/homebrew-brewtap"
  url "https://github.com/AbdullahRafsan/homebrew-brewtap/raw/refs/heads/main/smali.zip"
  version "2.5.2"
  sha256 "c1cde6330f43ab2ad17a5da8cc066f043cf323005a9c2337accc50e452f19a9e"
  license "MIT"

  depends_on "openjdk"

  def install
    # Remove unrecognized options if they cause configure to fail
    # https://docs.brew.sh/rubydoc/Formula.html#std_configure_args-instance_method
    # system "./configure", "--disable-silent-rules", *std_configure_args
    # system "cmake", "-S", ".", "-B", "build", *std_cmake_args
    prefix.install "smali", "baksmali", "smali.jar", "baksmali.jar"
    bin.install "#{prefix}/smali"
    bin.install "#{prefix}/baksmali"
  end

  test do
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system bin/"program", "do", "something"`.
    system "smali -v"
    system "baksmali -v"
  end
end
