BASE_SIZE := 85
SIZES := 16 24 32 48 64 128 170 256 340 512 680 1024 

.PHONY: all _all
all: _all
ALL :=

ALL += icon-16.png
icon-16.png: icon-$(BASE_SIZE).png scale-icons.sh
	@./scale-icons.sh icon-$(BASE_SIZE).png icon-16.png 16 $(BASE_SIZE)
ALL += icon-24.png
icon-24.png: icon-$(BASE_SIZE).png scale-icons.sh
	@./scale-icons.sh icon-$(BASE_SIZE).png icon-24.png 24 $(BASE_SIZE)
ALL += icon-32.png
icon-32.png: icon-$(BASE_SIZE).png scale-icons.sh
	@./scale-icons.sh icon-$(BASE_SIZE).png icon-32.png 32 $(BASE_SIZE)
ALL += icon-48.png
icon-48.png: icon-$(BASE_SIZE).png scale-icons.sh
	@./scale-icons.sh icon-$(BASE_SIZE).png icon-48.png 48 $(BASE_SIZE)
ALL += icon-64.png
icon-64.png: icon-$(BASE_SIZE).png scale-icons.sh
	@./scale-icons.sh icon-$(BASE_SIZE).png icon-64.png 64 $(BASE_SIZE)
ALL += icon-128.png
icon-128.png: icon-$(BASE_SIZE).png scale-icons.sh
	@./scale-icons.sh icon-$(BASE_SIZE).png icon-128.png 128 $(BASE_SIZE)
ALL += icon-170.png
icon-170.png: icon-$(BASE_SIZE).png scale-icons.sh
	@./scale-icons.sh icon-$(BASE_SIZE).png icon-170.png 170 $(BASE_SIZE)
ALL += icon-256.png
icon-256.png: icon-$(BASE_SIZE).png scale-icons.sh
	@./scale-icons.sh icon-$(BASE_SIZE).png icon-256.png 256 $(BASE_SIZE)
ALL += icon-340.png
icon-340.png: icon-$(BASE_SIZE).png scale-icons.sh
	@./scale-icons.sh icon-$(BASE_SIZE).png icon-340.png 340 $(BASE_SIZE)
ALL += icon-512.png
icon-512.png: icon-$(BASE_SIZE).png scale-icons.sh
	@./scale-icons.sh icon-$(BASE_SIZE).png icon-512.png 512 $(BASE_SIZE)
ALL += icon-680.png
icon-680.png: icon-$(BASE_SIZE).png scale-icons.sh
	@./scale-icons.sh icon-$(BASE_SIZE).png icon-680.png 680 $(BASE_SIZE)
ALL += icon-1024.png
icon-1024.png: icon-$(BASE_SIZE).png scale-icons.sh
	@./scale-icons.sh icon-$(BASE_SIZE).png icon-1024.png 1024 $(BASE_SIZE)

_all: $(ALL)
