# Определяем компилятор и флаги
CC = gcc
CFLAGS = -Ilibtmp/include

# Определяем целевые файлы
TARGET = execute_b
LIB_SRC = libtmp/src/libtmp.c
LIB_OBJ = libtmp/src/libtmp.o
SRC = b.c
OBJ = b.o

# Правило по умолчанию
all: $(TARGET)

# Правило для сборки исполняемого файла
$(TARGET): $(OBJ) $(LIB_OBJ)
	$(CC) -o $@ $^ 

# Правило для компиляции a.c
$(OBJ): $(SRC)
	$(CC) $(CFLAGS) -c $<

# Правило для компиляции libtmp.c
$(LIB_OBJ): $(LIB_SRC)
	$(CC) -c $< -o $@

# Правило для очистки скомпилированных файлов
clean:
	rm -f $(OBJ) $(LIB_OBJ) $(TARGET)

.PHONY: all clean
