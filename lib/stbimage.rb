
require 'fiddle/import'

module STBIMAGE

  extend Fiddle::Importer

  STBIMAGE_FUNCTIONS_MAP = {}
  def self.extern(signature, *opts)
    symname, ctype, argtype = parse_signature(signature, @type_alias)
    opt = parse_bind_options(opts)
    f = import_function(symname, ctype, argtype, opt[:call_type])
    name = symname.gsub(/@.+/,'')
    STBIMAGE_FUNCTIONS_MAP[name] = f
    begin
      /^(.+?):(\d+)/ =~ caller.first
      file, line = $1, $2.to_i
    rescue
      file, line = __FILE__, __LINE__+3
    end
    args_str="*args"
    module_eval(<<-EOS, file, line)
      def #{name}(*args, &block)
        STBIMAGE_FUNCTIONS_MAP['#{name}'].call(*args,&block)
      end
    EOS
    module_function(name)
    f
  end

  
  @@stbi_image_import_done = false

  # Load native dll libary 
  def self.load_lib(lib = nil, path = nil, output_error = false)
    if lib == nil && path == nil

      if RUBY_PLATFORM =~ /64/

        # puts "You have a 64-bit Architecture ruby"
        if RUBY_PLATFORM =~ /mswin/ || RUBY_PLATFORM =~ /mingw/
          # puts "With Windows"
          lib, path = 'stbDLL_x64.dll', "#{__dir__}/dlls"
        elsif RUBY_PLATFORM =~ /linux/ || RUBY_PLATFORM =~ /cygwin/
          # puts "With Linux"
          lib, path = 'libstb_x64.so', "#{__dir__}/dlls"
        elsif RUBY_PLATFORM =~ /darwin/
          # puts "With macOS"
        else
          # puts "I have no idea what os are you using, so it's possible that stbimage wont't work"
        end
      
      elsif RUBY_PLATFORM =~ /arm/
      
        # puts "You have a arm architecture"
        lib, path = 'libstb_arm.so', "#{__dir__}/dlls"
      
      elsif RUBY_PLATFORM =~ /java/
      
        # puts "You have jruby!"
      
      else 
      
        # puts "You have a 32-bit Architecture ruby"
        if RUBY_PLATFORM =~ /mswin/ || RUBY_PLATFORM =~ /mingw/
          # puts "With Windows"
          lib, path = 'stbDLL_x86.dll', "#{__dir__}/dlls"
        elsif RUBY_PLATFORM =~ /linux/ || RUBY_PLATFORM =~ /cygwin/
          # puts "With Linux"
          lib, path = 'libstb_x86.so', "#{__dir__}/dlls"
        elsif RUBY_PLATFORM =~ /darwin/
          # puts "With macOS"
        else
          # puts "I have no idea what os are you using, so it's possible that stbimage wont't work"
        end
      
      end

    end

    if path
      dlload (path + '/' + lib)
    else
      dlload ("#{__dir__}/#{lib}")
    end
    import_symbols(output_error) unless @@stbi_image_import_done
  end

  @@lib_signature = [
    'void stbi_convert_iphone_png_to_rgb(int)',
    'const char* stbi_failure_reason(void)',
    'void stbi_hdr_to_ldr_gamma(float)',
    'void stbi_hdr_to_ldr_scale(float)',
    'void stbi_image_free(void*)',
    'int stbi_info(char const* , int*, int*, int*)', 
    # 'stbi_info_from_callbacks'
    # 'stbi_info_from_file'
    # 'stbi_info_from_memory'
    'int stbi_is_16_bit(char const*)',
    # 'stbi_is_16_bit_from_callbacks'
    # 'stbi_is_16_bit_from_file'
    # 'stbi_is_16_bit_from_memory'
    'int stbi_is_hdr(char const*)',
    # 'stbi_is_hdr_from_callbacks'
    # 'stbi_is_hdr_from_file'
    # 'stbi_is_hdr_from_memory'
    'void stbi_ldr_to_hdr_gamma(float)',
    'void stbi_ldr_to_hdr_scale(float)',
    'stbi_uc* stbi_load(char const*, int*, int*, int*, int)', 
    'stbi_us* stbi_load_16(char const*, int*, int*, int*, int)',
    # 'stbi_load_16_from_callbacks'
    # 'stbi_load_16_from_memory' 
    # 'stbi_load_from_callbacks' 
    # 'stbi_load_from_file'  
    # 'stbi_load_from_file_16'
    'stbi_uc const* stbi_load_from_memory(stbi_uc const*, int, int*, int*, int*, int)',
    # 'stbi_load_gif_from_memory'
    'float* stbi_loadf(char const*, int*, int*, int*, int)',
    # 'stbi_loadf_from_callbacks'
    # 'stbi_loadf_from_file' 
    # 'stbi_loadf_from_memory'
    'void stbi_set_flip_vertically_on_load(int)',
    'void stbi_set_flip_vertically_on_load_thread(int)',
    'void stbi_set_unpremultiply_on_load(int)',
    'int stbi_zlib_decode_buffer(char*, int, const char*, int)', 
    'char* stbi_zlib_decode_malloc(const char*, int, int*)', 
    'char* stbi_zlib_decode_malloc_guesssize(const char*, int, int, int*)',
    'char* stbi_zlib_decode_malloc_guesssize_headerflag(const char*, int, int, int*, int)',
    'int stbi_zlib_decode_noheader_buffer(char*, int, const char*, int)', 
    'char* stbi_zlib_decode_noheader_malloc(const char*, int, int*)'

  ]

  def self.import_symbols(output_error = false)
    typealias 'stbi_uc', 'unsigned char'
    typealias 'stbi_us', 'unsigned short'

    # function
    @@lib_signature.each do |sig|

      begin
        extern sig
      rescue
        $stderr.puts("[Warning] Failed to import #{sig}.") if output_error
      end

    end

        @@stbi_image_import_done = true
        
  end
end