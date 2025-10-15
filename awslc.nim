# libcrypto + libssl sources without cmake, no-asm, no fips, no tests, tools
# TODO: look into use assembly files for perf

import ./jitterentropy

# ----- toolchain + includes -----
{.passc: "-DBORINGSSL_IMPLEMENTATION -DOPENSSL_NO_ASM -DS2N_BN_HIDE_SYMBOLS".}
{.localPassC: "-ffunction-sections -fdata-sections".}
{.passc: "-I./libs/aws-lc/include -I./libs/aws-lc".}

{.localPassC: "-O3".}

when not defined(release):
  {.localPassC: "-DNDEBUG".}

# link stdc++/pthread as needed
when defined(macosx):
  {.localPassC: "-lc++".}
elif defined(linux):
  {.localPassC: "-D_XOPEN_SOURCE=700".}
  {.localPassC: "-lstdc++ -pthread".}

# ----- generated sources -----
{.compile: "./libs/aws-lc/generated-src/err_data.c".}

# ----- crypto -----
# asn1
{.compile: "./libs/aws-lc/crypto/asn1/a_bitstr.c".}
{.compile: "./libs/aws-lc/crypto/asn1/a_bool.c".}
{.compile: "./libs/aws-lc/crypto/asn1/a_d2i_fp.c".}
{.compile: "./libs/aws-lc/crypto/asn1/a_dup.c".}
{.compile: "./libs/aws-lc/crypto/asn1/a_gentm.c".}
{.compile: "./libs/aws-lc/crypto/asn1/a_i2d_fp.c".}
{.compile: "./libs/aws-lc/crypto/asn1/a_int.c".}
{.compile: "./libs/aws-lc/crypto/asn1/a_mbstr.c".}
{.compile: "./libs/aws-lc/crypto/asn1/a_object.c".}
{.compile: "./libs/aws-lc/crypto/asn1/a_octet.c".}
{.compile: "./libs/aws-lc/crypto/asn1/a_strex.c".}
{.compile: "./libs/aws-lc/crypto/asn1/a_strnid.c".}
{.compile: "./libs/aws-lc/crypto/asn1/a_time.c".}
{.compile: "./libs/aws-lc/crypto/asn1/a_type.c".}
{.compile: "./libs/aws-lc/crypto/asn1/a_utctm.c".}
{.compile: "./libs/aws-lc/crypto/asn1/a_utf8.c".}
{.compile: "./libs/aws-lc/crypto/asn1/asn1_lib.c".}
{.compile: "./libs/aws-lc/crypto/asn1/asn1_par.c".}
{.compile: "./libs/aws-lc/crypto/asn1/asn_pack.c".}
{.compile: "./libs/aws-lc/crypto/asn1/f_int.c".}
{.compile: "./libs/aws-lc/crypto/asn1/f_string.c".}
{.compile: "./libs/aws-lc/crypto/asn1/tasn_dec.c".}
{.compile: "./libs/aws-lc/crypto/asn1/tasn_enc.c".}
{.compile: "./libs/aws-lc/crypto/asn1/tasn_fre.c".}
{.compile: "./libs/aws-lc/crypto/asn1/tasn_new.c".}
{.compile: "./libs/aws-lc/crypto/asn1/tasn_typ.c".}
{.compile: "./libs/aws-lc/crypto/asn1/tasn_utl.c".}
{.compile: "./libs/aws-lc/crypto/asn1/posix_time.c".}

# fips
{.compile: "./libs/aws-lc/crypto/fipsmodule/bcm.c".}
{.compile: "./libs/aws-lc/crypto/fipsmodule/fips_shared_support.c".}
{.compile: "./libs/aws-lc/crypto/fipsmodule/cpucap/cpucap.c".}

# base64/bio/etc
{.compile: "./libs/aws-lc/crypto/base64/base64.c".}
{.compile: "./libs/aws-lc/crypto/bio/bio.c".}
{.compile: "./libs/aws-lc/crypto/bio/bio_addr.c".}
{.compile: "./libs/aws-lc/crypto/bio/bio_mem.c".}
{.compile: "./libs/aws-lc/crypto/bio/connect.c".}
{.compile: "./libs/aws-lc/crypto/bio/dgram.c".}
{.compile: "./libs/aws-lc/crypto/bio/errno.c".}
{.compile: "./libs/aws-lc/crypto/bio/fd.c".}
{.compile: "./libs/aws-lc/crypto/bio/file.c".}
{.compile: "./libs/aws-lc/crypto/bio/hexdump.c".}
{.compile: "./libs/aws-lc/crypto/bio/md.c".}
{.compile: "./libs/aws-lc/crypto/bio/pair.c".}
{.compile: "./libs/aws-lc/crypto/bio/printf.c".}
{.compile: "./libs/aws-lc/crypto/bio/socket.c".}
{.compile: "./libs/aws-lc/crypto/bio/socket_helper.c".}

