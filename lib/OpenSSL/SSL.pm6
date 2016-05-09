unit module OpenSSL::SSL;

use OpenSSL::NativeLib;
use OpenSSL::Bio;
use OpenSSL::Method;
use OpenSSL::Ctx;

use NativeCall;

class SSL is repr('CStruct') {
    has int32 $.version;
    has int32 $.type;

    has OpenSSL::Method::SSL_METHOD $.method;

    has OpenSSL::Bio::BIO $.rbio;
    has OpenSSL::Bio::BIO $.wbio;
    has OpenSSL::Bio::BIO $.bbio;

    has int32 $.rwstate;

    has int32 $.in_handshake;

    # function
    has OpaquePointer $.handshake_func;

    has int32 $.server;

    has int32 $.new_session;

    has int32 $.quiet_shutdown;
    has int32 $.shutdown;

    has int32 $.state;
    has int32 $.rstate;
}

our sub SSL_library_init() is native(&ssl-lib)                                 { ... }
our sub SSL_load_error_strings() is native(&ssl-lib)                           { ... }

our sub SSL_new(OpenSSL::Ctx::SSL_CTX) returns SSL is native(&ssl-lib)         { ... }
our sub SSL_set_fd(SSL, int32) returns int32 is native(&ssl-lib)               { ... }
our sub SSL_shutdown(SSL) returns int32 is native(&ssl-lib)                    { ... }
our sub SSL_free(SSL) is native(&ssl-lib)                                      { ... }
our sub SSL_get_error(SSL, int32) returns int32 is native(&ssl-lib)            { ... }
our sub SSL_accept(SSL) returns int32 is native(&ssl-lib)                      { ... }
our sub SSL_connect(SSL) returns int32 is native(&ssl-lib)                     { ... }
our sub SSL_read(SSL, Blob, int32) returns int32 is native(&ssl-lib)  { ... }
our sub SSL_write(SSL, Blob, int32) returns int32 is native(&ssl-lib) { ... }
our sub SSL_set_connect_state(SSL) is native(&ssl-lib)                         { ... }
our sub SSL_set_accept_state(SSL) is native(&ssl-lib)                          { ... }

our sub SSL_set_bio(SSL, OpaquePointer, OpaquePointer) returns int32 is native(&ssl-lib) { ... }

our sub SSL_set_verify(SSL, int32, &func (int32, Pointer --> int32)) is native(&ssl-lib) { ... }
our sub SSL_get_verify_result(SSL) returns long is native(&ssl-lib)            { ... }
