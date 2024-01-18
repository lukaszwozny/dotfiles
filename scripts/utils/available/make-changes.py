#!/usr/bin/env python3
import json
import re
import os
import logging
import glob
import shutil
import argparse
from enum import Enum
import secrets


class MakeType(Enum):
    COPY = "COPY"
    REPLACE = "REPLACE"


class App:
    DEFAULT_CHANGES_FILE = "changes-config.json"

    def __init__(self) -> None:
        self._read_args()

    def _read_args(self):
        parser = argparse.ArgumentParser()

        parser.add_argument(
            "-f",
            "--file",
            help="Changes file.",
            default=self.DEFAULT_CHANGES_FILE,
        )
        print("make changes PY")
        args = parser.parse_args()

        print(args)
        os.system("pwd")

        with open(args.file) as f:
            self.changes = json.load(f)

    def start(self):
        for change in self.changes:
            self._make_change(change)
            break

    def _make_change(self, change):
        make_type = change.get("type", "copy")
        make_type = MakeType(make_type.upper())

        match make_type:
            case MakeType.COPY:
                self._make_copy(change)
            case MakeType.REPLACE:
                self._make_replace(change)

    def _make_copy(self, change):
        print(f"  _make_copy()")
        copy_from = change["from"]
        copy_to = change["to"]
        print(f"    from: {copy_from}")
        print(f"    to: {copy_to}")

    def _make_replace(self, change):
        print(f"  _make_replace()")

        file = change["file"]
        items = change["items"]


def main():
    app = App()
    app.start()


if __name__ == "__main__":
    main()