# misc core
{.compile: "./libs/aws-lc/crypto/blake2/blake2.c".}
{.compile: "./libs/aws-lc/crypto/bn_extra/bn_asn1.c".}
{.compile: "./libs/aws-lc/crypto/bn_extra/convert.c".}
{.compile: "./libs/aws-lc/crypto/buf/buf.c".}
{.compile: "./libs/aws-lc/crypto/bytestring/asn1_compat.c".}
{.compile: "./libs/aws-lc/crypto/bytestring/ber.c".}
{.compile: "./libs/aws-lc/crypto/bytestring/cbb.c".}
{.compile: "./libs/aws-lc/crypto/bytestring/cbs.c".}
{.compile: "./libs/aws-lc/crypto/bytestring/unicode.c".}
{.compile: "./libs/aws-lc/crypto/chacha/chacha.c".}

# cipher extra
{.compile: "./libs/aws-lc/crypto/cipher_extra/cipher_extra.c".}
{.compile: "./libs/aws-lc/crypto/cipher_extra/derive_key.c".}
{.compile: "./libs/aws-lc/crypto/cipher_extra/e_aesctrhmac.c".}
{.compile: "./libs/aws-lc/crypto/cipher_extra/e_aesgcmsiv.c".}
{.compile: "./libs/aws-lc/crypto/cipher_extra/e_chacha20poly1305.c".}
{.compile: "./libs/aws-lc/crypto/cipher_extra/e_aes_cbc_hmac_sha1.c".}
{.compile: "./libs/aws-lc/crypto/cipher_extra/e_aes_cbc_hmac_sha256.c".}
{.compile: "./libs/aws-lc/crypto/cipher_extra/e_des.c".}
{.compile: "./libs/aws-lc/crypto/cipher_extra/e_null.c".}
{.compile: "./libs/aws-lc/crypto/cipher_extra/e_rc2.c".}
{.compile: "./libs/aws-lc/crypto/cipher_extra/e_rc4.c".}
{.compile: "./libs/aws-lc/crypto/cipher_extra/e_tls.c".}
{.compile: "./libs/aws-lc/crypto/cipher_extra/tls_cbc.c".}

# conf/console/core
{.compile: "./libs/aws-lc/crypto/conf/conf.c".}
{.compile: "./libs/aws-lc/crypto/console/console.c".}
{.compile: "./libs/aws-lc/crypto/crypto.c".}
{.compile: "./libs/aws-lc/crypto/des/des.c".}

# dh/digest/dsa/ec extras
{.compile: "./libs/aws-lc/crypto/dh_extra/params.c".}
{.compile: "./libs/aws-lc/crypto/dh_extra/dh_asn1.c".}
{.compile: "./libs/aws-lc/crypto/digest_extra/digest_extra.c".}
{.compile: "./libs/aws-lc/crypto/dsa/dsa.c".}
{.compile: "./libs/aws-lc/crypto/dsa/dsa_asn1.c".}
{.compile: "./libs/aws-lc/crypto/ecdh_extra/ecdh_extra.c".}
{.compile: "./libs/aws-lc/crypto/ecdsa_extra/ecdsa_asn1.c".}
{.compile: "./libs/aws-lc/crypto/ec_extra/ec_asn1.c".}
{.compile: "./libs/aws-lc/crypto/ec_extra/ec_derive.c".}
{.compile: "./libs/aws-lc/crypto/ec_extra/hash_to_curve.c".}

# err/engine
{.compile: "./libs/aws-lc/crypto/err/err.c".}
{.compile: "./libs/aws-lc/crypto/engine/engine.c".}

