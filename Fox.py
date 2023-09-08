import win32com.client

def get_all_devices():
    devices = []
    wmi = win32com.client.GetObject("winmgmts:")
    for item in wmi.InstancesOf("Win32_PnPEntity"):
        devices.append(item.Caption)
    return devices

if __name__ == "__main__":
    all_devices = get_all_devices()
    for i, device in enumerate(all_devices, start=1):
        print(f"{i}. {device}")



# устонови зависемости:pip install pywin32
