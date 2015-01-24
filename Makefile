default: install

install:
	mkdir -p ~/.git-graph
	cp post-commit ~/.git-graph
	cp graphize /usr/local/sbin

