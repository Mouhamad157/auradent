//
//  Generated file. Do not edit.
//

// clang-format off

#include "generated_plugin_registrant.h"

#include <file_selector_linux/file_selector_plugin.h>
#include <screen_retriever/screen_retriever_plugin.h>
#include <smart_auth/smart_auth_plugin.h>
#include <window_manager/window_manager_plugin.h>

void fl_register_plugins(FlPluginRegistry* registry) {
  g_autoptr(FlPluginRegistrar) file_selector_linux_registrar =
      fl_plugin_registry_get_registrar_for_plugin(registry, "FileSelectorPlugin");
  file_selector_plugin_register_with_registrar(file_selector_linux_registrar);
  g_autoptr(FlPluginRegistrar) screen_retriever_registrar =
      fl_plugin_registry_get_registrar_for_plugin(registry, "ScreenRetrieverPlugin");
  screen_retriever_plugin_register_with_registrar(screen_retriever_registrar);
  g_autoptr(FlPluginRegistrar) smart_auth_registrar =
      fl_plugin_registry_get_registrar_for_plugin(registry, "SmartAuthPlugin");
  smart_auth_plugin_register_with_registrar(smart_auth_registrar);
  g_autoptr(FlPluginRegistrar) window_manager_registrar =
      fl_plugin_registry_get_registrar_for_plugin(registry, "WindowManagerPlugin");
  window_manager_plugin_register_with_registrar(window_manager_registrar);
}
