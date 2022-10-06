#![cfg_attr(
  all(not(debug_assertions), target_os = "windows"),
  windows_subsystem = "windows"
)]

use std::process::Command;
use tauri::Manager;

fn main() {
  tauri::Builder::default()
    .setup(|app| {
      let _window = app.get_window("main").unwrap();
      Ok(())
    })
    .invoke_handler(tauri::generate_handler![
      execute_commands,
      open_app,
      open_url,
    ])
    .run(tauri::generate_context!())
    .expect("error while running tauri application");
}

#[tauri::command]
fn execute_commands(command: String, args: Vec<String>) {
  let _output = Command::new(command)
    .args(&args)
    .output()
    .expect("Failed to execute command");
}

#[tauri::command]
fn open_app(name: String) {
  let _output = Command::new("open")
    .arg("-a")
    .arg(name)
    .output()
    .expect("Failed to execute command");
}

#[tauri::command]
fn open_url(url: String) {
  let _output = Command::new("open")
    .arg(url)
    .output()
    .expect("Failed to execute command");
}
