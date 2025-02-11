/*
* Copyright (c) 2017 Christian Huitema <huitema@huitema.net>
*
* Permission to use, copy, modify, and distribute this software for any
* purpose with or without fee is hereby granted, provided that the above
* copyright notice and this permission notice appear in all copies.
*
* THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
* WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
* MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
* ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
* WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
* ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
* OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
*/

#ifndef PTLS_PEM_UTILS
#define PTLS_PEM_UTILS

#include <picotls.h>
#include "cred_buffer.h"

int ptls_load_pem_objects_from_memory(ptls_cred_buffer_t *mem, const char *label, ptls_iovec_t *list, size_t list_max, size_t *nb_objects);

int ptls_load_certificates_from_memory(ptls_context_t *ctx, ptls_cred_buffer_t *mem);

#endif /* PTLS_PEM_UTILS */