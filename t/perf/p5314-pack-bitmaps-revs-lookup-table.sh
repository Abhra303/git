#!/bin/sh

test_description='Tests pack performance using bitmaps (rev index enabled)'
. ./perf-lib.sh
. "${TEST_DIRECTORY}/perf/lib-bitmap.sh"

test_perf_large_repo

pack_bitmap_init_config

test_expect_success 'enable writing rev index' '
	git config pack.writeReverseIndex true
'

test_expect_success 'enable lookup table' '
    git config pack.writeBitmapLookupTable true
'

test_pack_bitmap

test_done
