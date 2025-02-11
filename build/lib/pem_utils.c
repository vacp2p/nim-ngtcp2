#include <stdlib.h>
#include <picotls.h>
#include <pembase64.h>
include "utils/pem_utils.h"

static int ptls_compare_separator_line(const char *line, const char *begin_or_end, const char *label)
{
    int ret = strncmp(line, "-----", 5);
    size_t text_index = 5;

    if (ret == 0) {
        size_t begin_or_end_length = strlen(begin_or_end);
        ret = strncmp(line + text_index, begin_or_end, begin_or_end_length);
        text_index += begin_or_end_length;
    }

    if (ret == 0) {
        ret = line[text_index] - ' ';
        text_index++;
    }

    if (ret == 0) {
        size_t label_length = strlen(label);
        ret = strncmp(line + text_index, label, label_length);
        text_index += label_length;
    }

    if (ret == 0) {
        ret = strncmp(line + text_index, "-----", 5);
    }

    return ret;
}

// Extracted from https://github.com/h2o/picotls/pull/284/
// Remove both pem.c/h and cred_buffer.c/h once that PR gets merged

static int ptls_get_pem_object_from_memory(ptls_cred_buffer_t *mem, const char *label, ptls_buffer_t *buf)
{
    int ret = PTLS_ERROR_PEM_LABEL_NOT_FOUND;
    char line[256];
    ptls_base64_decode_state_t state;

    /* Get the label on a line by itself */
    while (ptls_cred_buffer_gets(line, 256, mem)) {
        if (ptls_compare_separator_line(line, "BEGIN", label) == 0) {
            ret = 0;
            ptls_base64_decode_init(&state);
            break;
        }
    }
    /* Get the data in the buffer */
    while (ret == 0 && ptls_cred_buffer_gets(line, 256, mem)) {
        if (ptls_compare_separator_line(line, "END", label) == 0) {
            if (state.status == PTLS_BASE64_DECODE_DONE || (state.status == PTLS_BASE64_DECODE_IN_PROGRESS && state.nbc == 0)) {
                ret = 0;
            } else {
                ret = PTLS_ERROR_INCORRECT_BASE64;
            }
            break;
        } else {
            ret = ptls_base64_decode(line, &state, buf);
        }
    }

    return ret;
}



int ptls_load_pem_objects_from_memory(ptls_cred_buffer_t *mem, const char *label, ptls_iovec_t *list, size_t list_max, size_t *nb_objects)
{
    int ret = 0;
    size_t count = 0;

    *nb_objects = 0;

    if (ret == 0) {
        while (count < list_max) {
            ptls_buffer_t buf;

            ptls_buffer_init(&buf, "", 0);

            ret = ptls_get_pem_object_from_memory(mem, label, &buf);

            if (ret == 0) {
                if (buf.off > 0 && buf.is_allocated) {
                    list[count].base = buf.base;
                    list[count].len = buf.off;
                    count++;
                } else {
                    ptls_buffer_dispose(&buf);
                }
            } else {
                ptls_buffer_dispose(&buf);
                break;
            }
        }
    }

    if (ret == PTLS_ERROR_PEM_LABEL_NOT_FOUND && count > 0) {
        ret = 0;
    }

    *nb_objects = count;

    return ret;
}



#define PTLS_MAX_CERTS_IN_CONTEXT 16

int ptls_load_certificates_from_memory(ptls_context_t *ctx, ptls_cred_buffer_t *mem)
{
    int ret = 0;

    ctx->certificates.list = (ptls_iovec_t *)malloc(PTLS_MAX_CERTS_IN_CONTEXT * sizeof(ptls_iovec_t));

    if (ctx->certificates.list == NULL) {
        ret = PTLS_ERROR_NO_MEMORY;
    } else {
        ret = ptls_load_pem_objects_from_memory(mem, "CERTIFICATE", ctx->certificates.list, PTLS_MAX_CERTS_IN_CONTEXT,
                                    &ctx->certificates.count);
    }

    return ret;
}