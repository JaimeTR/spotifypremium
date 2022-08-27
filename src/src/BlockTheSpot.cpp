// BlockTheSpot.cpp : Defines the exported functions for the DLL application.
//

#include "stdafx.h"

void __stdcall LoadAPI (LPVOID* destination, LPCSTR apiName)
{
	if (*destination)
		return;

	char path[MAX_PATH];
	//wchar_t windows[MAX_PATH];
	//GetSystemDirectoryW(windows, MAX_PATH);
	//wsprintf(path, L"%s\\netutils.dll", windows);
	wsprintf (path, ".\\chrome_elf_bak.dll");
	HMODULE hModule = GetModuleHandle (path);
	if (!hModule && !(hModule = LoadLibrary (path)))
		return;
	*destination = GetProcAddress (hModule, apiName);
}

#define API_EXPORT_ORIG(N) \
	static LPVOID _##N = NULL;	\
	char S_##N[] = "" # N; \
	extern "C" __declspec(dllexport) __declspec(naked) void N ## () \
	{ \
		__asm pushad \
		__asm push offset S_##N \
		__asm push offset _##N \
		__asm call LoadAPI \
		__asm popad \
		__asm jmp [_##N] \
	} \


API_EXPORT_ORIG (ClearReportsBetween_ExportThunk)
API_EXPORT_ORIG (CrashForException_ExportThunk)
API_EXPORT_ORIG (DisableHook)
API_EXPORT_ORIG (DrainLog)
API_EXPORT_ORIG (DumpHungProcessWithPtype_ExportThunk)
API_EXPORT_ORIG (DumpProcessWithoutCrash)
API_EXPORT_ORIG (GetApplyHookResult)
API_EXPORT_ORIG (GetBlockedModulesCount)
API_EXPORT_ORIG (GetCrashReports_ExportThunk)
API_EXPORT_ORIG (GetCrashpadDatabasePath_ExportThunk)
API_EXPORT_ORIG (GetHandleVerifier)
API_EXPORT_ORIG (GetInstallDetailsPayload)
API_EXPORT_ORIG (GetUniqueBlockedModulesCount)
API_EXPORT_ORIG (GetUserDataDirectoryThunk)
API_EXPORT_ORIG (InjectDumpForHungInput_ExportThunk)
API_EXPORT_ORIG (IsBrowserProcess)
API_EXPORT_ORIG (IsCrashReportingEnabledImpl)
API_EXPORT_ORIG (IsThirdPartyInitialized)
API_EXPORT_ORIG (RegisterLogNotification)
API_EXPORT_ORIG (RequestSingleCrashUpload_ExportThunk)
API_EXPORT_ORIG (SetCrashKeyValueImpl)
API_EXPORT_ORIG (SetMetricsClientId)
API_EXPORT_ORIG (SetUploadConsent_ExportThunk)
API_EXPORT_ORIG (SignalChromeElf)
API_EXPORT_ORIG (SignalInitializeCrashReporting)

#define API_COPY(M, N) \
	_##N = GetProcAddress(M, #N);


/*
//bool AddDllToBlacklist (const wchar_t* dll_name) { return true; }
void ClearReportsBetween_ExportThunk (time_t begin, time_t end) {}

int CrashForException_ExportThunk (EXCEPTION_POINTERS* info) {
	return UnhandledExceptionFilter (info);
}


void DisableHook () {}

uint32_t DrainLog (uint8_t* buffer,
				   uint32_t buffer_size,
				   uint32_t* log_remaining) {
		return 0;

}

bool DumpHungProcessWithPtype_ExportThunk (HANDLE process_handle,
										   const char* ptype) {
	return false;
}

void DumpProcessWithoutCrash (void* task_port) {}

int32_t GetApplyHookResult () { return 0; }

uint32_t GetBlockedModulesCount () { return 0; }

size_t GetCrashReports_ExportThunk (void* reports,
									size_t reports_size) {
	return 0;
}

const wchar_t* GetCrashpadDatabasePath_ExportThunk () {
	return nullptr;
}

void* GetHandleVerifier () { return NULL; };

const void* GetInstallDetailsPayload () {
	return nullptr;
}

uint32_t GetUniqueBlockedModulesCount () {
	return 0;
}

bool GetUserDataDirectoryThunk (wchar_t* user_data_dir,
								size_t user_data_dir_length,
								wchar_t* invalid_user_data_dir,
								size_t invalid_user_data_dir_length) {
	return true;
}

HANDLE InjectDumpForHungInput_ExportThunk (HANDLE process) {
	return nullptr;
}

bool IsBrowserProcess () {
	return true;
}

bool IsCrashReportingEnabledImpl (const void* local_state) {
	return false;
}
bool IsThirdPartyInitialized () {
	return false;
}

bool RegisterLogNotification (HANDLE event_handle) {
	return false;
}
void RequestSingleCrashUpload_ExportThunk (const char* local_id) {}
void SetCrashKeyValueImpl (const char*, const char*) {}
void SetMetricsClientId (const char* client_id) {}

void SetUploadConsent_ExportThunk (bool consent) {}
void SignalChromeElf () {}
void SignalInitializeCrashReporting () {}
//void SuccessfullyBlocked (const wchar_t** blocked_dlls, int* size) {}

*/