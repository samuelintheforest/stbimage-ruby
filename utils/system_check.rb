RUBY_PLATFORM = x86-mingw32

if RUBY_PLATFORM =~ /x86/

  puts "You have a 32-bit Architecture ruby"
  if RUBY_PLATFORM =~ /mswin/ || RUBY_PLATFORM =~ /mingw/
    puts "With Windows"
    lib, path = 'stbDLL_x86.dll', "#{__dir__}/../dlls"
  elsif RUBY_PLATFORM =~ /linux/ || RUBY_PLATFORM =~ /cygwin/
    puts "With Linux"
    lib, path = 'libstb_x86.so', "#{__dir__}/../dlls"
  elsif RUBY_PLATFORM =~ /darwin/
    puts "With macOS"
  else
    puts "I have no idea what os are you using, so it's possible that stbimage wont't work"
  end

elsif RUBY_PLATFORM =~ /arm/

  puts "You have a arm architecture"
  lib, path = 'libstb_arm.so', "#{__dir__}/../dlls"

elsif RUBY_PLATFORM =~ /java/

  puts "You have jruby!"

else 

  puts "You have a 64-bit Architecture ruby"
  if RUBY_PLATFORM =~ /mswin/ || RUBY_PLATFORM =~ /mingw/
    puts "With Windows"
    lib, path = 'stbDLL_x64.dll', "#{__dir__}/../dlls"
  elsif RUBY_PLATFORM =~ /linux/ || RUBY_PLATFORM =~ /cygwin/
    puts "With Linux"
    lib, path = 'libstb_x64.so', "#{__dir__}/../dlls"
  elsif RUBY_PLATFORM =~ /darwin/
    puts "With macOS"
  else
    puts "I have no idea what os are you using, so it's possible that stbimage wont't work"
  end

end


# if RUBY_PLATFORM == "x64-mswin64_140" || RUBY_PLATFORM == "x64-mingw32"
      #   lib, path = 'stbDLL_x64.dll', "#{__dir__}/../dlls"
      # elsif RUBY_PLATFORM == "x86-mingw32"
      #   lib, path = 'stbDLL_x86.dll', "#{__dir__}/../dlls"
      # elsif RUBY_PLATFORM =~ /x86_linux/
      #   lib, path = 'libstd_x86.so', "#{__dir__}/../dlls"
      # else