# evp extras
{.compile: "./libs/aws-lc/crypto/evp_extra/evp_asn1.c".}
{.compile: "./libs/aws-lc/crypto/evp_extra/p_dh.c".}
{.compile: "./libs/aws-lc/crypto/evp_extra/p_dh_asn1.c".}
{.compile: "./libs/aws-lc/crypto/evp_extra/p_dsa.c".}
{.compile: "./libs/aws-lc/crypto/evp_extra/p_dsa_asn1.c".}
{.compile: "./libs/aws-lc/crypto/evp_extra/p_ec_asn1.c".}
{.compile: "./libs/aws-lc/crypto/evp_extra/p_ed25519_asn1.c".}
{.compile: "./libs/aws-lc/crypto/evp_extra/p_hmac_asn1.c".}
{.compile: "./libs/aws-lc/crypto/evp_extra/p_kem_asn1.c".}
{.compile: "./libs/aws-lc/crypto/evp_extra/p_pqdsa_asn1.c".}
{.compile: "./libs/aws-lc/crypto/evp_extra/p_rsa_asn1.c".}
{.compile: "./libs/aws-lc/crypto/evp_extra/p_x25519.c".}
{.compile: "./libs/aws-lc/crypto/evp_extra/p_x25519_asn1.c".}
{.compile: "./libs/aws-lc/crypto/evp_extra/p_methods.c".}
{.compile: "./libs/aws-lc/crypto/evp_extra/print.c".}
{.compile: "./libs/aws-lc/crypto/evp_extra/scrypt.c".}
{.compile: "./libs/aws-lc/crypto/evp_extra/sign.c".}

# misc subsystems
{.compile: "./libs/aws-lc/crypto/ex_data.c".}
{.compile: "./libs/aws-lc/crypto/hpke/hpke.c".}
{.compile: "./libs/aws-lc/crypto/hrss/hrss.c".}
{.compile: "./libs/aws-lc/crypto/kyber/kyber512r3_ref.c".}
{.compile: "./libs/aws-lc/crypto/kyber/kyber768r3_ref.c".}
{.compile: "./libs/aws-lc/crypto/kyber/kyber1024r3_ref.c".}
{.compile: "./libs/aws-lc/crypto/kyber/pqcrystals_kyber_ref_common/fips202.c".}
{.compile: "./libs/aws-lc/crypto/kyber/kem_kyber.c".}
{.compile: "./libs/aws-lc/crypto/lhash/lhash.c".}
{.compile: "./libs/aws-lc/crypto/mem.c".}
{.compile: "./libs/aws-lc/crypto/obj/obj.c".}
{.compile: "./libs/aws-lc/crypto/obj/obj_xref.c".}

# ocsp
{.compile: "./libs/aws-lc/crypto/ocsp/ocsp_asn.c".}
{.compile: "./libs/aws-lc/crypto/ocsp/ocsp_client.c".}
{.compile: "./libs/aws-lc/crypto/ocsp/ocsp_extension.c".}
{.compile: "./libs/aws-lc/crypto/ocsp/ocsp_http.c".}
{.compile: "./libs/aws-lc/crypto/ocsp/ocsp_lib.c".}
{.compile: "./libs/aws-lc/crypto/ocsp/ocsp_print.c".}
{.compile: "./libs/aws-lc/crypto/ocsp/ocsp_server.c".}
{.compile: "./libs/aws-lc/crypto/ocsp/ocsp_verify.c".}

# pem/pkcs7/pkcs8
{.compile: "./libs/aws-lc/crypto/pem/pem_all.c".}
{.compile: "./libs/aws-lc/crypto/pem/pem_info.c".}
{.compile: "./libs/aws-lc/crypto/pem/pem_lib.c".}
{.compile: "./libs/aws-lc/crypto/pem/pem_oth.c".}
{.compile: "./libs/aws-lc/crypto/pem/pem_pk8.c".}
{.compile: "./libs/aws-lc/crypto/pem/pem_pkey.c".}
{.compile: "./libs/aws-lc/crypto/pem/pem_x509.c".}
{.compile: "./libs/aws-lc/crypto/pem/pem_xaux.c".}
{.compile: "./libs/aws-lc/crypto/pkcs7/bio/cipher.c".}
{.compile: "./libs/aws-lc/crypto/pkcs7/pkcs7.c".}
{.compile: "./libs/aws-lc/crypto/pkcs7/pkcs7_asn1.c".}
{.compile: "./libs/aws-lc/crypto/pkcs7/pkcs7_x509.c".}
{.compile: "./libs/aws-lc/crypto/pkcs8/p5_pbev2.c".}
{.compile: "./libs/aws-lc/crypto/pkcs8/pkcs8.c".}
{.compile: "./libs/aws-lc/crypto/pkcs8/pkcs8_x509.c".}

