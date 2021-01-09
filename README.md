# STBIMAGE     



Ruby binding of stb-image.h

**Works well on windows!!!**
**Added support for Linux (32, 64, arm)**

* ### Supports (so far): ###  
  <br>
  
  * **stbi_load** (Default image loader)
  * **stbi_load_16**
  * **stbi_loadf** (For `.hdr` images)
  * **stbi_info**
  * **stbi_image_free**
  * **stbi_failure_reason**
  * **stbi_set_flip_vertically_on_load**
  * **stbi_set_flip_vertically_on_load_thread**
  * **stbi_set_unpremultiply_on_load**
  * **stbi_convert_iphone_png_to_rgb**
  * **stbi_hdr_to_ldr_gamma**
  * **stbi_hdr_to_ldr_scale**
  * **stbi_is_16_bit**
  * **stbi_is_hdr**
  * **stbi_zlib_decode_buffer**
  * **stbi_zlib_decode_malloc**
  * **stbi_zlib_decode_malloc_guesssize**
  * **stbi_zlib_decode_malloc_guesssize_headerflag**
  * **stbi_zlib_decode_noheader_buffer**
  * **stbi_zlib_decode_noheader_malloc**


<br>

# Installation

* Windows:\
`gem install stbimage`

* Linux/macOs:\
`gem install stbimage`

*Note: In macOs you have to compile the dynamic libary (.so) yourself. Although I planned to include it in the future*

<br>

# .dll libs

You can find it under [dlls](dlls) folder

<br>

# Usage

```ruby
require 'stbimage'

# use this to load the dll (from gem version 0.2.3 and above)! Only For windows and linux yet
STBIMAGE.load_lib() 

# In macOs you have to provide a dynamic libary (.so) by yourself
# STBIMAGE.load_lib('your_name.so', 'absolute_path_to_file') 


width = ' ' * 4
height = ' ' * 4
nr_channels = ' ' * 4

data = STBIMAGE.stbi_load("blue-poly.jpg", width, height, nr_channels, 0)

puts data # You can use this data in OpenGL for instance.

puts width.unpack('l')[0]
puts height.unpack('l')[0]
puts nr_channels.unpack('l')[0]
```

<br>

# Credit

* Credit to Vaiorabbit who made the bindings of opengl into ruby! This wrapper is based on his glfw wrapper.
His repo: https://github.com/vaiorabbit/ruby-opengl

* stb_image.h by Sean Barret. Repo: https://github.com/nothings/stb/blob/master/stb_image.h


<br>

# Licence

MIT License

```
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
```
