#include <iostream>
#include <fstream>
#include <string>
#include <windows.h>
#include "json.hpp"

using json = nlohmann::json;

bool is_shift_pressed() {
    return GetAsyncKeyState(VK_SHIFT) & 0x8000;
}

std::string get_config_folder() {
    const char* appdata = std::getenv("APPDATA");  // Aponta para AppData\Roaming
    if (!appdata) return "";

    std::string folder = std::string(appdata) + "\\NvimUnity";

    // Garante que a pasta exista
    CreateDirectoryA(folder.c_str(), NULL);

    return folder;
}

std::string get_config_path() {
    return get_config_folder() + "\\config.json";
}

json load_or_create_config(const std::string& path) {
    std::ifstream file(path);
    if (!file.is_open()) {
        std::cout << "Config não encontrado. Criando novo...\n";
        json new_config = {
            {"last_project", ""}
        };
        std::ofstream out(path);
        out << new_config.dump(4);
        return new_config;
    }

    json j;
    file >> j;
    return j;
}

int main(int argc, char* argv[]) {
    std::string config_path = get_config_path();  
    json config = load_or_create_config(config_path);

    std::string file = "";
    std::string line = "1";
    std::string nvim_path = "C:\\Program Files\\Neovim\\bin\\nvim.exe";
    if(argc > 1) {
        if(argv[1])
            file = argv[1];
        if(argv[2])
            line = argv[2];
        if (argv[3])
            nvim_path = argv[3];
    }

    std::string root = config.value("last_project", "");
    std::string socket = "\\\\.\\pipe\\unity2025";  

    std::string full_cmd;

    if (is_shift_pressed() && !root.empty()) {
        full_cmd = "cmd /c \"\"" + nvim_path + "\" --listen " + socket + " \"+" + line + "\" \"+cd \"" + root + "\"\" " + file + "\"";
    } else {
        full_cmd = "cmd /c \"\"" + nvim_path + "\" --listen " + socket + " \"+" + line + "\" " + file + "\"";
    }
    
    system(full_cmd.c_str());

    return 0;
}

