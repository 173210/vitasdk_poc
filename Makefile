PREFIX  = arm-vita-eabi
CC = $(PREFIX)-gcc
AS = $(PREFIX)-as
LDFLAGS = -Wl,-q

.PHONY: all
all: poc.velf

%.velf: %.elf
	vita-elf-create $< $@

poc.elf: unwind-4.o
	$(LINK.o) $^ $(LIBS) $(OUTPUT_OPTION)

.PHONY: clean
clean:
	$(RM) poc.velf poc.elf unwind-4.o