# poly1305/rc4/rand/refcount/etc
{.compile: "./libs/aws-lc/crypto/poly1305/poly1305.c".}
{.compile: "./libs/aws-lc/crypto/poly1305/poly1305_arm.c".}
{.compile: "./libs/aws-lc/crypto/poly1305/poly1305_vec.c".}
{.compile: "./libs/aws-lc/crypto/pool/pool.c".}
{.compile: "./libs/aws-lc/crypto/rand_extra/ccrandomgeneratebytes.c".}
{.compile: "./libs/aws-lc/crypto/rand_extra/deterministic.c".}
{.compile: "./libs/aws-lc/crypto/rand_extra/getentropy.c".}
{.compile: "./libs/aws-lc/crypto/rand_extra/rand_extra.c".}
{.compile: "./libs/aws-lc/crypto/rand_extra/snapsafe_fallback.c".}
{.compile: "./libs/aws-lc/crypto/rand_extra/urandom.c".}
{.compile: "./libs/aws-lc/crypto/rand_extra/windows.c".}
{.compile: "./libs/aws-lc/crypto/rc4/rc4.c".}
{.compile: "./libs/aws-lc/crypto/refcount_c11.c".}
{.compile: "./libs/aws-lc/crypto/refcount_lock.c".}
{.compile: "./libs/aws-lc/crypto/refcount_win.c".}

# rsa extras
{.compile: "./libs/aws-lc/crypto/rsa_extra/rsa_asn1.c".}
{.compile: "./libs/aws-lc/crypto/rsa_extra/rsa_crypt.c".}
{.compile: "./libs/aws-lc/crypto/rsa_extra/rsa_print.c".}
{.compile: "./libs/aws-lc/crypto/rsa_extra/rsassa_pss_asn1.c".}

# stack/siphash/spake/thread/trust_token/ube
{.compile: "./libs/aws-lc/crypto/stack/stack.c".}
{.compile: "./libs/aws-lc/crypto/siphash/siphash.c".}
{.compile: "./libs/aws-lc/crypto/spake25519/spake25519.c".}
{.compile: "./libs/aws-lc/crypto/thread.c".}
{.compile: "./libs/aws-lc/crypto/thread_none.c".}
{.compile: "./libs/aws-lc/crypto/thread_pthread.c".}
{.compile: "./libs/aws-lc/crypto/thread_win.c".}
{.compile: "./libs/aws-lc/crypto/trust_token/pmbtoken.c".}
{.compile: "./libs/aws-lc/crypto/trust_token/trust_token.c".}
{.compile: "./libs/aws-lc/crypto/trust_token/voprf.c".}
{.compile: "./libs/aws-lc/crypto/ube/ube.c".}
{.compile: "./libs/aws-lc/crypto/ube/fork_detect.c".}
{.compile: "./libs/aws-lc/crypto/ube/snapsafe_detect.c".}

