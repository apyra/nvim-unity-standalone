CXX = g++
CXXFLAGS = -static -std=c++17 -O2 -mwindows
RES = resource.res
SRC = src/main.cpp
OUT = NvimUnity.exe
OBJ = main.o

# Caminho para o arquivo de ícone
ICON = icon.ico

# Passos principais
all: $(OUT)

# Compilar o executável final
$(OUT): $(OBJ) $(RES)
	$(CXX) $(CXXFLAGS) -o $(OUT) $(OBJ) $(RES) -lcomdlg32 -lgdi32

# Compilar o código fonte principal
main.o: $(SRC)
	$(CXX) $(CXXFLAGS) -c $(SRC) -o $(OBJ)

# Compilar o recurso .rc para .res (usando windres)
$(RES): resource.rc
	windres resource.rc -o $(RES)

# Gerar o arquivo .rc com referência ao ícone
resource.rc: $(ICON)
	echo IDI_ICON1 ICON DISCARDABLE \"$(ICON)\" > resource.rc

# Limpeza
clean:
	del /Q $(OUT) $(OBJ) $(RES) resource.rc

