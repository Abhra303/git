#!/bin/sh

test_description='Tests pack performance using bitmaps'
. ./perf-lib.sh
. "${TEST_DIRECTORY}/perf/lib-bitmap.sh"

test_lookup_pack_bitmap () {
	pack_bitmap_init_config

	test_perf "enable lookup table: $1" '
		git config pack.writeBitmapLookupTable '"$1"'
	'

	test_pack_bitmap
}

test_lookup_pack_bitmap false
test_lookup_pack_bitmap true

test_done
