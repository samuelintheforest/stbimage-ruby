Gem::Specification.new do |s|
  s.name        = 'stbimage'
  s.version     = '0.5.1'
  s.date        = '2021-01-09'
  s.summary     = "Bindings for the often used header stb_image.h" 
  s.description = "!Beta Version! A practical image importer/loader. It wraps stb_image.h (ver:2.26 -2020.07.13-). Supported image formats are: JPEG, PNG, TGA, BMP, PSD, GIF(not animation), HDR, PIC, PNM. Only works well with windows (win32/win64) and with linux so far, but for macOS, users have to include . Checkout the Homepage for more info (installation, usage and other information)"
  s.authors     = ["Samuel Keresztes"]
  s.email       = ''
  s.files       = ["lib/stbimage.rb", "dlls/stbDLL_x64.dll", "dlls/libstb_x86.so", "dlls/libstb_x64.so", "dlls/libstb_arm.so", "dlls/stbDLL_x86.dll", "README.md", "utils/system_check.rb"]
  s.homepage    = 'https://github.com/fellowchap-samuel/stbimage-ruby'
  s.license       = 'MIT'
end
