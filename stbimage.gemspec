Gem::Specification.new do |s|
  s.name        = 'stbimage'
  s.version     = '0.6.0'
  s.date        = '2021-01-11'
  s.summary     = "Bindings for the often used header stb_image.h" 
  s.description = "!Beta Version! A practical image importer/loader. It wraps stb_image.h (ver:2.26 -2020.07.13-). Supported image formats are: JPEG, PNG, TGA, BMP, PSD, GIF(not animation), HDR, PIC, PNM. Checkout the Homepage for usage in Windows, MacOs, Linux or ARM"
  s.authors     = ["Samuel Keresztes"]
  s.email       = ''
  s.files       = ["lib/stbimage.rb", "stb-source/stb_image.c", "stb-source/stb_image.h", "dlls/stbDLL_x64.dll", "dlls/libstb_x86.so", "dlls/libstb_x64.so", "dlls/libstb_arm.so", "dlls/stbDLL_x86.dll", "README.md", "utils/system_check.rb"]
  s.homepage    = 'https://github.com/fellowchap-samuel/stbimage-ruby'
  s.license       = 'MIT'
end
