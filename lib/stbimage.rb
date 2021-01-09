
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

  
  @@glfw_import_done = false

=begin
Load native dll libary 
- lib = the name of the file
- path = route to the file
=end
  def self.load_lib(lib = nil, path = nil, output_error = false)
    if lib == nil && path == nil
      if RUBY_PLATFORM == "x64-mswin64_140" || RUBY_PLATFORM == "x64-mingw32"
        lib, path = 'stbDLL_x64.dll', "#{__dir__}/../dlls"
      elsif RUBY_PLATFORM == "x86-mingw32"
        lib, path = 'stbDLL_x86.dll', "#{__dir__}/../dlls"
      end
    end

    if path
      dlload (path + '/' + lib)
    else
      dlload (lib)
    end
    import_symbols(output_error) unless @@glfw_import_done
  end

  @@lib_signature = [
    'void stbi_convert_iphone_png_to_rgb(int)',
    'const char *stbi_failure_reason(void)',
    'void stbi_hdr_to_ldr_gamma(float)',
    'void stbi_hdr_to_ldr_scale(float)',
    'void stbi_image_free(void*)',
    'int stbi_info(char const* , int*, int*, int*)', 
    # 'int stbi_info_from_callbacks(stbi_io_callbacks const*, void*, int*, int*, comp*)'
    # 'stbi_info_from_file'
    # 'stbi_info_from_memory'
    # 'stbi_is_16_bit'
    # 'stbi_is_16_bit_from_callbacks'
    # 'stbi_is_16_bit_from_file'
    # 'stbi_is_16_bit_from_memory'
    # 'stbi_is_hdr'
    # 'stbi_is_hdr_from_callbacks'
    # 'stbi_is_hdr_from_file'
    # 'stbi_is_hdr_from_memory'
    # 'stbi_ldr_to_hdr_gamma'
    # 'stbi_ldr_to_hdr_scale'
    'stbi_uc* stbi_load(char const*, int*, int*, int*, int)', 
    # 'stbi_load_16'
    # 'stbi_load_16_from_callbacks'
    # 'stbi_load_16_from_memory' 
    # 'stbi_load_from_callbacks' 
    # 'stbi_load_from_file'  
    # 'stbi_load_from_file_16'
    # 'stbi_load_from_memory' 
    # 'stbi_load_gif_from_memory'
    # 'stbi_loadf' 
    # 'stbi_loadf_from_callbacks'
    # 'stbi_loadf_from_file' 
    # 'stbi_loadf_from_memory'
    'void stbi_set_flip_vertically_on_load(int)'
    # 'stbi_set_flip_vertically_on_load_thread'
    # 'stbi_set_unpremultiply_on_load' 
    # 'stbi_zlib_decode_buffer' 
    # 'stbi_zlib_decode_malloc' 
    # 'stbi_zlib_decode_malloc_guesssize'
    # 'stbi_zlib_decode_malloc_guesssize_headerflag'
    # 'stbi_zlib_decode_noheader_buffer' 
    # 'stbi_zlib_decode_noheader_malloc'
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

    @@glfw_import_done = true
  end

end

