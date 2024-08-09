local CMakeLists = {
	"cmake_minimum_required(VERSION 3.20)",
	"project(Example)",
	"",
	"set(SOURCES src/main.cpp)",
	"",
	"set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${PROJECT_SOURCE_DIR}/bin/lib)",
	"set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${PROJECT_SOURCE_DIR}/bin/lib)",
	"set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${PROJECT_SOURCE_DIR}/bin)",
	"",
	"",
	"",
	"",
	"set(CMAKE_BUILD_TYPE Debug)",
	"set(CMAKE_CXX_FLAGS \"${CMAKE_CXX_FLAGS} -Wall -Wextra -Weffc++ -Wconversion -Wsign-conversion\")",
	"set(CMAKE_EXPORT_COMPILE_COMMANDS ON)",
	"",
	"add_executable(Example ${SOURCES})"
}

local main = {
	"",
	"int main() {}"
}

local buildSystem

local set_compiler = { "set(CMAKE_C_COMPILER \"C:\\\\PROGRA~2\\\\msys64\\\\ucrt64\\\\bin\\\\C__~1.EXE\")", "set(CMAKE_CXX_COMPILER \"C:\\\\PROGRA~2\\\\msys64\\\\ucrt64\\\\bin\\\\C__~1.EXE\")" }

function CMAKEcreateProject(opts)
	local projectName = opts.projectName or "Example"
	local cmakeVersion = opts.cmakeVersion or "3.20"
	local projectType = opts.projectType or "cpp"
	local projectDir = opts.projectDir or "~"
	buildSystem = opts.buildSystem or "Ninja"

	CMakeLists[1] = "cmake_minimum_required(VERSION " .. cmakeVersion .. ")"
	CMakeLists[2] = "project(" .. projectName .. ")"
	CMakeLists[4] = "set(SOURCES src/main." .. projectType .. ")"
	CMakeLists[17] = "add_executable(" .. projectName .. " ${SOURCES})"

	if(vim.fn.has("win32")) then
		CMakeLists[10] = set_compiler[1]
		CMakeLists[11] = set_compiler[2]
	end

	vim.cmd("e " .. projectDir .. "/" .. projectName .. "/" .. "CMakeLists.txt")
	vim.api.nvim_buf_set_lines(0, 0, 0, 0, CMakeLists)
	vim.cmd("w++p")

	vim.cmd("e " .. projectDir .. "/" .. projectName .. "/" .. "src/main." .. projectType)
	vim.api.nvim_buf_set_lines(0, 0, 0, 0, main)
	vim.cmd("w++p")

	vim.cmd("cd " .. projectDir .. "/" .. projectName)
	vim.cmd("%bd|e#|bd#")

	CMAKEbuild()
end

function CMAKEbuild()
	vim.cmd("!cmake -G " .. buildSystem .. " -B build")
	vim.cmd("!cmake --build build")
end
