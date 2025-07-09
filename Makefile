BUILD_DIR := build
CONFIG_STAMP := $(BUILD_DIR)/CMakeCache.txt
EXECUTABLE := $(BUILD_DIR)/clox

.PHONY: all configure build run clean

all: build

configure: $(CONFIG_STAMP)

$(CONFIG_STAMP):
	cmake -S . -B $(BUILD_DIR) -G Ninja \
		-DCMAKE_C_COMPILER=clang \
		-DCMAKE_EXPORT_COMPILE_COMMANDS=ON

build: configure
	cmake --build $(BUILD_DIR)

run: build
	$(EXECUTABLE)

clean:
	rm -rf $(BUILD_DIR)

format:
	clang-format -i src/*.c include/*.h
