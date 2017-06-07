PROG    = receiver
OBJS    = src/ts.o src/rtp.o src/main.o src/receiver.o src/reactor_udp.o src/reactor_rtp.o src/bits.o src/bitstream.o
CFLAGS  = -Wall -g -Isrc
LDFLAGS = -lreactor -ldynamic -lavformat -lavcodec -lavdevice -lavutil -lm

$(PROG): $(OBJS)
	$(CC) -o $@ $^ $(CFLAGS) $(LDFLAGS)

test: src/bitstream.o src/test.o
	$(CC) -o $@ $^ $(CFLAGS) $(LDFLAGS)

clean:
	rm -f $(PROG) $(OBJS)