# x509
{.compile: "./libs/aws-lc/crypto/x509/a_digest.c".}
{.compile: "./libs/aws-lc/crypto/x509/a_sign.c".}
{.compile: "./libs/aws-lc/crypto/x509/a_verify.c".}
{.compile: "./libs/aws-lc/crypto/x509/algorithm.c".}
{.compile: "./libs/aws-lc/crypto/x509/asn1_gen.c".}
{.compile: "./libs/aws-lc/crypto/x509/by_dir.c".}
{.compile: "./libs/aws-lc/crypto/x509/by_file.c".}
{.compile: "./libs/aws-lc/crypto/x509/i2d_pr.c".}
{.compile: "./libs/aws-lc/crypto/x509/name_print.c".}
{.compile: "./libs/aws-lc/crypto/x509/policy.c".}
{.compile: "./libs/aws-lc/crypto/x509/rsa_pss.c".}
{.compile: "./libs/aws-lc/crypto/x509/t_crl.c".}
{.compile: "./libs/aws-lc/crypto/x509/t_req.c".}
{.compile: "./libs/aws-lc/crypto/x509/t_x509.c".}
{.compile: "./libs/aws-lc/crypto/x509/t_x509a.c".}
{.compile: "./libs/aws-lc/crypto/x509/v3_akey.c".}
{.compile: "./libs/aws-lc/crypto/x509/v3_akeya.c".}
{.compile: "./libs/aws-lc/crypto/x509/v3_alt.c".}
{.compile: "./libs/aws-lc/crypto/x509/v3_bcons.c".}
{.compile: "./libs/aws-lc/crypto/x509/v3_bitst.c".}
{.compile: "./libs/aws-lc/crypto/x509/v3_conf.c".}
{.compile: "./libs/aws-lc/crypto/x509/v3_cpols.c".}
{.compile: "./libs/aws-lc/crypto/x509/v3_crld.c".}
{.compile: "./libs/aws-lc/crypto/x509/v3_enum.c".}
{.compile: "./libs/aws-lc/crypto/x509/v3_extku.c".}
{.compile: "./libs/aws-lc/crypto/x509/v3_genn.c".}
{.compile: "./libs/aws-lc/crypto/x509/v3_ia5.c".}
{.compile: "./libs/aws-lc/crypto/x509/v3_info.c".}
{.compile: "./libs/aws-lc/crypto/x509/v3_int.c".}
{.compile: "./libs/aws-lc/crypto/x509/v3_lib.c".}
{.compile: "./libs/aws-lc/crypto/x509/v3_ncons.c".}
{.compile: "./libs/aws-lc/crypto/x509/v3_ocsp.c".}
{.compile: "./libs/aws-lc/crypto/x509/v3_pcons.c".}
{.compile: "./libs/aws-lc/crypto/x509/v3_pmaps.c".}
{.compile: "./libs/aws-lc/crypto/x509/v3_prn.c".}
{.compile: "./libs/aws-lc/crypto/x509/v3_purp.c".}
{.compile: "./libs/aws-lc/crypto/x509/v3_skey.c".}
{.compile: "./libs/aws-lc/crypto/x509/v3_utl.c".}
{.compile: "./libs/aws-lc/crypto/x509/x_algor.c".}
{.compile: "./libs/aws-lc/crypto/x509/x_all.c".}
{.compile: "./libs/aws-lc/crypto/x509/x_attrib.c".}
{.compile: "./libs/aws-lc/crypto/x509/x_crl.c".}
{.compile: "./libs/aws-lc/crypto/x509/x_exten.c".}
{.compile: "./libs/aws-lc/crypto/x509/x_name.c".}
{.compile: "./libs/aws-lc/crypto/x509/x_pubkey.c".}
{.compile: "./libs/aws-lc/crypto/x509/x_req.c".}
{.compile: "./libs/aws-lc/crypto/x509/x_sig.c".}
{.compile: "./libs/aws-lc/crypto/x509/x_spki.c".}
{.compile: "./libs/aws-lc/crypto/x509/x_val.c".}
{.compile: "./libs/aws-lc/crypto/x509/x_x509.c".}
{.compile: "./libs/aws-lc/crypto/x509/x_x509a.c".}
{.compile: "./libs/aws-lc/crypto/x509/x509_att.c".}
{.compile: "./libs/aws-lc/crypto/x509/x509_cmp.c".}
{.compile: "./libs/aws-lc/crypto/x509/x509_d2.c".}
{.compile: "./libs/aws-lc/crypto/x509/x509_def.c".}
{.compile: "./libs/aws-lc/crypto/x509/x509_ext.c".}
{.compile: "./libs/aws-lc/crypto/x509/x509_lu.c".}
{.compile: "./libs/aws-lc/crypto/x509/x509_obj.c".}
{.compile: "./libs/aws-lc/crypto/x509/x509_req.c".}
{.compile: "./libs/aws-lc/crypto/x509/x509_set.c".}
{.compile: "./libs/aws-lc/crypto/x509/x509_trs.c".}
{.compile: "./libs/aws-lc/crypto/x509/x509_txt.c".}
{.compile: "./libs/aws-lc/crypto/x509/x509_v3.c".}
{.compile: "./libs/aws-lc/crypto/x509/x509_vfy.c".}
{.compile: "./libs/aws-lc/crypto/x509/x509_vpm.c".}
{.compile: "./libs/aws-lc/crypto/x509/x509.c".}
{.compile: "./libs/aws-lc/crypto/x509/x509cset.c".}
{.compile: "./libs/aws-lc/crypto/x509/x509name.c".}
{.compile: "./libs/aws-lc/crypto/x509/x509rset.c".}
{.compile: "./libs/aws-lc/crypto/x509/x509spki.c".}

