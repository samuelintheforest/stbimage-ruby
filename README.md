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

# use this to load the dll (from gem version 0.2.3 and above)!
STBIMAGE.load_lib() 

# Or if you want to specify another name for it, use: 
# STBIMAGE.load_lib('your_name.dll')

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

# Licence

MIT License

Copyright (c) 2021 Samuel Keresztes

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

