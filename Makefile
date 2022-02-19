# Makefile -- to compile binary config files
.mblaze/mless: .mblaze/mless.in
	lesskey -o $@ .mblaze/mless.in
