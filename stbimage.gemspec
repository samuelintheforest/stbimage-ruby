Gem::Specification.new do |s|
  s.name        = 'stbimage'
  s.version     = '0.4.0'
  s.date        = '2021-01-09'
  s.summary     = "Bindings for the often used header stb_image.h" 
  s.description = "!Beta Version! A practical image importer/loader. It wraps stb_image.h (ver:2.26 -2020.07.13-). Supported image formats are: JPEG, PNG, TGA, BMP, PSD, GIF(not animation), HDR, PIC, PNM. Only works well with windows so far (win32/win64), but linux/macOs users also can use it. Checkout the Homepage for more info (installation, usage and other information)"
  s.authors     = ["Samuel Keresztes"]
  s.email       = ''
  s.files       = ["lib/stbimage.rb", "dlls/stbDLL_x64.dll", "dlls/stbDLL_x86.dll", "README.md", "utils/system_check.rb"]
  s.homepage    = 'https://github.com/fellowchap-samuel/stbimage-ruby'
  s.license       = 'MIT'
end
