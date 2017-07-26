NAME?=skel
LIBNAME?=$(NAME)
GIT?=yes
ROOT?=../

skeleton:
	mkdir -p $(ROOT)/$(NAME)/bin $(ROOT)/$(NAME)/src $(ROOT)/$(NAME)/tests
	touch $(ROOT)/$(NAME)/LICENSE $(ROOT)/$(NAME)/README.md $(ROOT)/$(NAME)/TODO.txt $(ROOT)/$(NAME)/BUGS.txt
	cp SkelFiles/dbg.h $(ROOT)/$(NAME)/src/
	cp SkelFiles/Makefile $(ROOT)/$(NAME)/Makefile
	cp SkelFiles/runtests.sh $(ROOT)/$(NAME)/tests/runtests.sh
	cp SkelFiles/minunit.h $(ROOT)/$(NAME)/tests/minunit.h
	cp SkelFiles/.colors.mk $(ROOT)/$(NAME)/.colors.mk
	cp SkelFiles/.ycm_extra_conf.py $(ROOT)/$(NAME)/.ycm_extra_conf.py
	sed -i '' 's/LIBRARY/$(LIBNAME)/g' $(ROOT)/$(NAME)/Makefile
	touch $(ROOT)/$(NAME)/TODO.txt
ifeq ($(GIT),yes)
	cd $(ROOT)/$(NAME) && git init && git add -A && git commit -m "Initial commit"
endif
