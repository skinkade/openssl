unit module OpenSSL::Err;

use OpenSSL::NativeLib;
use NativeCall;

our sub ERR_error_string(int32 $e, Str $ret) returns Str is native(&gen-lib) { ... };

our sub ERR_get_error() returns ulonglong is native(&gen-lib) { ... };



# X509 Verification

our %X509_errs =
    0 => "X509_V_OK",
    1 => "X509_V_ERR_UNSPECIFIED",
    2 => "X509_V_ERR_UNABLE_TO_GET_ISSUER_CERT",
    3 => "X509_V_ERR_UNABLE_TO_GET_CRL",
    4 => "X509_V_ERR_UNABLE_TO_DECRYPT_CERT_SIGNATURE",
    5 => "X509_V_ERR_UNABLE_TO_DECRYPT_CRL_SIGNATURE",
    6 => "X509_V_ERR_UNABLE_TO_DECODE_ISSUER_PUBLIC_KEY",
    7 => "X509_V_ERR_CERT_SIGNATURE_FAILURE",
    8 => "X509_V_ERR_CRL_SIGNATURE_FAILURE",
    9 => "X509_V_ERR_CERT_NOT_YET_VALID",
    10 => "X509_V_ERR_CERT_HAS_EXPIRED",
    11 => "X509_V_ERR_CRL_NOT_YET_VALID",
    12 => "X509_V_ERR_CRL_HAS_EXPIRED",
    13 => "X509_V_ERR_ERROR_IN_CERT_NOT_BEFORE_FIELD",
    14 => "X509_V_ERR_ERROR_IN_CERT_NOT_AFTER_FIELD",
    15 => "X509_V_ERR_ERROR_IN_CRL_LAST_UPDATE_FIELD",
    16 => "X509_V_ERR_ERROR_IN_CRL_NEXT_UPDATE_FIELD",
    17 => "X509_V_ERR_OUT_OF_MEM",
    18 => "X509_V_ERR_DEPTH_ZERO_SELF_SIGNED_CERT",
    19 => "X509_V_ERR_SELF_SIGNED_CERT_IN_CHAIN",
    20 => "X509_V_ERR_UNABLE_TO_GET_ISSUER_CERT_LOCALLY",
    21 => "X509_V_ERR_UNABLE_TO_VERIFY_LEAF_SIGNATURE",
    22 => "X509_V_ERR_CERT_CHAIN_TOO_LONG",
    23 => "X509_V_ERR_CERT_REVOKED",
    24 => "X509_V_ERR_INVALID_CA",
    25 => "X509_V_ERR_PATH_LENGTH_EXCEEDED",
    26 => "X509_V_ERR_INVALID_PURPOSE",
    27 => "X509_V_ERR_CERT_UNTRUSTED",
    28 => "X509_V_ERR_CERT_REJECTED",
    29 => "X509_V_ERR_SUBJECT_ISSUER_MISMATCH",
    30 => "X509_V_ERR_AKID_SKID_MISMATCH",
    31 => "X509_V_ERR_AKID_ISSUER_SERIAL_MISMATCH",
    32 => "X509_V_ERR_KEYUSAGE_NO_CERTSIGN",
    33 => "X509_V_ERR_UNABLE_TO_GET_CRL_ISSUER",
    34 => "X509_V_ERR_UNHANDLED_CRITICAL_EXTENSION",
    35 => "X509_V_ERR_KEYUSAGE_NO_CRL_SIGN",
    36 => "X509_V_ERR_UNHANDLED_CRITICAL_CRL_EXTENSION",
    37 => "X509_V_ERR_INVALID_NON_CA",
    38 => "X509_V_ERR_PROXY_PATH_LENGTH_EXCEEDED",
    39 => "X509_V_ERR_KEYUSAGE_NO_DIGITAL_SIGNATURE",
    40 => "X509_V_ERR_PROXY_CERTIFICATES_NOT_ALLOWED",
    41 => "X509_V_ERR_INVALID_EXTENSION",
    42 => "X509_V_ERR_INVALID_POLICY_EXTENSION",
    43 => "X509_V_ERR_NO_EXPLICIT_POLICY",
    44 => "X509_V_ERR_DIFFERENT_CRL_SCOPE",
    45 => "X509_V_ERR_UNSUPPORTED_EXTENSION_FEATURE",
    46 => "X509_V_ERR_UNNESTED_RESOURCE",
    47 => "X509_V_ERR_PERMITTED_VIOLATION",
    48 => "X509_V_ERR_EXCLUDED_VIOLATION",
    49 => "X509_V_ERR_SUBTREE_MINMAX",
    50 => "X509_V_ERR_APPLICATION_VERIFICATION",
    51 => "X509_V_ERR_UNSUPPORTED_CONSTRAINT_TYPE",
    52 => "X509_V_ERR_UNSUPPORTED_CONSTRAINT_SYNTAX",
    53 => "X509_V_ERR_UNSUPPORTED_NAME_SYNTAX",
    54 => "X509_V_ERR_CRL_PATH_VALIDATION_ERROR",
    55 => "X509_V_ERR_PATH_LOOP",
    56 => "X509_V_ERR_SUITE_B_INVALID_VERSION",
    57 => "X509_V_ERR_SUITE_B_INVALID_ALGORITHM",
    58 => "X509_V_ERR_SUITE_B_INVALID_CURVE",
    59 => "X509_V_ERR_SUITE_B_INVALID_SIGNATURE_ALGORITHM",
    60 => "X509_V_ERR_SUITE_B_LOS_NOT_ALLOWED",
    61 => "X509_V_ERR_SUITE_B_CANNOT_SIGN_P_384_WITH_P_256",
    62 => "X509_V_ERR_HOSTNAME_MISMATCH",
    63 => "X509_V_ERR_EMAIL_MISMATCH",
    64 => "X509_V_ERR_IP_ADDRESS_MISMATCH",
    65 => "X509_V_ERR_DANE_NO_MATCH",
    66 => "X509_V_ERR_EE_KEY_TOO_SMALL",
    67 => "X509_V_ERR_CA_KEY_TOO_SMALL",
    68 => "X509_V_ERR_CA_MD_TOO_WEAK";



class X::X509 is Exception {
    has $.X509_err is required;

    method message() {
        "Certificate verification error: %X509_errs{$!X509_err}";
    }
}
