CC = gcc
CFLAGS = -Wall -I.
AR = ar
ARFLAGS = rcs
SRC = add.c subtract.c multiply.c divide.c main.c
OBJ = $(SRC:.c=.o)
LIB = libarith.a
TARGET_STATIC = main_static
TARGET_SHARED = main_shared

all: static shared

static: $(LIB) $(TARGET_STATIC)

shared: libarith.so $(TARGET_SHARED)

$(LIB): $(OBJ)
	$(AR) $(ARFLAGS) $@ $^

libarith.so: $(OBJ)
	$(CC) -shared -o $@ $^

$(TARGET_STATIC): main.o $(LIB)
	$(CC) main.o -L. -larith -o $@

$(TARGET_SHARED): main.o libarith.so
	$(CC) main.o -o $(TARGET_SHARED) -L. -larith

%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	rm -f $(OBJ) $(LIB) $(TARGET_STATIC) $(TARGET_SHARED) libarith.so

