# stb-image ruby bindings     

Ruby binding of stb-image.h

* ### Supports: ###  
  <br>
  
  * **stbi_load** (Default image loader)
  * **stbi_load_from_memory**
  * **stbi_load_16**
  * **stbi_loadf** (For `.hdr` images)
  * **stbi_info**
  * **stbi_image_free**
  * **stbi_set_flip_vertically_on_load**
  * and more...


<br>

# Installation

* Windows:\
`gem install stbimage`

* Linux/macOs:\
`gem install stbimage`

*Note: In Windows and in Linux the gem should work immadiately 'cause we using precompiled libs (see [Usage](#Usage)). In macOs you have to compile the dynamic libary (.so) yourself (see [Compilation](#Compilation)).*

<br>

# Compilation

If you want to compile the shared libary yourself, Use the instruction below (otherwise if the gem works for you than this step is unnecessary):

1. Download sources: [stb-source](stb-source) (stb_image.h, stb_image.c)

2. Navigate to the files in terminal with `cd` 

3. Run the command in terminal (works with macOs, linux, and linux arm):
`gcc -shared -o libstb.so -fPIC stb_image.c`

4. If nothing shows up than finally you got your own `libstb.so` file what is fully compatible with your system.

5. See [Usage](#Usage) to properly load it to your program.

<br>

# Precompiled shared libs (.dll, .so)

You can find it under [dlls](lib/dlls) folder, but they are also included in the gem

<br>

# Usage

```ruby
require 'stbimage'

# When you using the precompiled shared libs. Only works with linux, arm, Windows (in macOs it doesn't work)
STBIMAGE.load_lib() 

# Although when the above function doesn't work for you for some reason (or you are using macOs), please specify arguments in .load_lib function

# 1. When your own .dll, or .so libary is at the same folder as your program. Or you wanna specify relative_path to file

# STBIMAGE.load_lib('your_name.so') 
# or
# STBIMAGE.load_lib('your_folder/your_name.so')

# 2. When your own .dll or .so file is somewhere in your storage, please specify absolute path 

# Example:
# STBIMAGE.load_lib('your_name.so', '/home/user/documents/ruby_proj/dll')


width = ' ' * 4
height = ' ' * 4
nr_channels = ' ' * 4

data = STBIMAGE.stbi_load("blue-poly.jpg", width, height, nr_channels, 0)

data # the retrieved image data

width = width.unpack1('L')
height height.unpack1('L')
nr_channels = nr_channels.unpack1('L')



# The retrieved data can be used in OpenGL for instance.
# glTexImage2D(GL_TEXTURE_2D, 0, GL_RGB, width, height, 0, GL_RGB, GL_UNSIGNED_BYTE, data)

stbi_image_free(data)
```

<br>

# Function list and examples:

```ruby
include STBIMAGE

# 1. stbi_load(path_to_file, width_ptr, height_ptr, num_channels_ptr, desired_channels)

width = ' ' * 4         # width_ptr
height = ' ' * 4        # height_ptr
nr_channels = ' ' * 4   # num_channels_ptr

data = stbi_load("blue-poly.jpg", width, height, nr_channels, 0)

# retrieve the values from the pointers
width = width.unpack1('L')             
height = height.unpack1('L')
nr_channels = nr_channels.unpack1('L')
```

```ruby
include STBIMAGE

# 2. stbi_load_from_memory(ptr_to_image_data_array, image_array_size_in_bytes, width_ptr, height_ptr, num_channels_ptr, desired_channels)

white_texture_raw = [
  0x89, 0x50, 0x4E, 0x47, 0x0D, 0x0A, 0x1A, 0x0A, 0x00, 0x00, 0x00, 0x0D, 0x49, 0x48, 0x44, 0x52, 
0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00, 0x20, 0x08, 0x06, 0x00, 0x00, 0x00, 0x73, 0x7A, 0x7A, 
0xF4, 0x00, 0x00, 0x00, 0x01, 0x73, 0x52, 0x47, 0x42, 0x00, 0xAE, 0xCE, 0x1C, 0xE9, 0x00, 0x00, 
0x00, 0x2F, 0x49, 0x44, 0x41, 0x54, 0x58, 0x47, 0xED, 0xD0, 0x41, 0x11, 0x00, 0x00, 0x0C, 0xC2, 
0xB0, 0xE1, 0x5F, 0x34, 0x93, 0xC1, 0x27, 0x55, 0xD0, 0x4B, 0xDA, 0xF6, 0x86, 0xC5, 0x00, 0x01, 
0x02, 0x04, 0x08, 0x10, 0x20, 0x40, 0x80, 0x00, 0x01, 0x02, 0x04, 0x08, 0x10, 0x20, 0xB0, 0x16, 
0x78, 0x31, 0x4C, 0x7F, 0xA1, 0xF9, 0xB6, 0x23, 0xF9, 0x00, 0x00, 0x00, 0x00, 0x49, 0x45, 0x4E, 
0x44, 0xAE, 0x42, 0x60, 0x82
]

texture_size = white_texture_raw.size
texture_ptr = Fiddle::Pointer.to_ptr(white_texture_raw.pack('C*'))

width = ' ' * 4         # width_ptr
height = ' ' * 4        # height_ptr
nr_channels = ' ' * 4   # num_channels_ptr

data = stbi_load_from_file(texture_ptr, texture_size, width, height, nr_channels, 0)

# retrieve the values from the pointers
width = width.unpack1('L')             
height = height.unpack1('L')
nr_channels = nr_channels.unpack1('L')
```

```ruby
include STBIMAGE

# 3. stbi_set_flip_vertically_on_load(value)
# before getting reading the image:

stbi_set_flip_vertically_on_load(1) # flips the image vertically on load
stbi_set_flip_vertically_on_load(0) # disable flipping
```

```ruby
include STBIMAGE

# 4. stbi_image_free(img_data)
# freeing up the image in memory after we loaded the image. It's essential in order to avoid big memory usage.  

stbi_image_free(data)
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
