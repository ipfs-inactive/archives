OUTPUTDIR?=./public

ifeq ($(DEBUG), true)
	PREPEND=
	APPEND=
else
	PREPEND=@
	APPEND=1>/dev/null
endif

build: clean
	$(PREPEND)mkdir -vp public/ $(APPEND)
	$(PREPEND)cp -avx index.html logo.svg bootstrap.min.css public/ $(APPEND)
	$(PREPEND)echo "Built website to $(OUTPUTDIR)"

clean:
	$(PREPEND)[ ! -d $(OUTPUTDIR) ] || rm -rvf $(OUTPUTDIR) $(APPEND)

.PHONY: build clean