# ----- ssl (c++ except one .c) -----
{.compile: "./libs/aws-lc/ssl/bio_ssl.cc".}
{.compile: "./libs/aws-lc/ssl/custom_extensions.cc".}
{.compile: "./libs/aws-lc/ssl/d1_both.cc".}
{.compile: "./libs/aws-lc/ssl/d1_lib.cc".}
{.compile: "./libs/aws-lc/ssl/d1_pkt.cc".}
{.compile: "./libs/aws-lc/ssl/d1_srtp.cc".}
{.compile: "./libs/aws-lc/ssl/dtls_method.cc".}
{.compile: "./libs/aws-lc/ssl/dtls_record.cc".}
{.compile: "./libs/aws-lc/ssl/encrypted_client_hello.cc".}
{.compile: "./libs/aws-lc/ssl/extensions.cc".}
{.compile: "./libs/aws-lc/ssl/handoff.cc".}
{.compile: "./libs/aws-lc/ssl/handshake.cc".}
{.compile: "./libs/aws-lc/ssl/handshake_client.cc".}
{.compile: "./libs/aws-lc/ssl/handshake_server.cc".}
{.compile: "./libs/aws-lc/ssl/s3_both.cc".}
{.compile: "./libs/aws-lc/ssl/s3_lib.cc".}
{.compile: "./libs/aws-lc/ssl/s3_pkt.cc".}
{.compile: "./libs/aws-lc/ssl/ssl_aead_ctx.cc".}
{.compile: "./libs/aws-lc/ssl/ssl_asn1.cc".}
{.compile: "./libs/aws-lc/ssl/ssl_buffer.cc".}
{.compile: "./libs/aws-lc/ssl/ssl_cert.cc".}
{.compile: "./libs/aws-lc/ssl/ssl_cipher.cc".}
{.compile: "./libs/aws-lc/ssl/ssl_decrepit.c".}
{.compile: "./libs/aws-lc/ssl/ssl_file.cc".}
{.compile: "./libs/aws-lc/ssl/ssl_key_share.cc".}
{.compile: "./libs/aws-lc/ssl/ssl_lib.cc".}
{.compile: "./libs/aws-lc/ssl/ssl_privkey.cc".}
{.compile: "./libs/aws-lc/ssl/ssl_session.cc".}
{.compile: "./libs/aws-lc/ssl/ssl_stat.cc".}
{.compile: "./libs/aws-lc/ssl/ssl_text.cc".}
{.compile: "./libs/aws-lc/ssl/ssl_transcript.cc".}
{.compile: "./libs/aws-lc/ssl/ssl_transfer_asn1.cc".}
{.compile: "./libs/aws-lc/ssl/ssl_versions.cc".}
{.compile: "./libs/aws-lc/ssl/ssl_x509.cc".}
{.compile: "./libs/aws-lc/ssl/t1_enc.cc".}
{.compile: "./libs/aws-lc/ssl/tls_method.cc".}
{.compile: "./libs/aws-lc/ssl/tls_record.cc".}
{.compile: "./libs/aws-lc/ssl/tls13_both.cc".}
{.compile: "./libs/aws-lc/ssl/tls13_client.cc".}
{.compile: "./libs/aws-lc/ssl/tls13_enc.cc".}
{.compile: "./libs/aws-lc/ssl/tls13_server.cc".}

# decrepit (still referenced)
{.compile: "./libs/aws-lc/crypto/decrepit/bio/base64_bio.c".}
{.compile: "./libs/aws-lc/crypto/decrepit/blowfish/blowfish.c".}
{.compile: "./libs/aws-lc/crypto/decrepit/cast/cast.c".}
{.compile: "./libs/aws-lc/crypto/decrepit/cast/cast_tables.c".}
{.compile: "./libs/aws-lc/crypto/decrepit/cfb/cfb.c".}
{.compile: "./libs/aws-lc/crypto/decrepit/dh/dh_decrepit.c".}
{.compile: "./libs/aws-lc/crypto/decrepit/evp/evp_do_all.c".}
{.compile: "./libs/aws-lc/crypto/decrepit/obj/obj_decrepit.c".}
{.compile: "./libs/aws-lc/crypto/decrepit/ripemd/ripemd.c".}
{.compile: "./libs/aws-lc/crypto/decrepit/rsa/rsa_decrepit.c".}
{.compile: "./libs/aws-lc/crypto/decrepit/x509/x509_decrepit.c".}
