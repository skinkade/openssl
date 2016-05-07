unit module OpenSSL::NativeLib;
use Find::Bundled;

sub ssl-lib is export {
    state $lib;
    unless $lib {
        if $*DISTRO.is-win {
            # try to find a bundled .dll
            # $lib = Find::Bundled.find('ssleay32.dll', 'OpenSSL', :return-original, :keep-filename);
            $lib = %?RESOURCES<libraries/ssleay32>.Str;
        } else {
            $lib = $*VM.platform-library-name('ssl'.IO).Str;
        }
    }
    $lib
}

sub gen-lib is export {
    state $lib;
    unless $lib {
        if $*DISTRO.is-win {
            # try to find a bundled .dll
            # $lib = Find::Bundled.find('libeay32.dll', 'OpenSSL', :return-original, :keep-filename);
            $lib = %?RESOURCES<libraries/libeay32>.Str;
        } else {
            $lib =  $*VM.platform-library-name('ssl'.IO).Str;
        }
    }
    $lib
}
