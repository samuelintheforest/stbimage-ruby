# stbimage-ruby
Binding of stb-image into the ruby programing language.

# Tutorials

1. To use this gem first install it with:
`gem install stbimage`
2. Require it in your project with\
`require 'stbimage'`
3. Load your dll dynamic libary what is in your projects root folder!!! (Download the dlls: visit my webpage.)\
`STBIMAGE.load_lib()`
4. Then you can use it :D

# About the dll libs

You can find it under [dlls](dlls) folder

# A full Example:

```ruby
require 'stb_image'

# Note that you need to name your dll file to stbDLL.dll in this case
STBIMAGE.load_lib() 
# Or if you want to specify another name for it, use: 
# STBIMAGE.load_lib(your_name.dll)

# But don't forget that ruby searches your dll file in your current directory!

width = ' ' * 4
height = ' ' * 4
nr_channels = ' ' * 4

data = STBIMAGE.stbi_load("blue-poly.jpg", width, height, nr_channels, 0)

puts data

puts width.unpack('l')[0]
puts height.unpack('l')[0]
puts nr_channels.unpack('l')[0]
```

# Credit

Credit to Vaiorabbit who made the bindings of opengl into ruby! This wrapper is based on his glfw wrapper. :D \
His repo: https://github.com/vaiorabbit/ruby-opengl
