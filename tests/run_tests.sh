#!/bin/bash

./test_file_count_1.sh
./test_file_count_2_dense.sh
./test_file_count_2_sparse.sh
./test_file_count_3_dense.sh
./test_file_count_3_sparse.sh

./test_reindex_empty_dir.sh
./test_reindex_fixup_all.sh
./test_reindex_no_reindex_needed.sh
