#
# Doodling
#


# OBJ=list.o interval.o time.o pub.o
OBJ= interval.o \
	pub.o \
	time.o \
	sub.o \
	circular_buffer.o \
	rmc_connection.o \
	rmc_sub_packet.o \
	rmc_pub_packet.o \
	rmc_sub_ctx.o \
	rmc_pub_ctx.o \
	rmc_sub_read.o \
	rmc_pub_read.o \
	rmc_sub_write.o \
	rmc_pub_write.o \
	rmc_pub_timeout.o \
	rmc_sub_timeout.o 

TEST_OBJ = interval_test.o \
	rmc_proto_test_common.o \
	rmc_proto_test_pub.o \
	rmc_proto_test_sub.o \
	pub_test.o \
	list_test.o \
	rmc_test.o \
	sub_test.o \
	circular_buffer_test.o

HDR= rmc_common.h \
	rmc_list_template.h \
	rmc_pub.h \
	interval.h \
	rmc_proto.h \
	rmc_sub.h \
	circular_buffer.h

CFLAGS = -g
.PHONY: all clean


all: $(OBJ) rmc_test

rmc_test: $(OBJ) $(TEST_OBJ)
	$(CC) $(CFLAGS) $^ -o $@

clean:
	rm -f $(OBJ) *~ rmc_test.o rmc_test $(TEST_OBJ)

$(OBJ): $(HDR)

$(TEST_OBJ): $(HDR)
