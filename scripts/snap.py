import os
import subprocess
import sys
from datetime import datetime


def take_screenshot(mode):
    output_dir = os.path.expanduser("~/Pictures/Screenshots/")
    os.makedirs(output_dir, exist_ok=True)

    output_file = f"snapshot_{datetime.now().strftime('%Y-%m-%d_%H-%M-%S')}.png"
    output_path = os.path.join(output_dir, output_file)

    commands = {
        "active": f"grimblast copysave active {output_path}",
        "output": f"grimblast copysave output {output_path}",
        "area": f"grimblast copysave area {output_path}",
    }

    if mode not in commands:
        print(f"Invalid option: {mode}")
        print("Usage: python script.py {active|output|area}")
        sys.exit(1)

    if subprocess.call(commands[mode], shell=True) == 0:
        recent_file = subprocess.getoutput(
            f"find {output_dir} -name 'snapshot_*.png' -printf '%T+ %p\n' | sort -r | head -n 1 | cut -d' ' -f2-"
        )
        subprocess.run(
            [
                "notify-send",
                "Grimblast",
                "Your snapshot has been saved.",
                "-i",
                "document-save",
                "-a",
                "Grimblast",
                "-u",
                "normal",
                f"--action=scriptAction:-xdg-open {output_dir}=Directory",
                f"--action=scriptAction:-xdg-open {recent_file}=View",
            ]
        )


if __name__ == "__main__":
    mode = sys.argv[1] if len(sys.argv) > 1 else "area"
    take_screenshot(mode)
