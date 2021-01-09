Gem::Specification.new do |s|
  s.name        = 'stbimage'
  s.version     = '0.2.3'
  s.date        = '2021-01-09'
  s.summary     = "Bindings for the often used header stb_image.h" 
  s.description = "!Beta Version! Will be developed! So far compatible with: stbi_load, stbi_set_flip_vertically_on_load(). 
  Only works with windows so far!!!!! (win32/win64). PLEASE CHECK OUT THE HOMEPAGE FOR MORE INFO AND EXAMPLE. With 0.2.3 and above dlls are included so 'STBIMAGE.load_lib()'
   should be enough for linking shared liaries. So it's worth to upgrade 0.2.3! "
  s.authors     = ["Samuel Keresztes"]
  s.email       = ''
  s.files       = ["lib/stbimage.rb", "dlls/stbDLL_x64.dll", "dlls/stbDLL_x86.dll", "README.md"]
  s.homepage    = 'https://github.com/fellowchap-samuel/stbimage-ruby'
  s.license       = 'MIT'
end
